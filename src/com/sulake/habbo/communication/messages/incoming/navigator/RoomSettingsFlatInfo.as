package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomSettingsFlatInfo
   {
      
      public static const const_478:int = 0;
      
      public static const const_113:int = 2;
      
      public static const const_167:int = 1;
      
      public static const const_708:Array = ["open","closed","password"];
       
      
      private var _id:int;
      
      private var var_2223:Boolean;
      
      private var _password:String;
      
      private var var_1965:int;
      
      private var _type:String;
      
      private var _ownerName:String;
      
      private var var_2224:Boolean;
      
      private var var_2222:Boolean;
      
      private var _name:String;
      
      private var var_1964:Boolean;
      
      private var var_1504:String;
      
      public function RoomSettingsFlatInfo()
      {
         super();
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         this.var_2223 = param1;
      }
      
      public function get categoryAlertKey() : Boolean
      {
         return this.var_2222;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         this.var_2224 = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_1964;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get showOwnerName() : Boolean
      {
         return this.var_2224;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return this.var_2223;
      }
      
      public function set categoryAlertKey(param1:Boolean) : void
      {
         this.var_2222 = param1;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_1965 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         this.var_1964 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_1965;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1504 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1504;
      }
   }
}
