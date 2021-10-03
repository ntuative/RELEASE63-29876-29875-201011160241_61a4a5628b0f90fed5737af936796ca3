package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const PET_INFO:String = "RWPIUE_PET_INFO";
       
      
      private var var_1804:int;
      
      private var var_1873:int;
      
      private var var_1869:int;
      
      private var _nutrition:int;
      
      private var var_1867:int;
      
      private var var_1868:int;
      
      private var _energy:int;
      
      private var var_1185:int;
      
      private var var_1874:int;
      
      private var var_1871:int;
      
      private var var_1872:int;
      
      private var _id:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_1870:int;
      
      private var var_37:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1876:Boolean;
      
      private var _name:String;
      
      private var var_718:int;
      
      private var var_1875:int;
      
      public function RoomWidgetPetInfoUpdateEvent(param1:int, param2:int, param3:String, param4:int, param5:BitmapData, param6:Boolean, param7:int, param8:String, param9:int, param10:Boolean = false, param11:Boolean = false)
      {
         super(RoomWidgetPetInfoUpdateEvent.PET_INFO,param10,param11);
         this.var_1185 = param1;
         this.var_1870 = param2;
         this._name = param3;
         this._id = param4;
         this.var_37 = param5;
         this.var_1876 = param6;
         this.var_1875 = param7;
         this._ownerName = param8;
         this.var_1871 = param9;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_1876;
      }
      
      public function get level() : int
      {
         return this.var_1804;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_1868 = param1;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1804 = param1;
      }
      
      public function get petRace() : int
      {
         return this.var_1870;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         this.var_718 = param1;
      }
      
      public function get experienceMax() : int
      {
         return this.var_1867;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_1869;
      }
      
      public function get ownerId() : int
      {
         return this.var_1875;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_1867 = param1;
      }
      
      public function get roomIndex() : int
      {
         return this.var_1871;
      }
      
      public function get energyMax() : int
      {
         return this.var_1874;
      }
      
      public function get levelMax() : int
      {
         return this.var_1868;
      }
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_718;
      }
      
      public function set canOwnerBeKicked(param1:Boolean) : void
      {
         this._canOwnerBeKicked = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_1869 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_37;
      }
      
      public function set petRespect(param1:int) : void
      {
         this._petRespect = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_1873 = param1;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return this.var_1873;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_1874 = param1;
      }
      
      public function get petType() : int
      {
         return this.var_1185;
      }
      
      public function set age(param1:int) : void
      {
         this.var_1872 = param1;
      }
      
      public function get age() : int
      {
         return this.var_1872;
      }
   }
}
