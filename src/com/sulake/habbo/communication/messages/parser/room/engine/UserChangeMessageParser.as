package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserChangeMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_1963:int;
      
      private var var_564:String;
      
      private var _roomCategory:int = 0;
      
      private var var_1749:String;
      
      private var var_874:String;
      
      private var _roomId:int = 0;
      
      public function UserChangeMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this._id = 0;
         this.var_564 = "";
         this.var_874 = "";
         this.var_1749 = "";
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_1963;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
      
      public function get sex() : String
      {
         return this.var_874;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = param1.readInteger();
         this.var_564 = param1.readString();
         this.var_874 = param1.readString();
         this.var_1749 = param1.readString();
         this.var_1963 = param1.readInteger();
         if(this.var_874)
         {
            this.var_874 = this.var_874.toUpperCase();
         }
         return true;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get customInfo() : String
      {
         return this.var_1749;
      }
   }
}
