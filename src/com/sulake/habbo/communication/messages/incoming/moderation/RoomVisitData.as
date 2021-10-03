package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_893:String;
      
      private var var_2326:int;
      
      private var var_1796:Boolean;
      
      private var _roomId:int;
      
      private var var_2327:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1796 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_893 = param1.readString();
         this.var_2327 = param1.readInteger();
         this.var_2326 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_1796;
      }
      
      public function get roomName() : String
      {
         return this.var_893;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2326;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get enterHour() : int
      {
         return this.var_2327;
      }
   }
}
