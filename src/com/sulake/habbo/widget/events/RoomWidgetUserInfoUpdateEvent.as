package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_209:String = "RWUIUE_PEER";
      
      public static const const_226:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1368:String = "BOT";
      
      public static const const_961:int = 2;
      
      public static const const_1408:int = 0;
      
      public static const const_983:int = 3;
       
      
      private var var_1963:int;
      
      private var var_564:String = "";
      
      private var var_1702:String = "";
      
      private var var_2025:Boolean = false;
      
      private var var_2023:int = 0;
      
      private var var_2022:Boolean = false;
      
      private var var_2019:int = 0;
      
      private var var_1512:String = "";
      
      private var var_2029:Boolean = false;
      
      private var _respectLeft:int = 0;
      
      private var var_2020:Boolean = true;
      
      private var var_1211:int = 0;
      
      private var var_2028:Boolean = false;
      
      private var var_1667:Boolean = false;
      
      private var var_2032:Boolean = false;
      
      private var var_2031:int = 0;
      
      private var var_2024:Boolean = false;
      
      private var var_37:BitmapData = null;
      
      private var var_221:Array;
      
      private var var_1666:Boolean = false;
      
      private var _name:String = "";
      
      private var var_2026:int = 0;
      
      private var var_2021:Boolean = false;
      
      private var var_2030:int = 0;
      
      private var var_2027:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_221 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return this.var_2019;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2020;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2020 = param1;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2019 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2029 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1702;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2028 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1667;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2021;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2027;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1702 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2025;
      }
      
      public function get achievementScore() : int
      {
         return this.var_1963;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2024;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1667 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_221;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2022;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2022 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2021 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_37 = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2030 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2027 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1512 = param1;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_1963 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_564 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2029;
      }
      
      public function get carryItem() : int
      {
         return this.var_2031;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2031 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2028;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_37;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2030;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1666;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2026 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_221 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2032 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1512;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2024 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get webID() : int
      {
         return this.var_2026;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1211 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2023;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2025 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1211;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2032;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1666 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2023 = param1;
      }
   }
}
