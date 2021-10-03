package com.sulake.habbo.communication.messages.parser.inventory.badges
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class BadgeAndPointLimit
   {
       
      
      private var var_1483:int;
      
      private var var_722:String;
      
      public function BadgeAndPointLimit(param1:String, param2:IMessageDataWrapper)
      {
         super();
         this.var_722 = "ACH_" + param1 + param2.readInteger();
         this.var_1483 = param2.readInteger();
      }
      
      public function get limit() : int
      {
         return this.var_1483;
      }
      
      public function get badgeId() : String
      {
         return this.var_722;
      }
   }
}
