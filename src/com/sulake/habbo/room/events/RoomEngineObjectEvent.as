package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_258:String = "REOB_OBJECT_ADDED";
      
      public static const const_415:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const const_100:String = "REOR_REMOVE_DIMMER";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_230:String = "REOB_OBJECT_PLACED";
      
      public static const const_122:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_512:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_130:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_583:String = "REOE_OBJECT_REMOVED";
      
      public static const const_139:String = "REOR_REQUEST_CLOTHING_CHANGE";
      
      public static const const_131:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const const_126:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_485:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_689:String = "REOE_OBJECT_SELECTED";
      
      public static const const_522:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_452:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
      
      public static const const_119:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_590:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_128:String = "REOE_WIDGET_REQUEST_TROPHY";
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_288:int;
      
      private var _category:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         this.var_288 = param4;
         this._category = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_288;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
