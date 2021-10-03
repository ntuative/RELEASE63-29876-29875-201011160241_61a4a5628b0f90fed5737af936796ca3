package com.sulake.core.assets
{
   import flash.text.Font;
   
   public class FontAsset implements IAsset
   {
       
      
      protected var var_158:Font;
      
      protected var _disposed:Boolean = false;
      
      protected var var_1434:AssetTypeDeclaration;
      
      public function FontAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1434 = param1;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length())
         {
            _loc3_ = param1[_loc2_].attribute("key");
            _loc4_ = param1[_loc2_].attribute("value");
            _loc2_++;
         }
      }
      
      public function get url() : String
      {
         return null;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var fonts:Array = null;
         var unknown:Object = param1;
         try
         {
            if(unknown is Class)
            {
               Font.registerFont(unknown as Class);
               fonts = Font.enumerateFonts(false);
               this.var_158 = fonts.pop();
            }
         }
         catch(e:Error)
         {
            throw new Error("Failed to register font: " + unknown.toString());
         }
      }
      
      public function get content() : Object
      {
         return this.var_158 as Object;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is FontAsset)
         {
            this.var_158 = FontAsset(param1).var_158;
            return;
         }
         throw new Error("Provided asset should be of type FontAsset!");
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1434;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_1434 = null;
            this.var_158 = null;
            this._disposed = true;
         }
      }
   }
}
