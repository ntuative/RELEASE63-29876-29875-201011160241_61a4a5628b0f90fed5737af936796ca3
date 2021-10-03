package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_2154:int;
      
      private var var_1529:int;
      
      private var var_1884:int;
      
      private var var_2156:int = -1;
      
      private var var_335:int;
      
      private var var_2155:int;
      
      private var var_37:BitmapData;
      
      private var _offerId:int;
      
      private var var_1530:int;
      
      private var _furniId:int;
      
      private var var_1842:String;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2155 = param3;
         this.var_1842 = param4;
         this.var_1529 = param5;
         this.var_335 = param6;
         this.var_1884 = param7;
         this.var_1530 = param8;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2155;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2154 = param1;
      }
      
      public function get price() : int
      {
         return this.var_1529;
      }
      
      public function get stuffData() : String
      {
         return this.var_1842;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2154;
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
      
      public function get image() : BitmapData
      {
         return this.var_37;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2156 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_37)
         {
            this.var_37.dispose();
            this.var_37 = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         this.var_1529 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1530 = param1;
      }
      
      public function get status() : int
      {
         return this.var_335;
      }
      
      public function get averagePrice() : int
      {
         return this.var_1884;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_37 != null)
         {
            this.var_37.dispose();
         }
         this.var_37 = param1;
      }
   }
}
