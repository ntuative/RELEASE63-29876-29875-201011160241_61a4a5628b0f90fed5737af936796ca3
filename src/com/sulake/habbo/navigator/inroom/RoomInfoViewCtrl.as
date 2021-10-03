package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_725:IWindowContainer;
      
      private var var_1123:ITextWindow;
      
      private var var_167:RoomSettingsCtrl;
      
      private var var_1378:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_243:Timer;
      
      private var var_2552:IWindowContainer;
      
      private var var_1375:ITextWindow;
      
      private var var_486:IWindowContainer;
      
      private var var_905:IWindowContainer;
      
      private var var_61:IWindowContainer;
      
      private var var_1376:IContainerButtonWindow;
      
      private var var_1810:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_893:ITextWindow;
      
      private var var_1808:IWindowContainer;
      
      private var var_1380:IWindowContainer;
      
      private var var_903:ITextWindow;
      
      private var var_1126:ITextFieldWindow;
      
      private var var_2555:String;
      
      private var var_275:IWindowContainer;
      
      private var var_902:ITextWindow;
      
      private var var_906:IButtonWindow;
      
      private var var_1812:IButtonWindow;
      
      private var var_1124:ITextWindow;
      
      private var var_2619:int;
      
      private var var_1381:IContainerButtonWindow;
      
      private var var_904:IWindowContainer;
      
      private var var_1377:ITextWindow;
      
      private var var_1379:IContainerButtonWindow;
      
      private var var_1809:ITextWindow;
      
      private var var_1811:IButtonWindow;
      
      private var var_945:TagRenderer;
      
      private var var_2383:ITextWindow;
      
      private var var_331:RoomEventViewCtrl;
      
      private var var_1125:IButtonWindow;
      
      private var var_726:ITextWindow;
      
      private var _navigator:HabboNavigator;
      
      private var var_241:RoomThumbnailCtrl;
      
      private var _rateButton:IContainerButtonWindow;
      
      private var var_2553:IWindowContainer;
      
      private var var_1374:IContainerButtonWindow;
      
      private var var_242:IWindowContainer;
      
      private var var_2554:String;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_331 = new RoomEventViewCtrl(this._navigator);
         this.var_167 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_241 = new RoomThumbnailCtrl(this._navigator);
         this.var_945 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_167);
         this.var_243 = new Timer(6000,1);
         this.var_243.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_167.active = true;
         this.var_331.active = false;
         this.var_241.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_331.active)
         {
            return;
         }
         this.var_1810.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1811.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1808.visible = Util.hasVisibleChildren(this.var_1808);
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_167.active || this.var_241.active)
         {
            return;
         }
         this.var_893.text = param1.roomName;
         this.var_893.height = this.var_893.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_903.text = param1.description;
         this.var_945.refreshTags(this.var_486,param1.tags);
         this.var_903.visible = false;
         if(param1.description != "")
         {
            this.var_903.height = this.var_903.textHeight + 5;
            this.var_903.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1376,"facebook_logo_small",_loc3_,null,0);
         this.var_1376.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this._rateButton,"thumb_up",_loc4_,null,0);
         this._rateButton.visible = _loc4_;
         this.var_902.visible = !_loc4_;
         this.var_1809.visible = !_loc4_;
         this.var_1809.text = "" + this._navigator.data.currentRoomRating;
         this._navigator.refreshButton(this.var_486,"home",param2,null,0);
         this._navigator.refreshButton(this.var_486,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_486,["room_name","owner_name_cont","tags","room_desc","rating_cont"],this.var_893.y,0);
         this.var_486.visible = true;
         this.var_486.height = Util.getLowestPoint(this.var_486);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_96,this.onToolbarIconState);
         }
         if(this.var_243)
         {
            this.var_243.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_243.reset();
            this.var_243 = null;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this.var_61)
         {
            return;
         }
         if(this.var_167.active)
         {
            this.var_61.visible = false;
            return;
         }
         this.var_61.visible = true;
         if(this.var_1125)
         {
            if(this.var_2554 == "exit_homeroom")
            {
               this.var_1125.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1125.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_906)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_906.visible = _loc1_;
            if(this.var_2555 == "0")
            {
               this.var_906.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_906.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_449,HabboToolbarIconEnum.ROOMINFO,this._window,false));
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_167.active || this.var_241.active)
         {
            return;
         }
         this.var_1812.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1378.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1374.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1381.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1379.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1380.visible = Util.hasVisibleChildren(this.var_1380);
      }
      
      public function toggle() : void
      {
         this.var_243.reset();
         this.var_331.active = false;
         this.var_167.active = false;
         this.var_241.active = false;
         this.refresh();
         if(!this._window.visible)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_50,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            this._window.parent.activate();
         }
         else
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_449,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_275);
         this.var_275.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_167.refresh(this.var_275);
         this.var_241.refresh(this.var_275);
         Util.moveChildrenToColumn(this.var_275,["room_details","room_buttons"],0,2);
         this.var_275.height = Util.getLowestPoint(this.var_275);
         this.var_275.visible = true;
         Logger.log("XORP: " + this.var_486.visible + ", " + this.var_1380.visible + ", " + this.var_725.visible + ", " + this.var_725.rectangle + ", " + this.var_275.rectangle);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_243.reset();
         this.var_331.active = false;
         this.var_167.active = false;
         this.var_241.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_50,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_243.start();
         }
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_96)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2555 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2554 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1126.setSelection(0,this.var_1126.text.length);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_39);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_242);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_331.refresh(this.var_242);
         if(Util.hasVisibleChildren(this.var_242) && !(this.var_167.active || this.var_241.active))
         {
            Util.moveChildrenToColumn(this.var_242,["event_details","event_buttons"],0,2);
            this.var_242.height = Util.getLowestPoint(this.var_242);
            this.var_242.visible = true;
         }
         else
         {
            this.var_242.visible = false;
         }
         Logger.log("EVENT: " + this.var_242.visible + ", " + this.var_242.rectangle);
      }
      
      public function startEventEdit() : void
      {
         this.var_243.reset();
         this.var_331.active = true;
         this.var_167.active = false;
         this.var_241.active = false;
         this.reload();
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_39);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_96,this.onToolbarIconState);
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_243.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_167.active || this.var_241.active)
         {
            return;
         }
         this.var_1123.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1123.height = this.var_1123.textHeight + 5;
         this.var_1375.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1375.height = this.var_1375.textHeight + 5;
         Util.moveChildrenToColumn(this.var_725,["public_space_name","public_space_desc"],this.var_1123.y,0);
         this.var_725.visible = true;
         this.var_725.height = Math.max(86,Util.getLowestPoint(this.var_725));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","HabboAvatarRenderLib_manifest") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_167.active && !this.var_241.active && !this.var_331.active)
         {
            this.var_904.visible = true;
            this.var_1126.text = this.getEmbedData();
         }
         else
         {
            this.var_904.visible = false;
         }
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_243.reset();
         this.var_167.active = false;
         this.var_331.active = false;
         this.var_241.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
         this._window.setParamFlag(HabboWindowParam.const_63,false);
         this._window.setParamFlag(HabboWindowParam.const_1472,true);
         this._window.visible = false;
         this.var_275 = IWindowContainer(this.find("room_info"));
         this.var_486 = IWindowContainer(this.find("room_details"));
         this.var_725 = IWindowContainer(this.find("public_space_details"));
         this.var_2553 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2552 = IWindowContainer(this.find("rating_cont"));
         this.var_1380 = IWindowContainer(this.find("room_buttons"));
         this.var_893 = ITextWindow(this.find("room_name"));
         this.var_1123 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_903 = ITextWindow(this.find("room_desc"));
         this.var_1375 = ITextWindow(this.find("public_space_desc"));
         this.var_1124 = ITextWindow(this.find("owner_caption"));
         this.var_902 = ITextWindow(this.find("rating_caption"));
         this.var_1809 = ITextWindow(this.find("rating_txt"));
         this.var_242 = IWindowContainer(this.find("event_info"));
         this.var_905 = IWindowContainer(this.find("event_details"));
         this.var_1808 = IWindowContainer(this.find("event_buttons"));
         this.var_2383 = ITextWindow(this.find("event_name"));
         this.var_726 = ITextWindow(this.find("event_desc"));
         this.var_1376 = IContainerButtonWindow(this.find("facebook_like_button"));
         this._rateButton = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_1378 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1374 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1381 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1379 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1812 = IButtonWindow(this.find("room_settings_button"));
         this.var_1810 = IButtonWindow(this.find("create_event_button"));
         this.var_1811 = IButtonWindow(this.find("edit_event_button"));
         this.var_904 = IWindowContainer(this.find("embed_info"));
         this.var_1377 = ITextWindow(this.find("embed_info_txt"));
         this.var_1126 = ITextFieldWindow(this.find("embed_src_txt"));
         this.var_61 = IWindowContainer(this.find("buttons_container"));
         this.var_1125 = IButtonWindow(this.find("exit_room_button"));
         this.var_906 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1378,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1374,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1812,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1381,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1379,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1810,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1811,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1126,this.onEmbedSrcClick);
         Util.setProcDirectly(this._rateButton,this.onThumbUp);
         Util.setProcDirectly(this.var_1376,this.onFacebookLike);
         Util.setProcDirectly(this.var_906,this.onZoomClick);
         Util.setProcDirectly(this.var_1125,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1378,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1374,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1381,"home",true,null,0);
         this._navigator.refreshButton(this.var_1379,"home",true,null,0);
         this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         Util.setProcDirectly(this.var_275,this.onHover);
         Util.setProcDirectly(this.var_242,this.onHover);
         this.var_1124.width = this.var_1124.textWidth;
         Util.moveChildrenToRow(this.var_2553,["owner_caption","owner_name"],this.var_1124.x,this.var_1124.y,3);
         this.var_902.width = this.var_902.textWidth;
         Util.moveChildrenToRow(this.var_2552,["rating_caption","rating_txt"],this.var_902.x,this.var_902.y,3);
         this.var_1377.height = this.var_1377.textHeight + 5;
         Util.moveChildrenToColumn(this.var_904,["embed_info_txt","embed_src_txt"],this.var_1377.y,2);
         this.var_904.height = Util.getLowestPoint(this.var_904) + 5;
         this.var_2619 = this._window.y + this._window.height;
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_243.reset();
         this.var_167.load(param1);
         this.var_167.active = true;
         this.var_331.active = false;
         this.var_241.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_331.active)
         {
            return;
         }
         this.var_2383.text = param1.eventName;
         this.var_726.text = param1.eventDescription;
         this.var_945.refreshTags(this.var_905,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_726.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_726.height = this.var_726.textHeight + 5;
            this.var_726.y = Util.getLowestPoint(this.var_905) + 2;
            this.var_726.visible = true;
         }
         this.var_905.visible = true;
         this.var_905.height = Util.getLowestPoint(this.var_905);
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
         this._window.height = Util.getLowestPoint(this._window);
         this._window.y = this._window.desktop.height - this._window.height - 5;
         Logger.log("MAIN: " + this.var_275.rectangle + ", " + this.var_242.rectangle + ", " + this._window.rectangle);
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function close() : void
      {
         this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_994,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
