package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_768:IAssetLoader;
      
      private var var_1452:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1452 = param1;
         this.var_768 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_768;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_768 != null)
            {
               if(!this.var_768.disposed)
               {
                  this.var_768.dispose();
                  this.var_768 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return this.var_1452;
      }
   }
}
