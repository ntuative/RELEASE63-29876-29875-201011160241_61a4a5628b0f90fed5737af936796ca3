package com.sulake.habbo.communication.messages.parser.room.publicroom
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ParkBusCannotEnterMessageParser implements IMessageParser
   {
       
      
      private var var_1231:String = "";
      
      public function ParkBusCannotEnterMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1231 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1231 = "";
         return true;
      }
      
      public function get method_2() : String
      {
         return this.var_1231;
      }
   }
}
