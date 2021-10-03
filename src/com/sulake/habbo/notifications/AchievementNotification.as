package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.users.GetAchievementShareIdComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AchievementNotification
   {
       
      
      private var var_1559:int;
      
      private var var_1804:int;
      
      private const const_1535:String = "badge_bg_001_png";
      
      private var var_1370:int;
      
      private var _window:IFrameWindow;
      
      private var var_360:ISessionDataManager;
      
      private var var_2540:String;
      
      private var var_2541:String;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_2543:String;
      
      private const const_1770:String = "achievement_bg_001_png";
      
      private var _assets:IAssetLibrary;
      
      private var var_1371:int;
      
      private var var_722:String;
      
      private var var_2545:int;
      
      private var _desc:String;
      
      private var var_2542:String;
      
      private var var_2544:String;
      
      private var var_2539:String;
      
      private var var_91:IHabboLocalizationManager;
      
      public function AchievementNotification(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int, param7:IAssetLibrary, param8:IHabboWindowManager, param9:IHabboLocalizationManager, param10:IHabboConfigurationManager, param11:IHabboCommunicationManager, param12:ISessionDataManager)
      {
         super();
         if(!param7 || !param8 || !param9 || !param10 || !param12)
         {
            return;
         }
         this.var_722 = param1;
         this.var_2545 = param2;
         this.var_1804 = param3;
         this.var_1559 = param4;
         this.var_1371 = param6;
         this.var_1370 = param5;
         this.var_91 = param9;
         this._assets = param7;
         this.var_360 = param12;
         this._communication = param11;
         param12.events.addEventListener(BadgeImageReadyEvent.const_121,this.onBadgeImageReady);
         var _loc13_:XmlAsset = param7.getAssetByName("achievement_notification_xml") as XmlAsset;
         if(_loc13_ == null)
         {
            return;
         }
         this._window = param8.buildFromXML(_loc13_.content as XML) as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.procedure = this.eventHandler;
         this._window.center();
         this.var_2541 = this.registerAchievementParameters("badge_name_" + this.var_722);
         this.var_2540 = this.registerAchievementParameters("badge_desc_" + this.var_722);
         this.var_2544 = this.registerAchievementParameters("badge_name_fb_" + this.var_722);
         this.var_2542 = this.registerAchievementParameters("badge_desc_fb_" + this.var_722);
         this._desc = this.registerTextParameters("notifications.text.achievement");
         this.var_2543 = this.registerTextParameters("notifications.text.achievement_facebook");
         this.var_2539 = this.registerTextParameters("notifications.text.achievement_facebook_title");
         this.var_91.registerParameter("notifications.text.achievement.achievement_points","achievement_points",this.var_1559.toString());
         this.var_91.registerParameter("notifications.text.achievement.pixel_reward","pixels",this.var_1370.toString());
         this.var_91.registerParameter("notifications.achievement.bonus.value","bonus_points",this.var_1371.toString());
         this.var_91.registerParameter("notifications.achievement.no_facebook","bonus_points",this.var_1371.toString());
         this.setBadge(param12.getBadgeImage(param1),this.const_1535);
         var _loc14_:BitmapData = (param7.getAssetByName(this.const_1770) as BitmapDataAsset).content as BitmapData;
         var _loc15_:IBitmapWrapperWindow = this._window.findChildByName("achievement_bg") as IBitmapWrapperWindow;
         _loc15_.bitmap = new BitmapData(_loc15_.width,_loc15_.height,true,0);
         _loc15_.bitmap.copyPixels(_loc14_,_loc14_.rect,new Point(0,_loc15_.height - _loc14_.height),null,null,true);
         var _loc16_:Boolean = false;
         if(param10.keyExists("facebook.user"))
         {
            _loc16_ = true;
         }
         var _loc17_:Boolean = true;
         if(param10.getKey("achievement.post.enabled","1") == "0")
         {
            _loc17_ = false;
         }
         var _loc18_:IItemListWindow = this._window.findChildByName("view_items") as IItemListWindow;
         var _loc19_:IWindowContainer = this._window.findChildByName("bonus_container") as IWindowContainer;
         var _loc20_:IWindowContainer = this._window.findChildByName("regular_ok_container") as IWindowContainer;
         var _loc21_:IWindowContainer = this._window.findChildByName("facebook_nag_container") as IWindowContainer;
         if(this.var_1371 <= 0 || !_loc17_)
         {
            _loc18_.removeListItem(_loc19_);
            _loc18_.removeListItem(_loc21_);
         }
         else
         {
            _loc18_.removeListItem(_loc20_);
            if(_loc16_)
            {
               _loc18_.removeListItem(_loc21_);
            }
            else
            {
               _loc18_.removeListItem(_loc19_);
            }
         }
         var _loc22_:int = 32;
         this._window.height = _loc18_.height + _loc22_;
         this._window.header.controls.visible = false;
      }
      
      public function dispose() : void
      {
         if(this.var_360 != null)
         {
            this.var_360.events.removeEventListener(BadgeImageReadyEvent.const_121,this.onBadgeImageReady);
            this.var_360 = null;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_91 = null;
         this._assets = null;
         this._communication = null;
      }
      
      private function registerAchievementParameters(param1:String) : String
      {
         this.var_91.registerParameter(param1,"pixels",this.var_1370.toString());
         this.var_91.registerParameter(param1,"level",this.var_1804.toString());
         this.var_91.registerParameter(param1,"name",this.var_360.userName);
         return this.var_91.registerParameter(param1,"realname",this.var_360.realName);
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "post_to_facebook":
               _loc3_ = this._communication.getHabboMainConnection(null);
               _loc3_.send(new GetAchievementShareIdComposer(this.var_2545));
               this._window.visible = false;
               break;
            case "close":
               this.dispose();
               return;
         }
      }
      
      private function setBadge(param1:BitmapData, param2:String) : void
      {
         var _loc3_:BitmapData = (this._assets.getAssetByName(param2) as BitmapDataAsset).content as BitmapData;
         var _loc4_:BitmapData = _loc3_.clone();
         _loc4_.copyPixels(param1,param1.rect,new Point((_loc3_.width - param1.width) / 2,(_loc3_.height - param1.height) / 2),null,null,true);
         this.setImage("badge_image",_loc4_);
      }
      
      public function requestPostDialog(param1:String) : void
      {
         HabboWebTools.facebookAchievementPost(this.var_722,this.var_2539,this.var_2543,param1);
      }
      
      private function setImage(param1:String, param2:BitmapData) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(param1) as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.bitmap = param2;
      }
      
      private function onBadgeImageReady(param1:BadgeImageReadyEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.badgeId != this.var_722)
         {
            return;
         }
         this.setBadge(param1.badgeImage,this.const_1535);
      }
      
      private function setText(param1:String, param2:String) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc3_:ITextWindow = this._window.findChildByName(param1) as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.text = param2;
      }
      
      private function registerTextParameters(param1:String) : String
      {
         this.var_91.registerParameter(param1,"badge_name",this.var_2541);
         this.var_91.registerParameter(param1,"badge_desc",this.var_2540);
         this.var_91.registerParameter(param1,"badge_name_fb",this.var_2544);
         this.var_91.registerParameter(param1,"badge_desc_fb",this.var_2542);
         this.var_91.registerParameter(param1,"pixels",this.var_1370.toString());
         this.var_91.registerParameter(param1,"level",this.var_1804.toString());
         this.var_91.registerParameter(param1,"name",this.var_360.userName);
         return this.var_91.registerParameter(param1,"realname",this.var_360.realName);
      }
   }
}
