package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFlatControlUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2391:String;
      
      private var var_2390:Boolean = false;
      
      public function RoomObjectAvatarFlatControlUpdateMessage(param1:String)
      {
         super();
         this.var_2391 = param1;
         if(param1 != null && param1.indexOf("useradmin") != -1)
         {
            this.var_2390 = true;
         }
      }
      
      public function get rawData() : String
      {
         return this.var_2391;
      }
      
      public function get isAdmin() : Boolean
      {
         return this.var_2390;
      }
   }
}
