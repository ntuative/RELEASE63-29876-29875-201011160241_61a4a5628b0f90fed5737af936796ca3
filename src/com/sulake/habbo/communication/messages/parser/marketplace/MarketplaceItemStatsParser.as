package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1403:Array;
      
      private var var_1884:int;
      
      private var var_1882:int;
      
      private var var_1883:int;
      
      private var var_1885:int;
      
      private var _dayOffsets:Array;
      
      private var var_1881:int;
      
      private var var_1402:Array;
      
      public function MarketplaceItemStatsParser()
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
      
      public function get furniTypeId() : int
      {
         return this.var_1882;
      }
      
      public function get historyLength() : int
      {
         return this.var_1885;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_1883;
      }
      
      public function get offerCount() : int
      {
         return this.var_1881;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1402;
      }
      
      public function get averagePrice() : int
      {
         return this.var_1884;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1884 = param1.readInteger();
         this.var_1881 = param1.readInteger();
         this.var_1885 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1403 = [];
         this.var_1402 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1403.push(param1.readInteger());
            this.var_1402.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1883 = param1.readInteger();
         this.var_1882 = param1.readInteger();
         return true;
      }
   }
}
