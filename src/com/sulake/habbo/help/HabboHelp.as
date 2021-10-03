package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.register.RegistrationUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_1992:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_149:TutorialUI;
      
      private var var_760:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_761:RegistrationUI;
      
      private var var_57:HelpUI;
      
      private var var_762:IHabboConfigurationManager;
      
      private var var_132:IHabboToolbar;
      
      private var var_620:HotelMergeUI;
      
      private var var_268:IHabboCommunicationManager;
      
      private var var_936:FaqIndex;
      
      private var var_1991:String = "";
      
      private var _incomingMessages:IncomingMessages;
      
      private var var_1180:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1180 = new CallForHelpData();
         this.var_1992 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_936 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_57 != null)
         {
            this.var_57.showCallForHelpReply(param1);
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_57 != null)
         {
            this.var_57.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_57 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_57.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_149 != null)
         {
            this.var_149.dispose();
            this.var_149 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return this.var_1991;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      override public function dispose() : void
      {
         if(this.var_57 != null)
         {
            this.var_57.dispose();
            this.var_57 = null;
         }
         if(this.var_149 != null)
         {
            this.var_149.dispose();
            this.var_149 = null;
         }
         if(this.var_620)
         {
            this.var_620.dispose();
            this.var_620 = null;
         }
         if(this.var_761 != null)
         {
            this.var_761.dispose();
            this.var_761 = null;
         }
         if(this.var_936 != null)
         {
            this.var_936.dispose();
            this.var_936 = null;
         }
         this._incomingMessages = null;
         if(this.var_132)
         {
            this.var_132.release(new IIDHabboToolbar());
            this.var_132 = null;
         }
         if(this.var_760)
         {
            this.var_760.release(new IIDHabboLocalizationManager());
            this.var_760 = null;
         }
         if(this.var_268)
         {
            this.var_268.release(new IIDHabboCommunicationManager());
            this.var_268 = null;
         }
         if(this.var_762)
         {
            this.var_762.release(new IIDHabboConfigurationManager());
            this.var_762 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_760;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_87:
               if(this.var_57 != null)
               {
                  this.var_57.setRoomSessionStatus(true);
               }
               if(this.var_149 != null)
               {
                  this.var_149.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_94:
               if(this.var_57 != null)
               {
                  this.var_57.setRoomSessionStatus(false);
               }
               if(this.var_149 != null)
               {
                  this.var_149.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_57 != null)
         {
            this.var_57.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_1992;
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_620)
         {
            this.var_620 = new HotelMergeUI(this);
         }
         this.var_620.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(this.var_149 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_149 = new TutorialUI(this);
         }
         return this.var_149 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_57 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_57 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_760,this.var_132);
         }
         return this.var_57 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1180;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1180.reportedUserId = param1;
         this.var_1180.reportedUserName = param2;
         this.var_57.showUI(HabboHelpViewEnum.const_360);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_1991 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this.var_132 != null)
         {
            this.var_132.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_114,HabboToolbarIconEnum.HELP));
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_57 != null)
         {
            this.var_57.showCallForHelpResult(param1);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_760 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_149 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_149.update(param1,param2,param3);
      }
      
      public function initRegistrationUI() : void
      {
         if(!this.var_761)
         {
            this.var_761 = new RegistrationUI(this);
         }
         this.var_761.showRegistrationView();
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_268 = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this,this.var_268);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_57 != null)
         {
            this.var_57.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_57 != null)
         {
            this.var_57.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_268 != null && param1 != null)
         {
            this.var_268.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_936;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_57 != null)
         {
            this.var_57.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_132 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_762 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_149;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_61)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_39)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_620;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_87,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_94,this.onRoomSessionEvent);
         this.var_132.events.addEventListener(HabboToolbarEvent.const_61,this.onHabboToolbarEvent);
         this.var_132.events.addEventListener(HabboToolbarEvent.const_39,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_132;
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_762 == null)
         {
            return param1;
         }
         return this.var_762.getKey(param1,param2,param3);
      }
   }
}
