package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2573:Boolean;
      
      protected var var_1424:Number;
      
      protected var var_2574:Boolean;
      
      protected var _type:int;
      
      protected var var_875:Boolean;
      
      protected var var_2193:int;
      
      protected var var_2572:Boolean;
      
      protected var var_1842:String;
      
      protected var var_1921:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1638:String;
      
      protected var var_1919:Boolean;
      
      protected var _category:int;
      
      protected var var_1918:int;
      
      protected var var_2580:int;
      
      protected var var_1920:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_1919 = param5;
         this.var_2572 = param6;
         this.var_2573 = param7;
         this.var_2574 = param8;
         this.var_1842 = param9;
         this.var_1424 = param10;
         this.var_2580 = param11;
         this.var_1920 = param12;
         this.var_1918 = param13;
         this.var_1921 = param14;
         this.var_1638 = param15;
         this.var_2193 = param16;
      }
      
      public function get locked() : Boolean
      {
         return this.var_875;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get extra() : Number
      {
         return this.var_1424;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_875 = param1;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get songId() : int
      {
         return this.var_2193;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2574;
      }
      
      public function get slotId() : String
      {
         return this.var_1638;
      }
      
      public function get expires() : int
      {
         return this.var_2580;
      }
      
      public function get creationYear() : int
      {
         return this.var_1921;
      }
      
      public function get creationDay() : int
      {
         return this.var_1920;
      }
      
      public function get stuffData() : String
      {
         return this.var_1842;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2572;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_1919;
      }
      
      public function get creationMonth() : int
      {
         return this.var_1918;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2573;
      }
   }
}
