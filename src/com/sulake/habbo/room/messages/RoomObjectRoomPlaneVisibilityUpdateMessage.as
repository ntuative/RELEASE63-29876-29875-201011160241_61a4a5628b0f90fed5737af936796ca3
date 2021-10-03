package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomPlaneVisibilityUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_878:String = "RORPVUM_FLOOR_VISIBILITY";
      
      public static const const_876:String = "RORPVUM_WALL_VISIBILITY";
       
      
      private var var_333:Boolean = false;
      
      private var _type:String = "";
      
      public function RoomObjectRoomPlaneVisibilityUpdateMessage(param1:String, param2:Boolean)
      {
         super(null,null);
         this._type = param1;
         this.var_333 = param2;
      }
      
      public function get visible() : Boolean
      {
         return this.var_333;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}
