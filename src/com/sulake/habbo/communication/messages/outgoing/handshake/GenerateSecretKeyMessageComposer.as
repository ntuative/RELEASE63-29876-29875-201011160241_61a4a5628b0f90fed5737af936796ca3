package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GenerateSecretKeyMessageComposer implements IMessageComposer
   {
       
      
      private var var_1912:String;
      
      public function GenerateSecretKeyMessageComposer(param1:String)
      {
         super();
         this.var_1912 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1912];
      }
      
      public function dispose() : void
      {
      }
   }
}
