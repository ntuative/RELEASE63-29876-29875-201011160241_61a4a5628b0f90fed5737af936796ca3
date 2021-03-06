package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1403:Array;
      
      private var var_1884:int;
      
      private var var_1882:int;
      
      private var var_1885:int;
      
      private var var_1883:int;
      
      private var _dayOffsets:Array;
      
      private var var_1881:int;
      
      private var var_1402:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1403;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1403 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return this.var_1882;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1402 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_1884 = param1;
      }
      
      public function get historyLength() : int
      {
         return this.var_1885;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_1883;
      }
      
      public function get offerCount() : int
      {
         return this.var_1881;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1881 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1402;
      }
      
      public function get averagePrice() : int
      {
         return this.var_1884;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_1883 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_1885 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_1882 = param1;
      }
   }
}
