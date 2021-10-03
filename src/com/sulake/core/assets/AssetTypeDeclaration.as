package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2442:Class;
      
      private var var_2440:Class;
      
      private var var_2441:String;
      
      private var var_1738:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2441 = param1;
         this.var_2440 = param2;
         this.var_2442 = param3;
         if(rest == null)
         {
            this.var_1738 = new Array();
         }
         else
         {
            this.var_1738 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2442;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2440;
      }
      
      public function get mimeType() : String
      {
         return this.var_2441;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1738;
      }
   }
}
