package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1682:int;
      
      private var var_1436:int;
      
      private var var_1683:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return this.var_1682;
      }
      
      public function flush() : Boolean
      {
         this.var_1436 = 0;
         this.var_1682 = 0;
         this.var_1683 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1436;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1682 = param1.readInteger();
         this.var_1436 = param1.readInteger();
         this.var_1683 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return this.var_1683;
      }
   }
}
