package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PlaceObjectErrorMessageParser implements IMessageParser
   {
       
      
      private var var_1436:int;
      
      public function PlaceObjectErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1436 = 0;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1436;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1436 = param1.readInteger();
         return true;
      }
   }
}
