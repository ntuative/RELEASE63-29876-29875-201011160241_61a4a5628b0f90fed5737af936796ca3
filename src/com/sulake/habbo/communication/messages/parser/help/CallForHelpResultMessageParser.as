package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CallForHelpResultMessageParser implements IMessageParser
   {
       
      
      private var var_1701:int;
      
      public function CallForHelpResultMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1701 = -1;
         return true;
      }
      
      public function get resultType() : int
      {
         return this.var_1701;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1701 = param1.readInteger();
         return true;
      }
   }
}
