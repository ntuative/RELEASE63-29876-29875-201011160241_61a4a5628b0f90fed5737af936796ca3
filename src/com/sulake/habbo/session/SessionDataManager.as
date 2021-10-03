package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.purse.CreditBalanceEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.purse.CreditBalanceParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.events.SessionCreditBalanceEvent;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.IProductDataListener;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var var_564:String;
      
      private var var_1787:UserTagManager;
      
      private var var_889:Array;
      
      private var _respectLeft:int = 0;
      
      private var var_482:Map;
      
      private var var_1788:Boolean = false;
      
      private var var_1786:GroupDetailsView;
      
      private var _name:String;
      
      private var var_718:int = 0;
      
      private var var_272:FurnitureDataParser;
      
      private var var_888:Array;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_19:IRoomSessionManager;
      
      private var var_1355:BadgeImageManager;
      
      private var _wallItems:Map;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1512:String;
      
      private var var_483:Map;
      
      private var var_2510:Boolean;
      
      private var _id:int;
      
      private var var_890:IgnoredUsersManager;
      
      private var var_923:Dictionary;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1114:HabboGroupInfoManager;
      
      private var var_840:String;
      
      private var var_1113:Array;
      
      private var var_2509:Boolean;
      
      private var var_596:ProductDataParser;
      
      private var var_157:IHabboConfigurationManager;
      
      private var var_1914:int = 0;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_889 = [];
         this.var_1787 = new UserTagManager(events);
         this.var_1114 = new HabboGroupInfoManager(this,events);
         this.var_890 = new IgnoredUsersManager(this);
         this.var_923 = new Dictionary();
         this.var_1113 = [];
         this.var_888 = [];
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onProductsReady(param1:Event) : void
      {
         var _loc2_:* = null;
         this.var_596.removeEventListener(ProductDataParser.const_102,this.onProductsReady);
         this.var_1788 = true;
         for each(_loc2_ in this.var_1113)
         {
            if(_loc2_ != null && !_loc2_.disposed)
            {
               _loc2_.productDataReady();
            }
         }
         this.var_1113 = [];
      }
      
      public function getUserTags(param1:int) : Array
      {
         return this.var_1787.getTags(param1);
      }
      
      private function onCreditBalance(param1:CreditBalanceEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:CreditBalanceParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         if(events != null)
         {
            events.dispatchEvent(new SessionCreditBalanceEvent(_loc2_.balance));
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.method_7 == this._id)
         {
            this._name = _loc3_.newName;
         }
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!this.var_1788)
         {
            this.loadProductData();
         }
         return this.var_923[param1];
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return this.var_1114.getBadgeId(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         this.var_890.unignoreUser(param1);
      }
      
      private function sendPickAllFurnitureMessage() : void
      {
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      override public function dispose() : void
      {
         if(this.var_483)
         {
            this.var_483.dispose();
            this.var_483 = null;
         }
         if(this.var_482)
         {
            this.var_482.dispose();
            this.var_482 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_19)
         {
            this.var_19.release(new IIDHabboRoomSessionManager());
            this.var_19 = null;
         }
         if(this.var_157)
         {
            this.var_157.release(new IIDHabboConfigurationManager());
            this.var_157 = null;
         }
         if(this._localization)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         this.var_888 = null;
         if(this.var_272)
         {
            this.var_272.removeEventListener(FurnitureDataParser.const_102,this.onFurnitureReady);
            this.var_272.dispose();
            this.var_272 = null;
         }
         if(this.var_596)
         {
            this.var_596.removeEventListener(ProductDataParser.const_102,this.onProductsReady);
            this.var_596.dispose();
            this.var_596 = null;
         }
         super.dispose();
      }
      
      public function get systemOpen() : Boolean
      {
         return this.var_2510;
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return this.var_1355.getBadgeImage(param1,BadgeImageManager.const_898);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_157;
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         this._id = _loc3_.id;
         this._name = _loc3_.name;
         this.var_1914 = _loc3_.respectTotal;
         this._respectLeft = _loc3_.respectLeft;
         this.var_718 = _loc3_.petRespectLeft;
         this.var_564 = _loc3_.figure;
         this.var_840 = _loc3_.sex;
         this.var_1512 = _loc3_.realName;
         this.var_890.initIgnoreList();
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(this.var_19 == null || this._windowManager == null)
         {
            return;
         }
         var session:IRoomSession = this.var_19.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || this.isAnyRoomController)
         {
            this._windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:Event):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_162)
               {
                  sendPickAllFurnitureMessage();
               }
            });
         }
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return this.var_1114.getGroupDetails(param1);
      }
      
      public function getFloorItemDataByName(param1:String) : IFurnitureData
      {
         if(this.var_482 == null)
         {
            return null;
         }
         return this.getFloorItemData(parseInt(this.var_482.getValue(param1)));
      }
      
      public function get userId() : int
      {
         return this._id;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return this.var_890.isIgnored(param1);
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_718;
      }
      
      public function get realName() : String
      {
         return this.var_1512;
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._localization = param2 as IHabboLocalizationManager;
         this.initBadgeImageManager();
         if(this.var_272)
         {
            this.var_272.localization = this._localization;
            this.var_272.registerFurnitureLocalizations();
         }
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_2510 = _loc2_.isOpen;
         this.var_2509 = _loc2_.onShutDown;
      }
      
      public function loadProductData(param1:IProductDataListener = null) : Boolean
      {
         var _loc2_:* = null;
         if(this.var_1788)
         {
            return true;
         }
         if(this.var_1113.indexOf(param1) == -1)
         {
            this.var_1113.push(param1);
         }
         if(this.var_596 == null)
         {
            _loc2_ = this.var_157.getKey("productdata.load.url");
            this.var_596 = new ProductDataParser(_loc2_,this.var_923);
            this.var_596.addEventListener(ProductDataParser.const_102,this.onProductsReady);
         }
         return false;
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return this.var_1355.getBadgeImage(param1);
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this._respectLeft < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         this._respectLeft = this._respectLeft - 1;
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         var _loc3_:* = null;
         if(param2 == null)
         {
            return;
         }
         this.var_157 = param2 as IHabboConfigurationManager;
         this.initBadgeImageManager();
         if(!this.var_272)
         {
            this.var_483 = new Map();
            this._wallItems = new Map();
            this.var_482 = new Map();
            _loc3_ = this.var_157.getKey("furnidata.load.url");
            this.var_272 = new FurnitureDataParser(this.var_483,this._wallItems,this.var_482,this._localization);
            this.var_272.addEventListener(FurnitureDataParser.const_102,this.onFurnitureReady);
            this.var_272.loadData(_loc3_);
         }
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(this.var_1786 == null)
         {
            this.var_1786 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = this.var_1114.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            this.var_1786.showGroupDetails(param1);
         }
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         this.var_272.removeEventListener(FurnitureDataParser.const_102,this.onFurnitureReady);
         for each(_loc2_ in this.var_888)
         {
            _loc2_.furniDataReady();
         }
         this.var_888 = [];
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this.var_718 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         this.var_718 = this.var_718 - 1;
      }
      
      public function getFurniData(param1:IFurniDataListener) : Array
      {
         if(this.var_483.length == 0)
         {
            if(this.var_888.indexOf(param1) == -1)
            {
               this.var_888.push(param1);
            }
            return null;
         }
         var _loc2_:Array = this.var_483.getValues();
         return _loc2_.concat(this._wallItems.getValues());
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            this.var_564 = _loc2_.figure;
            this.var_840 = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(this._id,this.var_564,this.var_840));
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(this.var_157 != null)
         {
            urlString = this.var_157.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function hasUserRight(param1:String) : Boolean
      {
         if(this.var_889 == null)
         {
            return false;
         }
         return this.var_889.indexOf(param1) >= 0;
      }
      
      public function method_12(param1:String) : IFurnitureData
      {
         if(this.var_482 == null)
         {
            return null;
         }
         return this.getWallItemData(parseInt(this.var_482.getValue(param1)));
      }
      
      public function ignoreUser(param1:String) : void
      {
         this.var_890.ignoreUser(param1);
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = param1 as UserRightsMessageEvent;
         this.var_889 = _loc2_.rights;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         this._communication = param2 as IHabboCommunicationManager;
         if(this._communication == null)
         {
            return;
         }
         this._communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
         this._communication.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
         this._communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(this.onUserChange));
         this._communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(this.onUserNameChange));
         this._communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(this.onAvailabilityStatus));
         this._communication.addHabboConnectionMessageEvent(new CreditBalanceEvent(this.onCreditBalance));
         this._communication.addHabboConnectionMessageEvent(new PetRespectFailedEvent(this.onPetRespectFailed));
         this.var_1787.communication = this._communication;
         this.var_1114.communication = this._communication;
         this.var_890.registerMessageEvents();
      }
      
      public function get systemShutDown() : Boolean
      {
         return this.var_2509;
      }
      
      public function get gender() : String
      {
         return this.var_840;
      }
      
      private function onPetRespectFailed(param1:PetRespectFailedEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         ++this.var_718;
      }
      
      public function getFloorItemData(param1:int) : IFurnitureData
      {
         if(this.var_483 == null)
         {
            return null;
         }
         return this.var_483.getValue(param1.toString());
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         if(this.var_889 == null)
         {
            return false;
         }
         return this.var_889.indexOf("fuse_any_room_controller") >= 0;
      }
      
      public function getWallItemData(param1:int) : IFurnitureData
      {
         if(this._wallItems == null)
         {
            return null;
         }
         return this._wallItems.getValue(param1.toString());
      }
      
      private function initBadgeImageManager() : void
      {
         var _loc1_:* = null;
         if(this.var_1355 != null)
         {
            return;
         }
         if(this.var_157 == null || this._localization == null)
         {
            return;
         }
         if(context is CoreComponent)
         {
            _loc1_ = (context as CoreComponent).assets;
         }
         this.var_1355 = new BadgeImageManager(_loc1_,events,this.var_157,this._localization);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_19 = param2 as IRoomSessionManager;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get userName() : String
      {
         return this._name;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return this.var_19;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
   }
}
