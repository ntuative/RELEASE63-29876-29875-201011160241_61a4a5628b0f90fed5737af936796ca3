package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_210:String = "e";
      
      public static const const_77:String = "i";
      
      public static const const_86:String = "s";
       
      
      private var var_1224:String;
      
      private var var_1541:String;
      
      private var var_1543:int;
      
      private var var_2466:int;
      
      private var var_1223:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1541 = param1.readString();
         this.var_2466 = param1.readInteger();
         this.var_1224 = param1.readString();
         this.var_1223 = param1.readInteger();
         this.var_1543 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return this.var_1223;
      }
      
      public function get productType() : String
      {
         return this.var_1541;
      }
      
      public function get expiration() : int
      {
         return this.var_1543;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2466;
      }
      
      public function get extraParam() : String
      {
         return this.var_1224;
      }
   }
}
