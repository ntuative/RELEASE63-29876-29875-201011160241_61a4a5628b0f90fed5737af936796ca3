package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RemovePetFromFlatMessageComposer implements IMessageComposer
   {
       
      
      private var var_1618:int;
      
      public function RemovePetFromFlatMessageComposer(param1:int)
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
