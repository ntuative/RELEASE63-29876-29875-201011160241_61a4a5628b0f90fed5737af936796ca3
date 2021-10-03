package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AchievementNotificationBonus
   {
       
      
      private var _assets:IAssetLibrary;
      
      private var _window:IFrameWindow;
      
      private const const_1770:String = "achievement_bg_001_png";
      
      private var var_91:IHabboLocalizationManager;
      
      public function AchievementNotificationBonus(param1:int, param2:IAssetLibrary, param3:IHabboWindowManager, param4:IHabboLocalizationManager)
      {
         super();
         if(!param2 || !param3 || !param4)
         {
            return;
         }
         this._assets = param2;
         this.var_91 = param4;
         var _loc5_:XmlAsset = param2.getAssetByName("achievement_notification_bonus_xml") as XmlAsset;
         if(_loc5_ == null)
         {
            return;
         }
         this._window = param3.buildFromXML(_loc5_.content as XML) as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.procedure = this.eventHandler;
         this._window.center();
         this.setText("bonus_points","+" + String(param1));
         var _loc6_:BitmapData = (param2.getAssetByName(this.const_1770) as BitmapDataAsset).content as BitmapData;
         var _loc7_:IBitmapWrapperWindow = this._window.findChildByName("achievement_bg") as IBitmapWrapperWindow;
         _loc7_.bitmap = new BitmapData(_loc7_.width,_loc7_.height,true,0);
         _loc7_.bitmap.copyPixels(_loc6_,_loc6_.rect,new Point(0,_loc7_.height - _loc6_.height),null,null,true);
         this._window.header.controls.visible = false;
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
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "close":
               this.dispose();
               return;
            default:
               return;
         }
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
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_91 = null;
         this._assets = null;
      }
   }
}
