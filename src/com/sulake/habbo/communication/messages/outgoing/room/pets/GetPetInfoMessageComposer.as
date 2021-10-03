package com.sulake.habbo.communication.messages.outgoing.room.pets
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GetPetInfoMessageComposer implements IMessageComposer
   {
       
      
      private var var_1618:int;
      
      public function GetPetInfoMessageComposer(param1:int)
      {
         super();
         this.var_1618 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1618];
      }
      
      public function dispose() : void
      {
      }
   }
}
