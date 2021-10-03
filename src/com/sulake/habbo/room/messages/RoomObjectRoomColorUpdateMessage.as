package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomColorUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1355:String = "RORCUM_BACKGROUND_COLOR";
       
      
      private var _color:uint = 0;
      
      private var var_2015:Boolean = true;
      
      private var var_1449:int = 0;
      
      private var _type:String = "";
      
      public function RoomObjectRoomColorUpdateMessage(param1:String, param2:uint, param3:int, param4:Boolean)
      {
         super(null,null);
         this._type = param1;
         this._color = param2;
         this.var_1449 = param3;
         this.var_2015 = param4;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get bgOnly() : Boolean
      {
         return this.var_2015;
      }
      
      public function get light() : uint
      {
         return this.var_1449;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}
