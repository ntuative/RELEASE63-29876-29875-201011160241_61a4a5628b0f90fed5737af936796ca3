package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetRespectFailedParser implements IMessageParser
   {
       
      
      private var var_1973:int;
      
      private var _requiredDays:int;
      
      public function PetRespectFailedParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._requiredDays = param1.readInteger();
         this.var_1973 = param1.readInteger();
         return true;
      }
      
      public function get avatarAgeInDays() : int
      {
         return this.var_1973;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get requiredDays() : int
      {
         return this._requiredDays;
      }
   }
}
