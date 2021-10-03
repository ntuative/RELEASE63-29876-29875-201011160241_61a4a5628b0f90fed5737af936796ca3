package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCatMessageParser implements IMessageParser
   {
       
      
      private var var_323:int;
      
      private var var_1617:int;
      
      public function FlatCatMessageParser()
      {
         super();
      }
      
      public function get flatId() : int
      {
         return this.var_323;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_323 = param1.readInteger();
         this.var_1617 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_323 = 0;
         this.var_1617 = 0;
         return true;
      }
      
      public function get nodeId() : int
      {
         return this.var_1617;
      }
   }
}
