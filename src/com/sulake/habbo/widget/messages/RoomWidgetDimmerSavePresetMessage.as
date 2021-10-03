package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_656:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_2035:int;
      
      private var var_2036:int;
      
      private var var_2452:Boolean;
      
      private var var_981:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_656);
         this.var_2036 = param1;
         this.var_2035 = param2;
         this._color = param3;
         this.var_981 = param4;
         this.var_2452 = param5;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2035;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2036;
      }
      
      public function get brightness() : int
      {
         return this.var_981;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2452;
      }
   }
}
