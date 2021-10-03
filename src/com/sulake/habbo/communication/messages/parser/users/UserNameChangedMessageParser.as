package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserNameChangedMessageParser implements IMessageParser
   {
       
      
      private var var_1420:String;
      
      private var var_1421:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      public function UserNameChangedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1421 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1420 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1421 = -1;
         this._id = -1;
         this.var_1420 = "";
         return true;
      }
      
      public function get newName() : String
      {
         return this.var_1420;
      }
      
      public function get method_7() : int
      {
         return this.var_1421;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}
