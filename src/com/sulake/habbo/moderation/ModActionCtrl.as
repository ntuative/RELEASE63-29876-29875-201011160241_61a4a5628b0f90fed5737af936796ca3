package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.INamed;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModAlertMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModBanMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModKickMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class ModActionCtrl implements IDisposable, TrackedWindow
   {
      
      private static var var_105:Array;
       
      
      private var _disposed:Boolean;
      
      private var var_1015:IButtonWindow;
      
      private var var_1257:int;
      
      private var var_45:ModerationManager;
      
      private var var_822:OffenceCategoryData;
      
      private var var_452:ITextFieldWindow;
      
      private var var_1014:IButtonWindow;
      
      private var var_1256:String;
      
      private var var_565:Boolean = true;
      
      private var var_1497:String;
      
      private var var_1016:IDropMenuWindow;
      
      private var _frame:IFrameWindow;
      
      private var var_823:OffenceData;
      
      public function ModActionCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         this.var_45 = param1;
         this.var_1257 = param2;
         this.var_1497 = param3;
         this.var_1256 = param4;
         if(var_105 == null)
         {
            var_105 = new Array();
            var_105.push(new BanDefinition("2 hours",2));
            var_105.push(new BanDefinition("4 hours",4));
            var_105.push(new BanDefinition("12 hours",12));
            var_105.push(new BanDefinition("24 hours",24));
            var_105.push(new BanDefinition("2 days",48));
            var_105.push(new BanDefinition("3 days",72));
            var_105.push(new BanDefinition("1 week",168));
            var_105.push(new BanDefinition("2 weeks",336));
            var_105.push(new BanDefinition("3 weeks",504));
            var_105.push(new BanDefinition("1 month",720));
            var_105.push(new BanDefinition("2 months",1440));
            var_105.push(new BanDefinition("1 year",8760));
            var_105.push(new BanDefinition("2 years",17520));
            var_105.push(new BanDefinition("Permanent",100000));
         }
         this.var_1015 = IButtonWindow(this.var_45.getXmlWindow("modact_offence"));
         this.var_1014 = IButtonWindow(this.var_45.getXmlWindow("modact_offencectg"));
      }
      
      public static function hideChildren(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
      }
      
      private function onBanButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Ban...");
         if(!this.isMsgGiven())
         {
            return;
         }
         if(this.var_1016.selection < 0)
         {
            this.var_45.windowManager.alert("Alert","You must select ban lenght",0,this.onAlertClose);
            return;
         }
         this.var_45.connection.send(new ModBanMessageComposer(this.var_1257,this.var_452.text,this.getBanLength(),this.var_1256));
         this.dispose();
      }
      
      public function getId() : String
      {
         return this.var_1497;
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
      
      private function getBanLength() : int
      {
         var _loc1_:int = this.var_1016.selection;
         var _loc2_:BanDefinition = var_105[_loc1_];
         return _loc2_.banLengthHours;
      }
      
      private function prepareBanSelect(param1:IDropMenuWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_105)
         {
            _loc2_.push(_loc3_.name);
         }
         param1.populate(_loc2_);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function refreshButtons(param1:String, param2:int, param3:Array, param4:IWindow, param5:Function) : void
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc6_:IWindowContainer = IWindowContainer(this._frame.findChildByName(param1));
         hideChildren(_loc6_);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         for each(_loc11_ in param3)
         {
            _loc12_ = "" + _loc7_;
            _loc13_ = IButtonWindow(_loc6_.findChildByName(_loc12_));
            if(_loc13_ == null)
            {
               _loc13_ = IButtonWindow(param4.clone());
               _loc13_.procedure = param5;
               _loc13_.x = _loc9_ * (param4.width + 5);
               _loc13_.y = _loc8_ * (param4.height + 5);
               _loc13_.name = _loc12_;
               _loc6_.addChild(_loc13_);
            }
            _loc13_.caption = _loc11_.name;
            _loc13_.visible = true;
            _loc7_++;
            _loc9_++;
            if(_loc9_ >= param2)
            {
               _loc9_ = 0;
               _loc8_++;
            }
         }
         _loc6_.height = RoomToolCtrl.getLowestPoint(_loc6_);
         _loc6_.visible = true;
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
         if(this.var_1015 != null)
         {
            this.var_1015.destroy();
            this.var_1015 = null;
         }
         if(this.var_1014 != null)
         {
            this.var_1014.destroy();
            this.var_1014 = null;
         }
         this.var_1016 = null;
         this.var_452 = null;
         this.var_45 = null;
      }
      
      private function onSendCautionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending caution...");
         if(!this.isMsgGiven())
         {
            return;
         }
         this.var_45.connection.send(new ModAlertMessageComposer(this.var_1257,this.var_452.text,this.var_1256));
         this.dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1404;
      }
      
      private function onChangeCategorizationButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this.var_823 != null)
         {
            this.var_823 = null;
         }
         else
         {
            this.var_822 = null;
         }
         this.refreshCategorization();
      }
      
      private function onOffenceCtgButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         this.var_822 = this.var_45.initMsg.offenceCategories[_loc3_];
         this.refreshCategorization();
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
      
      private function isMsgGiven() : Boolean
      {
         if(this.var_565 || this.var_452.text == "")
         {
            this.var_45.windowManager.alert("Alert","You must input a message to the user",0,this.onAlertClose);
            return false;
         }
         return true;
      }
      
      private function onKickButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Kick...");
         if(!this.isMsgGiven())
         {
            return;
         }
         this.var_45.connection.send(new ModKickMessageComposer(this.var_1257,this.var_452.text,this.var_1256));
         this.dispose();
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      public function refreshCategorization() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(this._frame.findChildByName("categorization_cont"));
         hideChildren(_loc1_);
         _loc1_.findChildByName("categorization_caption_txt").visible = true;
         _loc1_.findChildByName("change_categorization_but").visible = this.var_822 != null;
         if(this.var_823 != null)
         {
            this._frame.findChildByName("offence_txt").caption = this.var_823.name;
            this._frame.findChildByName("offence_category").visible = true;
         }
         else if(this.var_822 != null)
         {
            this.refreshButtons("offences_cont",2,this.var_822.offences,this.var_1015,this.onOffenceButton);
         }
         else
         {
            this.refreshButtons("offence_categories_cont",3,this.var_45.initMsg.offenceCategories,this.var_1014,this.onOffenceCtgButton);
            _loc1_.height = RoomToolCtrl.getLowestPoint(_loc1_);
         }
      }
      
      private function onOffenceButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         this.var_823 = this.var_822.offences[_loc3_];
         this.var_452.text = this.var_823.msg;
         this.var_565 = false;
         this.refreshCategorization();
      }
      
      public function show() : void
      {
         this._frame = IFrameWindow(this.var_45.getXmlWindow("modact_summary"));
         this._frame.caption = "Mod action on: " + this.var_1497;
         this._frame.findChildByName("send_caution_but").procedure = this.onSendCautionButton;
         this._frame.findChildByName("kick_but").procedure = this.onKickButton;
         this._frame.findChildByName("ban_but").procedure = this.onBanButton;
         this._frame.findChildByName("change_categorization_but").procedure = this.onChangeCategorizationButton;
         this.var_45.disableButton(this.var_45.initMsg.alertPermission,this._frame,"send_caution_but");
         this.var_45.disableButton(this.var_45.initMsg.kickPermission,this._frame,"kick_but");
         this.var_45.disableButton(this.var_45.initMsg.banPermission,this._frame,"ban_but");
         this.var_452 = ITextFieldWindow(this._frame.findChildByName("message_input"));
         this.var_452.procedure = this.onInputClick;
         this.var_1016 = IDropMenuWindow(this._frame.findChildByName("banLengthSelect"));
         this.prepareBanSelect(this.var_1016);
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
         this.refreshCategorization();
         this._frame.visible = true;
      }
   }
}
