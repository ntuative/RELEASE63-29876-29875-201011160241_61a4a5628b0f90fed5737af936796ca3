package com.sulake.core.assets
{
   import flash.utils.getQualifiedClassName;
   
   public class UnknownAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_1434:AssetTypeDeclaration;
      
      private var var_914:String;
      
      private var var_158:Object = null;
      
      public function UnknownAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1434 = param1;
         this.var_914 = param2;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1434;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         this.var_158 = param1;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         this.var_158 = param1.content as Object;
      }
      
      public function get content() : Object
      {
         return this.var_158;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_158 = null;
            this.var_1434 = null;
            this.var_914 = null;
         }
      }
      
      public function get url() : String
      {
         return this.var_914;
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + ": " + this.var_158;
      }
   }
}
