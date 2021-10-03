package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_598:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2439:BitmapData;
      
      private var var_2159:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_598,param3,param4);
         this.var_2159 = param1;
         this.var_2439 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return this.var_2439;
      }
      
      public function get badgeID() : String
      {
         return this.var_2159;
      }
   }
}
