package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_151:int = 1;
      
      public static const const_1357:int = 3;
      
      public static const const_311:int = 2;
       
      
      private var var_2423:int;
      
      private var var_2402:int;
      
      private var var_2420:int;
      
      private var var_2308:int;
      
      private var _state:int;
      
      private var var_323:int;
      
      private var var_1795:int;
      
      private var var_2366:int;
      
      private var var_1194:int;
      
      private var var_2357:String;
      
      private var var_1985:int;
      
      private var var_2422:int;
      
      private var var_2426:String;
      
      private var var_2424:String;
      
      private var var_2427:int = 0;
      
      private var var_1466:String;
      
      private var _message:String;
      
      private var var_2052:int;
      
      private var var_2421:String;
      
      private var var_1331:int;
      
      private var var_893:String;
      
      private var var_2425:String;
      
      private var var_1729:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         this.var_1194 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2427 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2422;
      }
      
      public function set roomName(param1:String) : void
      {
         this.var_893 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         this.var_1985 = param1;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get roomResources() : String
      {
         return this.var_2357;
      }
      
      public function set roomResources(param1:String) : void
      {
         this.var_2357 = param1;
      }
      
      public function get roomName() : String
      {
         return this.var_893;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function set worldId(param1:int) : void
      {
         this.var_2308 = param1;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
      
      public function get unitPort() : int
      {
         return this.var_2402;
      }
      
      public function get priority() : int
      {
         return this.var_2423 + this.var_2427;
      }
      
      public function set issueId(param1:int) : void
      {
         this.var_2366 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2424;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - this.var_1729) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return this.var_1331;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         this.var_2422 = param1;
      }
      
      public function get roomType() : int
      {
         return this.var_1795;
      }
      
      public function set flatType(param1:String) : void
      {
         this.var_2426 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_1985;
      }
      
      public function set message(param1:String) : void
      {
         this._message = param1;
      }
      
      public function get worldId() : int
      {
         return this.var_2308;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         this.var_2425 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         this.var_1466 = param1;
      }
      
      public function get issueId() : int
      {
         return this.var_2366;
      }
      
      public function set priority(param1:int) : void
      {
         this.var_2423 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         this.var_2402 = param1;
      }
      
      public function get flatType() : String
      {
         return this.var_2426;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         this.var_2420 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         this.var_2424 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         this.var_2052 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1466;
      }
      
      public function set roomType(param1:int) : void
      {
         this.var_1795 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return this.var_2420;
      }
      
      public function set flatId(param1:int) : void
      {
         this.var_323 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1331 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         this.var_1729 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2052;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         this.var_2421 = param1;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1729;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1194;
      }
      
      public function get flatId() : int
      {
         return this.var_323;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2425;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2421;
      }
   }
}
