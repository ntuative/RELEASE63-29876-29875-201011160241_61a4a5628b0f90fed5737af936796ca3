package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class TutorialUI implements INameChangeUI
   {
      
      public static const const_327:String = "TUI_NAME_VIEW";
      
      public static const const_82:String = "TUI_MAIN_VIEW";
      
      public static const const_369:String = "TUI_CLOTHES_VIEW";
      
      public static const const_468:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_1364:Boolean = false;
      
      private var var_1118:Boolean = false;
      
      private var _window:IFrameWindow;
      
      private var var_36:ITutorialUIView;
      
      private var var_45:HabboHelp;
      
      private var var_1793:Boolean = false;
      
      private var var_1472:int = 0;
      
      private var var_1363:Boolean = false;
      
      private var var_1471:int = 0;
      
      private var var_328:NameChangeView;
      
      public function TutorialUI(param1:HabboHelp)
      {
         super();
         this.var_45 = param1;
         this.var_45.events.addEventListener(HabboHelpTutorialEvent.const_464,this.onTaskDoneEvent);
         this.var_45.events.addEventListener(HabboHelpTutorialEvent.const_500,this.onTaskDoneEvent);
         this.var_45.events.addEventListener(HabboHelpTutorialEvent.const_463,this.onTaskDoneEvent);
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1364;
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_487)
         {
            this.var_1118 = true;
            this.showView(TutorialUI.const_82);
         }
         else
         {
            this.var_328.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!this.var_45 || !this.var_45.localization || !this.var_45.windowManager)
         {
            return;
         }
         this.var_1118 = true;
         this.var_45.localization.registerParameter("help.tutorial.name.changed","name",name);
         this.var_45.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
         if(this.var_36 != null && (this.var_36.id == const_327 || this.var_36.id == const_82))
         {
            this.showView(const_82);
         }
      }
      
      public function onUserChanged() : void
      {
         this.var_1363 = true;
         if(this.var_36 != null && (this.var_36.id == const_369 || this.var_36.id == const_82))
         {
            this.showView(const_82);
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_45.assets;
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_464:
               this.var_1364 = true;
               if(this.var_36 != null && this.var_36.id == const_468)
               {
                  this.showView(const_82);
               }
               break;
            case HabboHelpTutorialEvent.const_500:
               if(this.var_36 != null && this.var_36.id == const_369)
               {
                  this.var_1793 = true;
                  this.disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_463:
               if(this.var_1793)
               {
                  this.var_1793 = false;
                  this.showView(const_82);
               }
         }
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_45.localization;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1363;
      }
      
      public function dispose() : void
      {
         this.disposeView();
         if(this.var_45)
         {
            this.var_45.events.removeEventListener(HabboHelpTutorialEvent.const_464,this.onTaskDoneEvent);
            this.var_45.events.removeEventListener(HabboHelpTutorialEvent.const_500,this.onTaskDoneEvent);
            this.var_45.events.removeEventListener(HabboHelpTutorialEvent.const_463,this.onTaskDoneEvent);
            this.var_45 = null;
         }
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(this.var_45 == null || this.var_45.assets == null)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(this.var_45.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || this.var_45.windowManager == null)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(this.var_45.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      public function get hasTasksDone() : Boolean
      {
         return this.var_1363 && this.var_1118 && this.var_1364;
      }
      
      public function prepareForTutorial() : void
      {
         if(this.var_45 == null || this.var_45.events == null)
         {
            return;
         }
         this.var_45.hideUI();
         this.var_45.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_106));
      }
      
      public function get help() : HabboHelp
      {
         return this.var_45;
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.hasTasksDone)
         {
            if(this.var_45)
            {
               this.var_45.removeTutorialUI();
            }
            return;
         }
         var _loc3_:Boolean = false;
         if(this._window == null)
         {
            this._window = this.buildXmlWindow("tutorial_frame") as IFrameWindow;
            if(this._window == null)
            {
               return;
            }
            this._window.procedure = this.windowProcedure;
            _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            this.var_1471 = this._window.width - _loc2_.width;
            this.var_1472 = this._window.height;
            _loc3_ = true;
         }
         _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(this.var_36 != null)
         {
            this.var_36.dispose();
         }
         this._window.visible = true;
         switch(param1)
         {
            case const_82:
               this.var_36 = new TutorialMainView(_loc2_,this);
               if(this.var_328 != null)
               {
                  this.var_328.dispose();
               }
               break;
            case const_327:
               this._window.visible = false;
               if(this.var_328 == null)
               {
                  this.var_328 = new NameChangeView(this);
               }
               this.var_328.showMainView();
               this.prepareForTutorial();
               break;
            case const_369:
               this.var_36 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_468:
               this.var_36 = new TutorialCallGuideBotView(_loc2_,this);
         }
         this._window.height = _loc2_.height + this.var_1472;
         this._window.width = _loc2_.width + this.var_1471;
         if(_loc3_)
         {
            if(this._window == null)
            {
               return;
            }
            this._window.x = this._window.context.getDesktopWindow().width / 2 - this._window.width / 2;
            this._window.y = 0;
         }
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  this.disposeView();
               }
         }
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.var_1363 = param1;
         this.var_1118 = param2;
         this.var_1364 = param3;
         if(this.var_36 == null || this.var_36.id == const_82)
         {
            this.prepareForTutorial();
            this.showView(const_82);
         }
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            this.disposeView();
         }
      }
      
      public function checkName(param1:String) : void
      {
         this.disposeWindow();
         this.var_45.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function get myName() : String
      {
         return this.var_45.ownUserName;
      }
      
      public function changeName(param1:String) : void
      {
         this.disposeWindow();
         this.var_45.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      private function disposeView() : void
      {
         if(this.var_36 != null)
         {
            this.var_36.dispose();
            this.var_36 = null;
         }
         if(this.var_328 != null)
         {
            this.var_328.dispose();
            this.var_328 = null;
         }
         this.disposeWindow();
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1118;
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_487)
         {
            this.var_328.checkedName = _loc2_.name;
         }
         else
         {
            this.var_328.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
   }
}
