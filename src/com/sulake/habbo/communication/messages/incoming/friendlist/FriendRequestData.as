package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_2163:int;
      
      private var var_2162:String;
      
      private var var_969:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_969 = param1.readInteger();
         this.var_2162 = param1.readString();
         this.var_2163 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_969;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2163;
      }
      
      public function get requesterName() : String
      {
         return this.var_2162;
      }
   }
}
