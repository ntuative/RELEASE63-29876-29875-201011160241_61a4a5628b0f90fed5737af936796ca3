package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_158:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_914:String;
      
      protected var var_737:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_737 = param1;
         this.var_914 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_737;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_158 = DisplayAsset(param1).var_158;
            this.var_737 = DisplayAsset(param1).var_737;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function get url() : String
      {
         return this.var_914;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_158 = param1 as DisplayObject;
            if(this.var_158 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_158 = DisplayAsset(param1).var_158;
            this.var_737 = DisplayAsset(param1).var_737;
            if(this.var_158 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function get content() : Object
      {
         return this.var_158;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_158.loaderInfo != null)
            {
               if(this.var_158.loaderInfo.loader != null)
               {
                  this.var_158.loaderInfo.loader.unload();
               }
            }
            this.var_158 = null;
            this.var_737 = null;
            this._disposed = true;
            this.var_914 = null;
         }
      }
   }
}
