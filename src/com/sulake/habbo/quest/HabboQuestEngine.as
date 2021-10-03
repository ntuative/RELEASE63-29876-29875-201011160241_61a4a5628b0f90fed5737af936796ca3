package com.sulake.habbo.quest
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.quest.OpenQuestListMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import iid.IIDHabboWindowManager;
   
   public class HabboQuestEngine extends Component implements IHabboQuestEngine
   {
       
      
      private var _incomingMessages:IncomingMessages;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_157:IHabboConfigurationManager;
      
      private var _controller:QuestController;
      
      private var var_132:IHabboToolbar;
      
      private var _localization:IHabboLocalizationManager;
      
      public function HabboQuestEngine(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this._controller = new QuestController(this);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationComponentInit);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._roomEngine = param2 as IRoomEngine;
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_157 = param2 as IHabboConfigurationManager;
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onCommunicationComponentInit(param1:IID = null, param2:IUnknown = null) : void
      {
         this._communication = IHabboCommunicationManager(param2);
         this._incomingMessages = new IncomingMessages(this);
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_157;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this._localization;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.var_132)
         {
            this.var_132.release(new IIDHabboToolbar());
            this.var_132 = null;
         }
      }
      
      private function setHabboToolbarIcon() : void
      {
         var _loc1_:* = null;
         if(this.var_132 != null && this.var_157 != null)
         {
            _loc1_ = this.var_157.getKey("questing.defaultCampaign","");
            if(_loc1_ != null && _loc1_ != "")
            {
               this.var_132.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_114,HabboToolbarIconEnum.QUESTS));
            }
         }
      }
      
      public function get controller() : QuestController
      {
         return this._controller;
      }
      
      private function onQuestsToolBarIconClick() : void
      {
         var _loc1_:Boolean = this._controller.isVisible();
         if(_loc1_)
         {
            this._controller.close();
         }
         else
         {
            this._communication.getHabboMainConnection(null).send(new OpenQuestListMessageComposer());
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_132 = IHabboToolbar(param2) as IHabboToolbar;
         this.var_132.events.addEventListener(HabboToolbarEvent.const_61,this.onHabboToolbarEvent);
         this.var_132.events.addEventListener(HabboToolbarEvent.const_39,this.onHabboToolbarEvent);
         this.setHabboToolbarIcon();
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._localization = IHabboLocalizationManager(param2);
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
            if(param1.iconId == HabboToolbarIconEnum.QUESTS)
            {
               this.onQuestsToolBarIconClick();
               return;
            }
         }
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var asset:IAsset = null;
         var xmlAsset:XmlAsset = null;
         var name:String = param1;
         var window:IWindow = null;
         try
         {
            asset = assets.getAssetByName(name);
            xmlAsset = XmlAsset(asset);
            window = this._windowManager.buildFromXML(XML(xmlAsset.content));
         }
         catch(e:Error)
         {
         }
         return window;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return this._roomEngine;
      }
   }
}
