package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1630:int = 0;
      
      private var var_1758:int = 0;
      
      private var var_1631:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1631 = 0;
         this.var_1630 = 0;
         return true;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1630;
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1631;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1631 = param1.readInteger();
         this.var_1630 = param1.readInteger();
         this.var_1758 = param1.readInteger();
         return true;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1758;
      }
   }
}
