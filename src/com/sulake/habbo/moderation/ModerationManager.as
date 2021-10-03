package com.sulake.habbo.moderation
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDSessionDataManager;
   import iid.IIDHabboWindowManager;
   
   public class ModerationManager extends Component implements IHabboModeration
   {
       
      
      private var var_573:IHabboSoundManager;
      
      private var var_2444:ModeratorInitData;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_2446:WindowTracker;
      
      private var var_360:ISessionDataManager;
      
      private var var_2447:int;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _navigator:IHabboNavigator;
      
      private var var_2445:ModerationMessageHandler;
      
      private var var_868:StartPanelCtrl;
      
      private var _issueManager:IssueManager;
      
      private var var_157:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      public function ModerationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboNavigator(),this.onNavigatorReady);
         queueInterface(new IIDHabboSoundManager(),this.onSoundManagerReady);
         this.var_868 = new StartPanelCtrl(this);
         this.var_2446 = new WindowTracker();
      }
      
      public function userSelected(param1:int, param2:String) : void
      {
         Logger.log("USER SELECTED: " + param1 + ", " + param2);
         this.var_868.userSelected(param1,param2);
      }
      
      private function onConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_157 = param2 as IHabboConfigurationManager;
      }
      
      public function get issueManager() : IssueManager
      {
         return this._issueManager;
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_573 = param2 as IHabboSoundManager;
      }
      
      public function set currentFlatId(param1:int) : void
      {
         this.var_2447 = param1;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get soundManager() : IHabboSoundManager
      {
         return this.var_573;
      }
      
      private function onSessionDataReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_360 = param2 as ISessionDataManager;
      }
      
      public function openHkPage(param1:String, param2:String) : void
      {
         var _loc3_:String = this.configuration.getKey(param1);
         var _loc4_:String = _loc3_ + param2;
         HabboWebTools.navigateToURL(_loc4_,"housekeeping");
      }
      
      override public function dispose() : void
      {
         if(this.var_868)
         {
            this.var_868.dispose();
            this.var_868 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_360)
         {
            this.var_360.release(new IIDSessionDataManager());
            this.var_360 = null;
         }
         if(this.var_157)
         {
            this.var_157.release(new IIDHabboConfigurationManager());
            this.var_157 = null;
         }
         if(this._navigator)
         {
            this._navigator.release(new IIDHabboNavigator());
            this._navigator = null;
         }
         if(this.var_573)
         {
            this.var_573.release(new IIDHabboSoundManager());
            this.var_573 = null;
         }
         this._connection = null;
         super.dispose();
      }
      
      public function get windowTracker() : WindowTracker
      {
         return this.var_2446;
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
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
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_360;
      }
      
      public function set initMsg(param1:ModeratorInitData) : void
      {
         this.var_2444 = param1;
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var _loc2_:IAsset = assets.getAssetByName(param1 + "_xml");
         var _loc3_:XmlAsset = XmlAsset(_loc2_);
         var _loc4_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content));
      }
      
      public function disableButton(param1:Boolean, param2:IWindowContainer, param3:String) : void
      {
         var _loc4_:IButtonWindow = IButtonWindow(param2.findChildByName(param3));
         if(!param1)
         {
            _loc4_.disable();
            _loc4_.toolTipCaption = "No permission";
         }
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
            this.var_2445 = new ModerationMessageHandler(this);
         }
      }
      
      public function get startPanel() : StartPanelCtrl
      {
         return this.var_868;
      }
      
      public function get messageHandler() : ModerationMessageHandler
      {
         return this.var_2445;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._windowManager = param2 as IHabboWindowManager;
         this._issueManager = new IssueManager(this);
      }
      
      private function onNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._navigator = IHabboNavigator(param2);
      }
      
      public function get currentFlatId() : int
      {
         return this.var_2447;
      }
      
      public function get initMsg() : ModeratorInitData
      {
         return this.var_2444;
      }
      
      public function get connection() : IConnection
      {
         return this._connection;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_157;
      }
      
      public function goToRoom(param1:int) : void
      {
         Logger.log("MOD: GO TO ROOM: " + param1);
         this._navigator.goToRoom(param1,false);
      }
   }
}
