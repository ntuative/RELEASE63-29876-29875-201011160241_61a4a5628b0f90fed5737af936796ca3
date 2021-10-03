package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LookToMessageComposer implements IMessageComposer
   {
       
      
      private var var_2550:int;
      
      private var var_2551:int;
      
      public function LookToMessageComposer(param1:int, param2:int)
      {
         super();
         this.var_2550 = param1;
         this.var_2551 = param2;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2550,this.var_2551];
      }
   }
}
