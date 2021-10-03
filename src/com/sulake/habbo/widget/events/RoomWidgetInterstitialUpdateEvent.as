package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetInterstitialUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const COMPLETE:String = "RWIUE_COMPLETE";
      
      public static const const_98:String = "RWIUE_SHOW";
       
      
      private var var_37:BitmapData;
      
      private var var_1149:String;
      
      public function RoomWidgetInterstitialUpdateEvent(param1:String, param2:BitmapData, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.var_37 = param2;
         this.var_1149 = param3;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1149;
      }
      
      public function get image() : BitmapData
      {
         return this.var_37;
      }
   }
}