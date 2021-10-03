package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage
   {
      
      public static const const_588:String = "RWDPM_PREVIEW_DIMMER_PRESET";
       
      
      private var var_981:int;
      
      private var _color:uint;
      
      private var var_2015:Boolean;
      
      public function RoomWidgetDimmerPreviewMessage(param1:uint, param2:int, param3:Boolean)
      {
         super(const_588);
         this._color = param1;
         this.var_981 = param2;
         this.var_2015 = param3;
      }
      
      public function get brightness() : int
      {
         return this.var_981;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get bgOnly() : Boolean
      {
         return this.var_2015;
      }
   }
}
