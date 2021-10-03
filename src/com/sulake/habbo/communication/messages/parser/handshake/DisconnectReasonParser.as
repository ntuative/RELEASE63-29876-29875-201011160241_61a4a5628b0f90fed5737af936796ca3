package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class DisconnectReasonParser implements IMessageParser
   {
       
      
      private var var_1231:int;
      
      public function DisconnectReasonParser()
      {
         super();
         this.var_1231 = -1;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1231 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get method_2() : int
      {
         return this.var_1231;
      }
   }
}
