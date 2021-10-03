package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1321:String;
      
      private var var_1917:int;
      
      private var var_1916:int;
      
      private var var_1424:int;
      
      private var var_1921:int;
      
      private var _category:int;
      
      private var var_2627:int;
      
      private var var_1920:int;
      
      private var var_1923:int;
      
      private var var_1922:int;
      
      private var var_1918:int;
      
      private var var_1919:Boolean;
      
      private var var_1842:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_1917 = param1;
         this.var_1321 = param2;
         this.var_1916 = param3;
         this.var_1922 = param4;
         this._category = param5;
         this.var_1842 = param6;
         this.var_1424 = param7;
         this.var_1923 = param8;
         this.var_1920 = param9;
         this.var_1918 = param10;
         this.var_1921 = param11;
         this.var_1919 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_1922;
      }
      
      public function get extra() : int
      {
         return this.var_1424;
      }
      
      public function get stuffData() : String
      {
         return this.var_1842;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_1919;
      }
      
      public function get creationMonth() : int
      {
         return this.var_1918;
      }
      
      public function get roomItemID() : int
      {
         return this.var_1916;
      }
      
      public function get itemType() : String
      {
         return this.var_1321;
      }
      
      public function get itemID() : int
      {
         return this.var_1917;
      }
      
      public function get songID() : int
      {
         return this.var_1424;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_1923;
      }
      
      public function get creationYear() : int
      {
         return this.var_1921;
      }
      
      public function get creationDay() : int
      {
         return this.var_1920;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
