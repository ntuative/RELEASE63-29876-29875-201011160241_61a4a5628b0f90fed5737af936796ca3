package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.display.BitmapData;
   import flash.net.URLRequest;
   
   public class OfficialRoomImageLoader implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_792:IBitmapWrapperWindow;
      
      private var var_914:String;
      
      private var var_791:String;
      
      private var _navigator:HabboNavigator;
      
      public function OfficialRoomImageLoader(param1:HabboNavigator, param2:String, param3:IBitmapWrapperWindow)
      {
         super();
         this._navigator = param1;
         this.var_791 = param2;
         this.var_792 = param3;
         var _loc4_:String = this._navigator.configuration.getKey("image.library.url");
         this.var_914 = _loc4_ + this.var_791;
         Logger.log("[OFFICIAL ROOM ICON IMAGE DOWNLOADER] : " + this.var_914);
      }
      
      private function onLoadError(param1:AssetLoaderEvent) : void
      {
         Logger.log("Error loading image: " + this.var_914 + ", " + param1);
         this.dispose();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_792 = null;
         this._navigator = null;
      }
      
      private function onImageReady(param1:AssetLoaderEvent) : void
      {
         if(this._disposed)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ == null)
         {
            Logger.log("Loading pic from url: " + this.var_914 + " failed. loaderStruct == null");
            return;
         }
         Logger.log("IMAGE READY: " + this.var_791 + ", " + _loc2_);
         this.setImage();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function startLoad() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.assets.hasAsset(this.var_791))
         {
            this.setImage();
         }
         else
         {
            _loc1_ = new URLRequest(this.var_914);
            _loc2_ = this._navigator.assets.loadAssetFromFile(this.var_791,_loc1_,"image/gif");
            _loc2_.addEventListener(AssetLoaderEvent.const_30,this.onImageReady);
            _loc2_.addEventListener(AssetLoaderEvent.const_45,this.onLoadError);
         }
      }
      
      private function setImage() : void
      {
         var _loc1_:BitmapData = this._navigator.getButtonImage(this.var_791,"");
         this.var_792.bitmap = _loc1_;
         this.var_792.width = _loc1_.width;
         this.var_792.height = _loc1_.height;
         this.var_792.visible = true;
         this.dispose();
      }
   }
}
