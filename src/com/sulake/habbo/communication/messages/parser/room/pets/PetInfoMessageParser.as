package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1872:int;
      
      private var var_564:String;
      
      private var var_1804:int;
      
      private var var_2220:int;
      
      private var var_1873:int;
      
      private var var_2313:int;
      
      private var _nutrition:int;
      
      private var var_1618:int;
      
      private var var_2315:int;
      
      private var var_2316:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1875:int;
      
      private var var_2314:int;
      
      public function PetInfoMessageParser()
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
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2313;
      }
      
      public function flush() : Boolean
      {
         this.var_1618 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2315;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2316;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2314;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2220;
      }
      
      public function get petId() : int
      {
         return this.var_1618;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1618 = param1.readInteger();
         this._name = param1.readString();
         this.var_1804 = param1.readInteger();
         this.var_2315 = param1.readInteger();
         this.var_1873 = param1.readInteger();
         this.var_2316 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2313 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2314 = param1.readInteger();
         this.var_564 = param1.readString();
         this.var_2220 = param1.readInteger();
         this.var_1875 = param1.readInteger();
         this.var_1872 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get experience() : int
      {
         return this.var_1873;
      }
      
      public function get ownerId() : int
      {
         return this.var_1875;
      }
      
      public function get age() : int
      {
         return this.var_1872;
      }
   }
}
