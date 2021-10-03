package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_564:String;
      
      private var var_2264:String;
      
      private var var_2267:int;
      
      private var var_2265:int;
      
      private var var_874:String;
      
      private var var_1512:String;
      
      private var _name:String;
      
      private var var_718:int;
      
      private var _respectLeft:int;
      
      private var var_2268:int;
      
      private var var_1914:int;
      
      private var var_2266:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2265;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1512;
      }
      
      public function get customData() : String
      {
         return this.var_2264;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_718;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2267;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2266;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1914;
      }
      
      public function get sex() : String
      {
         return this.var_874;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_564 = param1.readString();
         this.var_874 = param1.readString();
         this.var_2264 = param1.readString();
         this.var_1512 = param1.readString();
         this.var_2268 = param1.readInteger();
         this.var_2266 = param1.readString();
         this.var_2267 = param1.readInteger();
         this.var_2265 = param1.readInteger();
         this.var_1914 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_718 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2268;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
   }
}
