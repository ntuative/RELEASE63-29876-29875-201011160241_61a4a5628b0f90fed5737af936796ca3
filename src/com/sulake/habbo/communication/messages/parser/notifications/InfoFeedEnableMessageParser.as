package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InfoFeedEnableMessageParser implements IMessageParser
   {
       
      
      private var var_1772:Boolean;
      
      public function InfoFeedEnableMessageParser()
      {
         super();
      }
      
      public function get enabled() : Boolean
      {
         return this.var_1772;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1772 = param1.readBoolean();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1772 = false;
         return true;
      }
   }
}
