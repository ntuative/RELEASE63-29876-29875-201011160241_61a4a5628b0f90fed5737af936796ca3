package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1804:int;
      
      private var var_1873:int;
      
      private var var_1869:int;
      
      private var _type:int;
      
      private var var_1618:int = -1;
      
      private var var_1868:int;
      
      private var _nutrition:int;
      
      private var var_1867:int;
      
      private var _energy:int;
      
      private var var_1879:int;
      
      private var var_1874:int;
      
      private var var_1871:int;
      
      private var var_1872:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_37:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1876:Boolean;
      
      private var _name:String = "";
      
      private var var_1875:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_1876;
      }
      
      public function get level() : int
      {
         return this.var_1804;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get experienceMax() : int
      {
         return this.var_1867;
      }
      
      public function get id() : int
      {
         return this.var_1618;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_1869;
      }
      
      public function get ownerId() : int
      {
         return this.var_1875;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1618 = param1.id;
         this._type = param1.petType;
         this.var_1879 = param1.petRace;
         this.var_37 = param1.image;
         this.var_1876 = param1.isOwnPet;
         this.var_1875 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1804 = param1.level;
         this.var_1868 = param1.levelMax;
         this.var_1873 = param1.experience;
         this.var_1867 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_1874 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_1869 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_1871 = param1.roomIndex;
         this.var_1872 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return this.var_1871;
      }
      
      public function get type() : int
      {
         return this._type;
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
      
      public function get race() : int
      {
         return this.var_1879;
      }
      
      public function get image() : BitmapData
      {
         return this.var_37;
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
      
      public function get age() : int
      {
         return this.var_1872;
      }
   }
}
