package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var var_1804:int;
      
      private var var_2547:int;
      
      private var var_2546:int;
      
      private var _type:int;
      
      private var var_2548:int;
      
      private var var_722:String;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1804 = param1.readInteger();
         this.var_722 = param1.readString();
         this.var_2547 = param1.readInteger();
         this.var_2546 = param1.readInteger();
         this.var_2548 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1804;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2547;
      }
      
      public function get badgeId() : String
      {
         return this.var_722;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2546;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2548;
      }
   }
}
