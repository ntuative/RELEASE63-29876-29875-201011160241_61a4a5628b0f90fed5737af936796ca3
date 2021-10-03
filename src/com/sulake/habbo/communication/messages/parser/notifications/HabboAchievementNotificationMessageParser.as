package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var var_1559:int;
      
      private var var_1804:int;
      
      private var var_2333:int;
      
      private var var_1370:int;
      
      private var _type:int;
      
      private var var_2332:String = "";
      
      private var var_1371:int;
      
      private var var_2159:String = "";
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function get badgeID() : String
      {
         return this.var_2159;
      }
      
      public function get achievementID() : int
      {
         return this.var_2333;
      }
      
      public function get level() : int
      {
         return this.var_1804;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1804 = param1.readInteger();
         this.var_2159 = param1.readString();
         this.var_1559 = param1.readInteger();
         this.var_1370 = param1.readInteger();
         this.var_1371 = param1.readInteger();
         this.var_2333 = param1.readInteger();
         this.var_2332 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2332;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1371;
      }
      
      public function get points() : int
      {
         return this.var_1559;
      }
      
      public function get pixels() : int
      {
         return this.var_1370;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
