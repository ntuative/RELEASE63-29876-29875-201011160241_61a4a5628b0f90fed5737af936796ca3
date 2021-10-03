package com.sulake.habbo.communication.messages.outgoing.room.action
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class KickBotMessageComposer implements IMessageComposer
   {
       
      
      private var var_1897:int;
      
      public function KickBotMessageComposer(param1:int)
      {
         super();
         this.var_1897 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1897];
      }
      
      public function dispose() : void
      {
      }
   }
}
