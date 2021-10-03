package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_1256:String;
      
      private var _disposed:Boolean;
      
      private var var_1497:String;
      
      private var var_1257:int;
      
      private var var_45:ModerationManager;
      
      private var var_960:IDropMenuWindow;
      
      private var var_452:ITextFieldWindow;
      
      private var _frame:IFrameWindow;
      
      private var var_565:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         this.var_45 = param1;
         this.var_1257 = param2;
         this.var_1497 = param3;
         this.var_1256 = param4;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_270)
         {
            return;
         }
         if(!this.var_565)
         {
            return;
         }
         this.var_452.text = "";
         this.var_565 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
      
      public function getId() : String
      {
         return this.var_1497;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(this.var_565 || this.var_452.text == "")
         {
            this.var_45.windowManager.alert("Alert","You must input a message to the user",0,this.onAlertClose);
            return;
         }
         this.var_45.connection.send(new ModMessageMessageComposer(this.var_1257,this.var_452.text,this.var_1256));
         this.dispose();
      }
      
      public function show() : void
      {
         this._frame = IFrameWindow(this.var_45.getXmlWindow("send_msgs"));
         this._frame.caption = "Msg To: " + this.var_1497;
         this._frame.findChildByName("send_message_but").procedure = this.onSendMessageButton;
         this.var_452 = ITextFieldWindow(this._frame.findChildByName("message_input"));
         this.var_452.procedure = this.onInputClick;
         this.var_960 = IDropMenuWindow(this._frame.findChildByName("msgTemplatesSelect"));
         this.prepareMsgSelect(this.var_960);
         this.var_960.procedure = this.onSelectTemplate;
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
         this._frame.visible = true;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + this.var_45.initMsg.messageTemplates.length);
         param1.populate(this.var_45.initMsg.messageTemplates);
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this._frame != null)
         {
            this._frame.destroy();
            this._frame = null;
         }
         this.var_960 = null;
         this.var_452 = null;
         this.var_45 = null;
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_59)
         {
            return;
         }
         var _loc3_:String = this.var_45.initMsg.messageTemplates[this.var_960.selection];
         if(_loc3_ != null)
         {
            this.var_565 = false;
            this.var_452.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1245;
      }
   }
}
