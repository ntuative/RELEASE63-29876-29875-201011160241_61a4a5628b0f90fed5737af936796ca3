package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_1433:String;
      
      private var var_323:int;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function get flatName() : String
      {
         return this.var_1433;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_323 = param1.readInteger();
         this.var_1433 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_323 + ", " + this.var_1433);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_323;
      }
   }
}
