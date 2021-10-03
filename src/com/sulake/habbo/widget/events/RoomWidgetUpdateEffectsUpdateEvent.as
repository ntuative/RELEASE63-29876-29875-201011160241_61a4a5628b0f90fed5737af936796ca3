package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_658:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_233:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_658,param2,param3);
         this.var_233 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_233;
      }
   }
}
