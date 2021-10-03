package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_243:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2112:Boolean = false;
      
      private var var_2110:int = 0;
      
      private var var_2113:int = 0;
      
      private var var_2081:int;
      
      private var var_2111:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_243,param6,param7);
         this.var_2111 = param1;
         this.var_2113 = param2;
         this.var_2110 = param3;
         this.var_2112 = param4;
         this.var_2081 = param5;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2081;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2110;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2113;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2111;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2112;
      }
   }
}
