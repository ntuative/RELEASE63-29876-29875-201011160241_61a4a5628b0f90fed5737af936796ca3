package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1529:int;
      
      private var var_1884:int;
      
      private var var_2156:int = -1;
      
      private var var_335:int;
      
      private var var_2155:int;
      
      private var _offerId:int;
      
      private var var_1530:int;
      
      private var _furniId:int;
      
      private var var_1842:String;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2155 = param3;
         this.var_1842 = param4;
         this.var_1529 = param5;
         this.var_335 = param6;
         this.var_2156 = param7;
         this.var_1884 = param8;
         this.var_1530 = param9;
      }
      
      public function get status() : int
      {
         return this.var_335;
      }
      
      public function get price() : int
      {
         return this.var_1529;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2156;
      }
      
      public function get offerCount() : int
      {
         return this.var_1530;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniType() : int
      {
         return this.var_2155;
      }
      
      public function get averagePrice() : int
      {
         return this.var_1884;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get stuffData() : String
      {
         return this.var_1842;
      }
   }
}
