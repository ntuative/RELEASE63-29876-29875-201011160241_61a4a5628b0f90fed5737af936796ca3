package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1842:String;
      
      private var var_1321:String;
      
      private var var_2501:Boolean;
      
      private var var_1424:int;
      
      private var var_2443:int;
      
      private var var_2480:Boolean;
      
      private var var_1638:String = "";
      
      private var var_2500:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1560:int;
      
      private var var_2499:Boolean;
      
      private var var_2193:int = -1;
      
      private var var_2259:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2443 = param1;
         this.var_1321 = param2;
         this._objId = param3;
         this.var_1560 = param4;
         this._category = param5;
         this.var_1842 = param6;
         this.var_2501 = param7;
         this.var_2500 = param8;
         this.var_2499 = param9;
         this.var_2480 = param10;
         this.var_2259 = param11;
      }
      
      public function get slotId() : String
      {
         return this.var_1638;
      }
      
      public function get extra() : int
      {
         return this.var_1424;
      }
      
      public function get classId() : int
      {
         return this.var_1560;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2480;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2501;
      }
      
      public function get stripId() : int
      {
         return this.var_2443;
      }
      
      public function get stuffData() : String
      {
         return this.var_1842;
      }
      
      public function get songId() : int
      {
         return this.var_2193;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1638 = param1;
         this.var_1424 = param2;
      }
      
      public function get itemType() : String
      {
         return this.var_1321;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2259;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2499;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2500;
      }
   }
}
