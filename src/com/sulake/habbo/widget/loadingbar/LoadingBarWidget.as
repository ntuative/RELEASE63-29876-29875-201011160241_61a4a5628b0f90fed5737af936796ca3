package com.sulake.habbo.widget.loadingbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IDisplayObjectWrapper;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetInterstitialUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetLoadingBarUpdateEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   
   public class LoadingBarWidget extends RoomWidgetBase
   {
       
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1149:String = "";
      
      private var var_438:Sprite = null;
      
      private var _window:IBorderWindow;
      
      private var var_37:BitmapData;
      
      public function LoadingBarWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param4;
      }
      
      private function showInterface() : void
      {
         if(!this.createWindow())
         {
            return;
         }
         this._window.visible = true;
         this._window.center();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetInterstitialUpdateEvent.const_98,this.onShowInterstitial);
         param1.addEventListener(RoomWidgetLoadingBarUpdateEvent.const_98,this.onShowLoadingBar);
         param1.addEventListener(RoomWidgetLoadingBarUpdateEvent.const_257,this.onHideLoadingBar);
         super.registerUpdateEvents(param1);
      }
      
      private function onShowInterstitial(param1:RoomWidgetInterstitialUpdateEvent) : void
      {
         var _loc5_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(!this.createWindow())
         {
            return;
         }
         if(this.var_37 != null)
         {
            this.var_37.dispose();
         }
         this.var_37 = param1.image;
         this.var_1149 = param1.clickUrl;
         var _loc2_:IDisplayObjectWrapper = this._window.findChildByName("image") as IDisplayObjectWrapper;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = Math.max(0,this.var_37.width - _loc2_.width);
         var _loc4_:int = Math.max(0,this.var_37.height - _loc2_.height);
         this._window.scale(_loc3_,_loc4_);
         if(this.var_438 == null)
         {
            this.var_438 = new Sprite();
            this.var_438.addChild(new Bitmap(this.var_37));
            this.var_438.addEventListener(MouseEvent.CLICK,this.clickHandler);
         }
         else
         {
            _loc5_ = this.var_438.getChildAt(0) as Bitmap;
            if(_loc5_ != null)
            {
               _loc5_.bitmapData = this.var_37;
            }
         }
         _loc2_.setDisplayObject(this.var_438);
         this._window.visible = true;
         this._window.center();
      }
      
      private function clickHandler(param1:Event) : void
      {
         if(this.var_1149 != "")
         {
            HabboWebTools.openWebPage(this.var_1149);
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetInterstitialUpdateEvent.const_98,this.onShowInterstitial);
         param1.removeEventListener(RoomWidgetLoadingBarUpdateEvent.const_98,this.onShowLoadingBar);
         param1.removeEventListener(RoomWidgetLoadingBarUpdateEvent.const_257,this.onHideLoadingBar);
      }
      
      private function onHideLoadingBar(param1:RoomWidgetLoadingBarUpdateEvent) : void
      {
         if(param1 == null || param1.type != RoomWidgetLoadingBarUpdateEvent.const_257)
         {
            return;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      private function onShowLoadingBar(param1:RoomWidgetLoadingBarUpdateEvent) : void
      {
         if(param1 == null || param1.type != RoomWidgetLoadingBarUpdateEvent.const_98)
         {
            return;
         }
         if(!this.createWindow())
         {
            return;
         }
         this._window.visible = true;
         this._window.center();
      }
      
      private function createWindow() : Boolean
      {
         var _loc4_:int = 0;
         if(this._window != null)
         {
            return true;
         }
         var _loc1_:XmlAsset = assets.getAssetByName("room_loading_bar") as XmlAsset;
         if(_loc1_ == null)
         {
            return false;
         }
         this._window = windowManager.buildFromXML(_loc1_.content as XML) as IBorderWindow;
         if(this._window == null)
         {
            return false;
         }
         this._window.visible = false;
         var _loc2_:IRegionWindow = this._window.findChildByName("region") as IRegionWindow;
         if(_loc2_ != null)
         {
         }
         var _loc3_:IDisplayObjectWrapper = this._window.findChildByName("image") as IDisplayObjectWrapper;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.height;
            this._window.scale(0,-_loc4_);
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_438 != null)
         {
            this.var_438.removeEventListener(MouseEvent.CLICK,this.clickHandler);
            this.var_438 = null;
         }
         if(this.var_37 != null)
         {
            this.var_37.dispose();
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this._config = null;
         super.dispose();
      }
   }
}
