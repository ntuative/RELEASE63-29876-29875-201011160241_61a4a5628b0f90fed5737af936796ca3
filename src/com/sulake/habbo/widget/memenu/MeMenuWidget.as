package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_618:String = "me_menu_sound_settings";
      
      public static const const_736:String = "me_menu_settings_view";
      
      public static const const_111:String = "me_menu_top_view";
      
      public static const const_1448:String = "me_menu_rooms_view";
      
      public static const const_943:String = "me_menu_dance_moves_view";
      
      public static const const_303:String = "me_menu_my_clothes_view";
      
      public static const const_641:String = "me_menu_effects_view";
       
      
      private var var_2475:Boolean = false;
      
      private var var_766:Boolean = false;
      
      private var var_1766:int = 0;
      
      private var var_209:IEventDispatcher;
      
      private var var_1768:int = 0;
      
      private var var_2476:int = 0;
      
      private var var_2472:Boolean = false;
      
      private var var_1767:Boolean = false;
      
      private var var_388:Boolean = false;
      
      private var var_2474:int = 0;
      
      private var var_1962:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_1104:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1345:int = 0;
      
      private var var_2473:Boolean = false;
      
      private var _destinationSize:Point;
      
      private var var_36:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param5;
         this._destinationSize = new Point(0,0);
         this.var_209 = param4;
         if(param5 != null && false)
         {
            this.var_2473 = param5.getKey("client.news.embed.enabled","HabboAvatarRenderLib_manifest") == "true";
         }
         this.changeView(const_111);
         this.hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_551,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_654,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_658,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_682,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_340,this.onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_597,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_559,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_201,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_243,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_727,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_226,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_337,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_106,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_483,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_176,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_109,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_945,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_36 != null && this.var_36.window.name == const_303)
         {
            this.changeView(const_111);
         }
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!this.var_766)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return this._mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1104;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_388)
         {
            return;
         }
         if(this.var_36.window.name == const_618)
         {
            (this.var_36 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1345 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_1768 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_1768.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_388 && this.var_36.window.name == const_303))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_763);
            if(messageListener != null)
            {
               if(!this.var_1767)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_1766;
      }
      
      override public function dispose() : void
      {
         this.hide();
         this.var_209 = null;
         if(this.var_36 != null)
         {
            this.var_36.dispose();
            this.var_36 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2475;
      }
      
      public function get creditBalance() : int
      {
         return this.var_1768;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1767 = true;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         this.var_1962 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_551,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_654,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_658,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_682,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_340,this.onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_201,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_243,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_727,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_597,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_559,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_226,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_337,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_483,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_106,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_176,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_109,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_109,this.onGameMode);
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_483:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_388 + " view: " + this.var_36.window.name);
               if(this.var_388 != true || this.var_36.window.name != const_111)
               {
                  return;
               }
               (this.var_36 as MeMenuMainView).setIconAssets("clothes_icon",const_111,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_106:
               this.hide();
         }
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2472;
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - this.var_1962 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2476;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1104 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1104 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1345;
         this.var_1345 = param1.daysLeft;
         this.var_2476 = param1.periodsLeft;
         this.var_2474 = param1.pastPeriods;
         this.var_2475 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_1766);
         this.var_1766 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_36 != null)
            {
               this.changeView(this.var_36.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2472 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_36 != null && this.var_36.window.name != const_303)
         {
            this.hide();
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1439,HabboWindowStyle.const_896,HabboWindowParam.const_38,new Rectangle(0,0,170,260)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_me_menu");
         }
         return this._mainContainer;
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_653);
         _loc2_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(this.var_36 != null)
         {
            this._mainContainer.removeChild(this.var_36.window);
            this.var_36.dispose();
            this.var_36 = null;
         }
         this.var_388 = false;
         this.var_209.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      public function get habboClubPastPeriods() : int
      {
         return this.var_2474;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1345;
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1104 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1104 = true;
            }
         }
         if(this.var_36 != null && this.var_36.window.name == const_641)
         {
            (this.var_36 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function updateSize() : void
      {
         if(this.var_36 != null)
         {
            this._destinationSize.x = this.var_36.window.width + 10;
            this._destinationSize.y = this.var_36.window.height;
            this.var_36.window.x = 5;
            this.var_36.window.y = 0;
            this._mainContainer.width = this._destinationSize.x;
            this._mainContainer.height = this._destinationSize.y;
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               this.var_388 = !this.var_388;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               this.var_388 = false;
               break;
            default:
               return;
         }
         if(this.var_388)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_36 != null && this.var_36.window.name == const_303)
         {
            this.changeView(const_111);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2473;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_111:
               _loc2_ = new MeMenuMainView();
               this.var_209.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_641:
               _loc2_ = new MeMenuEffectsView();
               this.var_209.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_943:
               _loc2_ = new MeMenuDanceView();
               this.var_209.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_303:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1448:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_736:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_618:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_36 != null)
            {
               this._mainContainer.removeChild(this.var_36.window);
               this.var_36.dispose();
               this.var_36 = null;
            }
            this.var_36 = _loc2_;
            this.var_36.init(this,param1);
         }
         this.updateSize();
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1767 = false;
      }
      
      private function show() : void
      {
         if(!this._mainContainer || !this._mainContainer.parent)
         {
            return;
         }
         this.changeView(const_111);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_674);
         _loc1_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         this.var_388 = true;
      }
   }
}
