package com.sulake.habbo.widget.events
{
   public class RoomWidgetDanceUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_654:String = "RWUE_DANCE";
       
      
      private var var_76:int;
      
      public function RoomWidgetDanceUpdateEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_654,param2,param3);
         this.var_76 = param1;
      }
      
      public function get style() : int
      {
         return this.var_76;
      }
   }
}
