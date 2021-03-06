package com.sulake.habbo.communication.messages.parser.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementData;
   
   public class AchievementsMessageParser implements IMessageParser
   {
       
      
      private var _achievements:Array;
      
      public function AchievementsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._achievements = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._achievements.push(new AchievementData(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         this._achievements = new Array();
         return true;
      }
      
      public function get achievements() : Array
      {
         return this._achievements;
      }
   }
}
