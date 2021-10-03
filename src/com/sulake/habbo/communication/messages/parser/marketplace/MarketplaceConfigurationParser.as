package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_2324:int;
      
      private var var_1639:int;
      
      private var var_2325:int;
      
      private var var_2323:int;
      
      private var var_2322:int;
      
      private var var_1640:int;
      
      private var var_2253:int;
      
      private var var_1270:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2324;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1639;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2253;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2323;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2322;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1640;
      }
      
      public function get commission() : int
      {
         return this.var_2325;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1270 = param1.readBoolean();
         this.var_2325 = param1.readInteger();
         this.var_1639 = param1.readInteger();
         this.var_1640 = param1.readInteger();
         this.var_2323 = param1.readInteger();
         this.var_2324 = param1.readInteger();
         this.var_2322 = param1.readInteger();
         this.var_2253 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1270;
      }
   }
}
