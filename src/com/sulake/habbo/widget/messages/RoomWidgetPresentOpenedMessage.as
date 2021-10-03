package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1450:String = "RWPOMD_PRESENT_OPENED";
       
      
      private var var_1560:int;
      
      private var var_1321:String;
      
      public function RoomWidgetPresentOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         this.var_1321 = param2;
         this.var_1560 = param3;
      }
      
      public function get classId() : int
      {
         return this.var_1560;
      }
      
      public function get itemType() : String
      {
         return this.var_1321;
      }
   }
}
