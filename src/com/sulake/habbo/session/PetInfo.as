package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1804:int;
      
      private var var_2220:int;
      
      private var var_1873:int;
      
      private var var_1869:int;
      
      private var _nutrition:int;
      
      private var var_1618:int;
      
      private var var_1868:int;
      
      private var var_1867:int;
      
      private var _energy:int;
      
      private var var_1872:int;
      
      private var var_1874:int;
      
      private var _ownerName:String;
      
      private var var_1875:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return this.var_1804;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2220 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1804 = param1;
      }
      
      public function get petId() : int
      {
         return this.var_1618;
      }
      
      public function get experienceMax() : int
      {
         return this.var_1867;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_1869;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_1868 = param1;
      }
      
      public function get ownerId() : int
      {
         return this.var_1875;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1618 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return this.var_1874;
      }
      
      public function get respect() : int
      {
         return this.var_2220;
      }
      
      public function get levelMax() : int
      {
         return this.var_1868;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_1867 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_1873 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_1869 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_1875 = param1;
      }
      
      public function get experience() : int
      {
         return this.var_1873;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_1874 = param1;
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
