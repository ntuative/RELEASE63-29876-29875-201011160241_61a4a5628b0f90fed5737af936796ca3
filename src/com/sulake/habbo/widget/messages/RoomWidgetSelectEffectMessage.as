package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_685:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_713:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_787:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_1311:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         this.var_1311 = param2;
      }
      
      public function get effectType() : int
      {
         return this.var_1311;
      }
   }
}
