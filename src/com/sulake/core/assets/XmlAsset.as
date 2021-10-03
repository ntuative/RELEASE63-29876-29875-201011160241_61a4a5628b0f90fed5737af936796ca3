package com.sulake.core.assets
{
   import flash.utils.ByteArray;
   
   public class XmlAsset implements IAsset
   {
       
      
      private var var_158:XML;
      
      private var _disposed:Boolean = false;
      
      private var var_1434:AssetTypeDeclaration;
      
      private var var_914:String;
      
      public function XmlAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1434 = param1;
         this.var_914 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1434;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function get url() : String
      {
         return this.var_914;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 is Class)
         {
            _loc2_ = new param1() as ByteArray;
            this.var_158 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is ByteArray)
         {
            _loc2_ = param1 as ByteArray;
            this.var_158 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is String)
         {
            this.var_158 = new XML(param1 as String);
            return;
         }
         if(param1 is XML)
         {
            this.var_158 = param1 as XML;
            return;
         }
         if(param1 is XmlAsset)
         {
            this.var_158 = XmlAsset(param1).var_158;
            return;
         }
      }
      
      public function get content() : Object
      {
         return this.var_158 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is XmlAsset)
         {
            this.var_158 = XmlAsset(param1).var_158;
            return;
         }
         throw Error("Provided asset is not of type XmlAsset!");
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
   }
}
