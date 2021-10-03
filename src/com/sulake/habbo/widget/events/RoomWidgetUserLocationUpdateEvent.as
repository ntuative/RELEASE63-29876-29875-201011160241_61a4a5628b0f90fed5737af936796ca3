package com.sulake.habbo.widget.events
{
   import flash.geom.Rectangle;
   
   public class RoomWidgetUserLocationUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_1435:String = "RWULUE_USER_LOCATION_UPDATE";
       
      
      private var var_971:Rectangle;
      
      private var _userId:int;
      
      public function RoomWidgetUserLocationUpdateEvent(param1:int, param2:Rectangle, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_1435,param3,param4);
         this._userId = param1;
         this.var_971 = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get rectangle() : Rectangle
      {
         return this.var_971;
      }
   }
}
