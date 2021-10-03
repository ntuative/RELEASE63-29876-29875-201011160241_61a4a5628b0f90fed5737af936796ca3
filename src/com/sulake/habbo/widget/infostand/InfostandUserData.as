package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   
   public class InfostandUserData
   {
       
      
      private var var_2027:String = "";
      
      private var var_2031:int = 0;
      
      private var _userName:String = "";
      
      private var var_221:Array;
      
      private var _type:String;
      
      private var _userId:int = 0;
      
      private var var_2019:int = 0;
      
      private var _respectLeft:int = 0;
      
      private var var_1211:int = 0;
      
      private var var_718:int = 0;
      
      public function InfostandUserData()
      {
         this.var_221 = [];
         super();
      }
      
      public function get groupId() : int
      {
         return this.var_1211;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2019 = param1;
      }
      
      public function isBot() : Boolean
      {
         return this.type == RoomWidgetUserInfoUpdateEvent.BOT;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2019;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set userId(param1:int) : void
      {
         this._userId = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2031;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_718;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2027;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_221 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2031 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         this.var_718 = param1;
      }
      
      public function set userName(param1:String) : void
      {
         this._userName = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_221.slice();
      }
      
      public function setData(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userId = param1.webID;
         this.userName = param1.name;
         this.badges = param1.badges;
         this.groupId = param1.groupId;
         this.groupBadgeId = param1.groupBadgeId;
         this.respectLeft = param1.respectLeft;
         this.carryItem = param1.carryItem;
         this.userRoomId = param1.userRoomId;
         this.type = param1.type;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1211 = param1;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2027 = param1;
      }
   }
}
