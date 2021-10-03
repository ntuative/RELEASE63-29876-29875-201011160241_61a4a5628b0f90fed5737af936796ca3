package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementBonusMessageParser implements IMessageParser
   {
       
      
      private var var_1371:int;
      
      public function HabboAchievementBonusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1371 = param1.readInteger();
         return true;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1371;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
