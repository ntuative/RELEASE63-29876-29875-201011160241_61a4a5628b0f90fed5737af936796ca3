package com.sulake.core.communication.connection
{
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.encryption.IEncryption;
   import com.sulake.core.communication.messages.IMessageClassManager;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.core.communication.messages.MessageClassManager;
   import com.sulake.core.communication.messages.MessageDataWrapper;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.ErrorReportStorage;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.Socket;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class SocketConnection extends EventDispatcher implements IConnection, IDisposable
   {
      
      public static const const_1252:int = 10000;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1503:Boolean = false;
      
      private var var_70:Socket;
      
      private var var_965:IEncryption;
      
      private var var_631:int;
      
      private var var_419:ByteArray;
      
      private var _id:String;
      
      private var var_268:ICoreCommunicationManager;
      
      private var var_293:Timer;
      
      private var var_418:IConnectionStateListener;
      
      private var var_630:IProtocol;
      
      private var var_966:IMessageClassManager;
      
      public function SocketConnection(param1:String, param2:ICoreCommunicationManager, param3:IConnectionStateListener)
      {
         super();
         this._id = param1;
         this.var_268 = param2;
         this.var_419 = new ByteArray();
         this.var_966 = new MessageClassManager();
         this.var_70 = new Socket();
         this.var_293 = new Timer(const_1252,1);
         this.var_293.addEventListener(TimerEvent.TIMER,this.onTimeOutTimer);
         this.var_70.addEventListener(Event.CONNECT,this.onConnect);
         this.var_70.addEventListener(Event.COMPLETE,this.onComplete);
         this.var_70.addEventListener(Event.CLOSE,this.onClose);
         this.var_70.addEventListener(ProgressEvent.SOCKET_DATA,this.onRead);
         this.var_70.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
         this.var_70.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         this.var_418 = param3;
      }
      
      private function onTimeOutTimer(param1:TimerEvent) : void
      {
         this.var_293.stop();
         this.logConnection("[SocketConnection] TimeOut Error");
         ErrorReportStorage.addDebugData("ConnectionTimer","TimeOut in " + (getTimer() - this.var_631));
         var _loc2_:IOErrorEvent = new IOErrorEvent(IOErrorEvent.IO_ERROR);
         _loc2_.text = "Socket Timeout (" + this.var_293.delay + " ms). Possible Firewall.";
         dispatchEvent(_loc2_);
      }
      
      public function setEncryption(param1:IEncryption) : void
      {
         this.var_965 = param1;
      }
      
      public function get connected() : Boolean
      {
         return this.var_70.connected;
      }
      
      private function onConnect(param1:Event) : void
      {
         this.logConnection("[SocketConnection] Connected");
         this.var_293.stop();
         this.var_1503 = true;
         ErrorReportStorage.addDebugData("ConnectionTimer","Connected in " + (getTimer() - this.var_631));
         dispatchEvent(param1);
      }
      
      public function send(param1:IMessageComposer, param2:int = -1) : Boolean
      {
         if(this.disposed)
         {
            return false;
         }
         var _loc3_:ByteArray = new ByteArray();
         var _loc4_:int = this.var_966.getMessageComposerID(param1);
         if(_loc4_ < 0)
         {
            this.logConnection("Could not find registered message composer for " + param1);
            return false;
         }
         var _loc5_:ByteArray = this.var_630.encoder.encode(_loc4_,param1.getMessageArray(),param2);
         if(this.var_418)
         {
            this.var_418.messageSent(String(_loc4_),_loc5_.toString());
         }
         if(this.var_965 != null)
         {
            _loc3_ = this.var_965.encipher(_loc5_);
         }
         else
         {
            _loc3_ = _loc5_;
         }
         this.logConnection("<<[SOCKET OUT]: " + [_loc4_,param1.getMessageArray(),"->",_loc3_]);
         if(this.var_70.connected)
         {
            this.var_70.writeBytes(_loc3_);
            this.var_70.flush();
            return true;
         }
         this.logConnection("[SOCKET] Not connected.");
         return false;
      }
      
      public function init(param1:String, param2:uint = 0) : Boolean
      {
         if(this.var_418)
         {
            this.var_418.connectionInit(param1,param2);
         }
         Security.loadPolicyFile("xmlsocket://" + param1 + ":" + param2);
         this.var_293.start();
         this.var_631 = getTimer();
         this.var_70.connect(param1,param2);
         return true;
      }
      
      private function onRead(param1:ProgressEvent) : void
      {
         if(!this.var_70)
         {
            return;
         }
         while(this.var_70.bytesAvailable > 0)
         {
            this.var_419.writeByte(this.var_70.readUnsignedByte());
         }
      }
      
      public function get protocol() : IProtocol
      {
         return this.var_630;
      }
      
      public function addMessageEvent(param1:IMessageEvent) : void
      {
         this.var_268.addConnectionMessageEvent(this._id,param1);
      }
      
      public function dispose() : void
      {
         this._disposed = true;
         if(this.var_70)
         {
            this.var_70.removeEventListener(Event.CONNECT,this.onConnect);
            this.var_70.removeEventListener(Event.COMPLETE,this.onComplete);
            this.var_70.removeEventListener(Event.CLOSE,this.onClose);
            this.var_70.removeEventListener(ProgressEvent.SOCKET_DATA,this.onRead);
            this.var_70.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            this.var_70.removeEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            if(this.var_1503)
            {
               this.var_70.close();
            }
         }
         this.var_70 = null;
         this.var_419 = null;
         this.var_418 = null;
         this.var_965 = null;
         this.var_630 = null;
         this._id = null;
         this.var_966 = null;
         this.var_268 = null;
         this.var_418 = null;
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         this.var_293.stop();
         this.logConnection("[SocketConnection] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("ConnectionTimer","SecurityError in " + (getTimer() - this.var_631));
         dispatchEvent(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function registerMessageClasses(param1:IMessageConfiguration) : void
      {
         this.var_966.registerMessages(param1);
      }
      
      public function set protocol(param1:IProtocol) : void
      {
         this.var_630 = param1;
      }
      
      private function onComplete(param1:Event) : void
      {
         this.var_293.stop();
         this.logConnection("[SocketConnection] Complete");
         ErrorReportStorage.addDebugData("ConnectionTimer","Completed in " + (getTimer() - this.var_631));
         dispatchEvent(param1);
      }
      
      public function processReceivedData() : void
      {
         var id:int = 0;
         var message:Array = null;
         var data:ByteArray = null;
         var eventClasses:Array = null;
         var events:Array = null;
         var eventClass:Class = null;
         var parserInstance:IMessageParser = null;
         var parserClassCurrent:Class = null;
         var messageEventInstance:IMessageEvent = null;
         var eventsForClass:Array = null;
         var parserClass:Class = null;
         var wasParsed:Boolean = false;
         var dataClone:ByteArray = null;
         var dataWrapper:IMessageDataWrapper = null;
         var temp:ByteArray = null;
         if(this.disposed)
         {
            return;
         }
         var receivedMessages:Array = new Array();
         var offset:uint = this.var_630.getMessages(this.var_419,receivedMessages);
         var time:Number = new Date().getTime();
         try
         {
            for each(message in receivedMessages)
            {
               id = message[0] as int;
               data = message[1] as ByteArray;
               if(this.var_418)
               {
                  this.var_418.messageReceived(String(id),data.toString());
               }
               this.logConnection(">>[SOCKET IN] timestamp:" + getTimer() + " Received message id: " + id + " data: " + data.toString());
               eventClasses = this.var_966.getMessageEventClasses(id);
               events = new Array();
               for each(eventClass in eventClasses)
               {
                  eventsForClass = this.var_268.getMessageEvents(this,eventClass);
                  events = events.concat(eventsForClass);
               }
               if(events.length == 0)
               {
                  this.logConnection(">>[SocketConnection] No message event listeners defined for id: " + id);
               }
               parserInstance = null;
               parserClassCurrent = null;
               for each(messageEventInstance in events)
               {
                  parserClass = messageEventInstance.parserClass;
                  if(parserClass == null)
                  {
                     this.logConnection(">>[SocketConnection] Message Event Has no parser defined, use annotation?: " + [id,messageEventInstance]);
                  }
                  else
                  {
                     wasParsed = false;
                     if(parserClass != parserClassCurrent)
                     {
                        dataClone = new ByteArray();
                        dataClone.writeBytes(data);
                        dataClone.position = data.position;
                        dataWrapper = new MessageDataWrapper(dataClone,this.protocol.decoder);
                        parserInstance = this.var_268.getMessageParser(parserClass);
                        if(!parserInstance.flush())
                        {
                           this.logConnection(">>[SocketConnection] Message Event Parser wasn\'t flushed: " + [id,parserClass,parserInstance]);
                        }
                        else if(parserInstance.parse(dataWrapper))
                        {
                           parserClassCurrent = parserClass;
                           wasParsed = true;
                        }
                     }
                     else
                     {
                        wasParsed = true;
                     }
                     if(wasParsed)
                     {
                        messageEventInstance.connection = this;
                        messageEventInstance.parser = parserInstance;
                        messageEventInstance.callback.call(null,messageEventInstance);
                     }
                     else
                     {
                        this.logConnection(">>[SocketConnection] Could not parse message: " + [id,eventClass,messageEventInstance]);
                        parserClassCurrent = null;
                        parserInstance = null;
                     }
                  }
               }
            }
            if(offset == this.var_419.length)
            {
               this.var_419 = new ByteArray();
            }
            else if(offset > 0)
            {
               temp = new ByteArray();
               temp.writeBytes(this.var_419,offset);
               this.var_419 = temp;
               this.logConnection("[SOCKET REST] offset: " + offset + " rest: " + this.var_419.toString());
            }
         }
         catch(e:Error)
         {
            if(!disposed)
            {
               ErrorReportStorage.addDebugData("SocketConnection","Crashed while processing incoming message with id=\"" + id + "\"!");
               throw e;
            }
         }
      }
      
      public function set timeout(param1:int) : void
      {
         this.var_293.delay = param1;
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         this.var_293.stop();
         this.logConnection("[SocketConnection] IO Error: " + param1.text);
         ErrorReportStorage.addDebugData("ConnectionTimer","IOError in " + (getTimer() - this.var_631));
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         dispatchEvent(param1);
      }
      
      private function onClose(param1:Event) : void
      {
         this.var_293.stop();
         this.logConnection("[SocketConnection] Closed");
         this.var_1503 = false;
         ErrorReportStorage.addDebugData("ConnectionTimer","Closed in " + (getTimer() - this.var_631));
         dispatchEvent(param1);
      }
      
      private function logConnection(param1:String) : void
      {
      }
      
      override public function toString() : String
      {
         var _loc1_:* = "";
         _loc1_ += "Socket Connection: \n";
         _loc1_ += "Protocol Encoder: " + this.var_630.encoder + "\n";
         _loc1_ += "Protocol Decoder: " + this.var_630.decoder + "\n";
         return _loc1_ + ("Encryption: " + this.var_965 + "\n");
      }
   }
}