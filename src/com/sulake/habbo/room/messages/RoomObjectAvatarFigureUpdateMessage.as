package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1879:String;
      
      private var var_564:String;
      
      private var var_840:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_564 = param1;
         this.var_840 = param2;
         this.var_1879 = param3;
      }
      
      public function get race() : String
      {
         return this.var_1879;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
      
      public function get gender() : String
      {
         return this.var_840;
      }
   }
}
