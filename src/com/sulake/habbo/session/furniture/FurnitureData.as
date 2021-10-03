package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1688:String = "e";
      
      public static const const_1633:String = "i";
      
      public static const const_1652:String = "s";
       
      
      private var _name:String;
      
      private var var_2211:int;
      
      private var var_2212:int;
      
      private var _type:String;
      
      private var var_2210:int;
      
      private var _id:int;
      
      private var var_1504:String;
      
      private var var_2213:String;
      
      private var _revision:int;
      
      private var _title:String;
      
      private var var_1242:Array;
      
      private var var_2208:int;
      
      private var _offerId:int;
      
      private var var_2209:int;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String, param13:int, param14:int)
      {
         super();
         this._type = param1;
         this._id = param2;
         this._name = param3;
         this.var_2210 = param4;
         this._revision = param5;
         this.var_2209 = param6;
         this.var_2211 = param7;
         this.var_2208 = param8;
         this.var_1242 = param9;
         this._title = param10;
         this.var_1504 = param11;
         this.var_2213 = param12;
         this.var_2212 = param13;
         this._offerId = param14;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2212;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get description() : String
      {
         return this.var_1504;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get colours() : Array
      {
         return this.var_1242;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get adUrl() : String
      {
         return this.var_2213;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get revision() : int
      {
         return this._revision;
      }
      
      public function get colourIndex() : int
      {
         return this.var_2210;
      }
      
      public function get tileSizeX() : int
      {
         return this.var_2209;
      }
      
      public function get tileSizeY() : int
      {
         return this.var_2211;
      }
      
      public function get tileSizeZ() : int
      {
         return this.var_2208;
      }
   }
}
