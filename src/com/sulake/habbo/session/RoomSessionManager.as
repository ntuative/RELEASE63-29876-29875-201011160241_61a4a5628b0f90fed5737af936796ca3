package com.sulake.habbo.session
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.handler.AvatarEffectsHandler;
   import com.sulake.habbo.session.handler.BaseHandler;
   import com.sulake.habbo.session.handler.GenericErrorHandler;
   import com.sulake.habbo.session.handler.LidoHandler;
   import com.sulake.habbo.session.handler.PlaceObjectErrorHandler;
   import com.sulake.habbo.session.handler.PollHandler;
   import com.sulake.habbo.session.handler.PresentHandler;
   import com.sulake.habbo.session.handler.RoomChatHandler;
   import com.sulake.habbo.session.handler.RoomDataHandler;
   import com.sulake.habbo.session.handler.RoomDimmerPresetsHandler;
   import com.sulake.habbo.session.handler.RoomPermissionsHandler;
   import com.sulake.habbo.session.handler.RoomSessionHandler;
   import com.sulake.habbo.session.handler.RoomUsersHandler;
   import com.sulake.habbo.session.handler.TeleportErrorHandler;
   import com.sulake.habbo.session.handler.VoteHandler;
   import com.sulake.habbo.tracking.IHabboTracking;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboTracking;
   
   public class RoomSessionManager extends Component implements IRoomSessionManager, IRoomHandlerListener
   {
       
      
      private var _connection:IConnection = null;
      
      private var var_851:Boolean = false;
      
      private var var_1653:Boolean = false;
      
      private var var_1277:Boolean = false;
      
      private var var_83:Array = null;
      
      private var var_2346:int = 0;
      
      private var var_1652:String = "";
      
      private var _communication:IHabboCommunicationManager = null;
      
      private var var_2344:Boolean = false;
      
      private var var_2345:Boolean = false;
      
      private var _habboTracking:IHabboTracking;
      
      private var var_198:Map = null;
      
      public function RoomSessionManager(param1:IContext, param2:uint = 0)
      {
         super(param1,param2);
         this.var_83 = [];
         this.var_198 = new Map();
         queueInterface(new IIDHabboCommunicationManager(),this.communicationReady);
         queueInterface(new IIDHabboTracking(),this.trackingReady);
      }
      
      private function createHandlers() : void
      {
         if(this._connection == null)
         {
            return;
         }
         this.var_83.push(new RoomSessionHandler(this._connection,this));
         this.var_83.push(new RoomChatHandler(this._connection,this));
         this.var_83.push(new RoomUsersHandler(this._connection,this));
         this.var_83.push(new RoomPermissionsHandler(this._connection,this));
         this.var_83.push(new AvatarEffectsHandler(this._connection,this));
         this.var_83.push(new RoomDataHandler(this._connection,this));
         this.var_83.push(new PresentHandler(this._connection,this));
         this.var_83.push(new PlaceObjectErrorHandler(this._connection,this));
         this.var_83.push(new TeleportErrorHandler(this._connection,this));
         this.var_83.push(new GenericErrorHandler(this._connection,this));
         this.var_83.push(new PollHandler(this._connection,this));
         this.var_83.push(new VoteHandler(this._connection,this));
         this.var_83.push(new LidoHandler(this._connection,this));
         this.var_83.push(new RoomDimmerPresetsHandler(this._connection,this));
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
            this.createHandlers();
            this.initializeManager();
         }
      }
      
      public function get sessionStarting() : Boolean
      {
         return this.var_1277;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         super.dispose();
         if(this._communication != null)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this._habboTracking != null)
         {
            this._habboTracking.release(new IIDHabboTracking());
            this._habboTracking = null;
         }
         this._connection = null;
         if(this.var_198)
         {
            while(this.var_198.length > 0)
            {
               _loc1_ = this.var_198.getKey(0) as String;
               _loc2_ = this.var_198.remove(_loc1_) as RoomSession;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
            }
            this.var_198.dispose();
            this.var_198 = null;
         }
         if(this.var_83)
         {
            _loc3_ = 0;
            while(_loc3_ < this.var_83.length)
            {
               _loc4_ = this.var_83[_loc3_] as IDisposable;
               if(_loc4_)
               {
                  _loc4_.dispose();
               }
               _loc3_++;
            }
            this.var_83 = null;
         }
      }
      
      public function sessionUpdate(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:IRoomSession = this.getSession(param1,param2);
         if(_loc4_ != null)
         {
            switch(param3)
            {
               case RoomSessionHandler.const_1078:
                  break;
               case RoomSessionHandler.const_1058:
                  break;
               case RoomSessionHandler.const_576:
                  this.disposeSession(param1,param2);
            }
         }
      }
      
      private function trackingReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._habboTracking = param2 as IHabboTracking;
      }
      
      public function sessionReinitialize(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:* = null;
         var _loc5_:String = this.getRoomIdentifier(param1,param2);
         var _loc6_:RoomSession = this.var_198.remove(_loc5_) as RoomSession;
         if(_loc6_ != null)
         {
            param4 = param2;
            _loc6_.reset(param3,param4);
            _loc5_ = this.getRoomIdentifier(param3,param4);
            _loc7_ = this.var_198.remove(_loc5_);
            if(_loc7_ != null)
            {
            }
            this.var_198.add(_loc5_,_loc6_);
            this.updateHandlers(_loc6_);
         }
      }
      
      public function set roomEngineReady(param1:Boolean) : void
      {
         this.var_2344 = param1;
         this.initializeManager();
      }
      
      public function get initialized() : Boolean
      {
         if(this.var_851 && this.var_2344)
         {
            return true;
         }
         return false;
      }
      
      private function updateHandlers(param1:IRoomSession) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1 != null && this.var_83 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < this.var_83.length)
            {
               _loc3_ = this.var_83[_loc2_] as BaseHandler;
               if(_loc3_ != null)
               {
                  _loc3_._xxxRoomId = param1.roomId;
                  _loc3_._xxxRoomCategory = param1.roomCategory;
               }
               _loc2_++;
            }
         }
      }
      
      private function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
      
      public function startSession(param1:IRoomSession) : Boolean
      {
         if(param1.state == RoomSessionEvent.const_87)
         {
            return false;
         }
         if(param1.start())
         {
            this.var_1277 = false;
            events.dispatchEvent(new RoomSessionEvent(RoomSessionEvent.const_87,param1));
            this.updateHandlers(param1);
            return true;
         }
         this.disposeSession(param1.roomId,param1.roomCategory);
         this.var_1277 = false;
         return false;
      }
      
      public function gotoRoom(param1:Boolean, param2:int, param3:String = "", param4:String = "") : Boolean
      {
         if(!this.initialized)
         {
            this.var_1653 = true;
            this.var_2345 = param1;
            this.var_2346 = param2;
            this.var_1652 = param3;
            return false;
         }
         var _loc5_:int = 0;
         if(param1)
         {
            _loc5_ = 1;
         }
         var _loc6_:String = this.getRoomIdentifier(param2,_loc5_);
         this.var_1277 = true;
         if(this.var_198.getValue(_loc6_) != null)
         {
            this.disposeSession(param2,_loc5_);
         }
         var _loc7_:RoomSession = new RoomSession(param2,_loc5_,this._habboTracking,param3,param4);
         _loc7_.connection = this._connection;
         this.var_198.add(_loc6_,_loc7_);
         events.dispatchEvent(new RoomSessionEvent(RoomSessionEvent.const_240,_loc7_));
         return true;
      }
      
      private function communicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._communication = param2 as IHabboCommunicationManager;
         if(this._communication != null)
         {
            this._connection = this._communication.getHabboMainConnection(this.onConnectionReady);
            if(this._connection != null)
            {
               this.onConnectionReady(this._connection);
            }
         }
      }
      
      public function getSession(param1:int, param2:int) : IRoomSession
      {
         var _loc3_:String = this.getRoomIdentifier(param1,param2);
         return this.var_198.getValue(_loc3_) as IRoomSession;
      }
      
      public function disposeSession(param1:int, param2:int) : void
      {
         var _loc3_:String = this.getRoomIdentifier(param1,param2);
         var _loc4_:RoomSession = this.var_198.remove(_loc3_) as RoomSession;
         if(_loc4_ != null)
         {
            events.dispatchEvent(new RoomSessionEvent(RoomSessionEvent.const_94,_loc4_));
            _loc4_.dispose();
         }
      }
      
      private function initializeManager() : void
      {
         if(this._communication != null)
         {
            this.var_851 = true;
         }
         if(this.initialized && this.var_1653)
         {
            this.gotoRoom(this.var_2345,this.var_2346,this.var_1652);
            this.var_1653 = false;
            this.var_1652 = "";
         }
      }
   }
}
