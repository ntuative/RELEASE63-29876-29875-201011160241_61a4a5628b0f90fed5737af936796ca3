package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_608:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1880:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_608);
         this.var_1880 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_1880;
      }
   }
}
