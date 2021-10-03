package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1985:int;
      
      private var var_1194:int;
      
      private var var_1986:int;
      
      private var var_1438:int;
      
      private var var_109:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1438 = param1.readInteger();
         this.var_1986 = param1.readInteger();
         this.var_1194 = param1.readInteger();
         this.var_1985 = param1.readInteger();
         this.var_109 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1438);
      }
      
      public function get chatRecordId() : int
      {
         return this.var_1985;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1194;
      }
      
      public function get callerUserId() : int
      {
         return this.var_1986;
      }
      
      public function get callId() : int
      {
         return this.var_1438;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_109;
      }
   }
}
