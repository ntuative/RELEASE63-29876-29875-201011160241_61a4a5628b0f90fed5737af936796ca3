package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_564:String;
      
      private var var_1514:String;
      
      private var var_1702:String;
      
      private var var_1331:int;
      
      private var var_840:int;
      
      private var var_1512:String;
      
      private var _name:String;
      
      private var var_1703:Boolean;
      
      private var var_632:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_840 = param1.readInteger();
         this.var_632 = param1.readBoolean();
         this.var_1703 = param1.readBoolean();
         this.var_564 = param1.readString();
         this.var_1331 = param1.readInteger();
         this.var_1702 = param1.readString();
         this.var_1514 = param1.readString();
         this.var_1512 = param1.readString();
      }
      
      public function get gender() : int
      {
         return this.var_840;
      }
      
      public function get realName() : String
      {
         return this.var_1512;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get motto() : String
      {
         return this.var_1702;
      }
      
      public function get categoryId() : int
      {
         return this.var_1331;
      }
      
      public function get online() : Boolean
      {
         return this.var_632;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1703;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1514;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
   }
}
