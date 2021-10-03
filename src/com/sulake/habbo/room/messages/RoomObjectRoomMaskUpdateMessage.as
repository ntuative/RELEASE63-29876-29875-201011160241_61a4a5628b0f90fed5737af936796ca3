package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1246:String = "door";
      
      public static const const_455:String = "window";
      
      public static const const_562:String = "RORMUM_ADD_MASK";
      
      public static const const_391:String = "RORMUM_ADD_MASK";
      
      public static const const_213:String = "hole";
       
      
      private var var_1974:String = "";
      
      private var var_1975:String = "";
      
      private var var_1977:String = "window";
      
      private var var_1976:Vector3d = null;
      
      private var _type:String = "";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         this._type = param1;
         this.var_1975 = param2;
         this.var_1974 = param3;
         if(param4 != null)
         {
            this.var_1976 = new Vector3d(param4.x,param4.y,param4.z);
         }
         this.var_1977 = param5;
      }
      
      public function get maskCategory() : String
      {
         return this.var_1977;
      }
      
      public function get maskId() : String
      {
         return this.var_1975;
      }
      
      public function get maskLocation() : IVector3d
      {
         return this.var_1976;
      }
      
      public function get maskType() : String
      {
         return this.var_1974;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}
