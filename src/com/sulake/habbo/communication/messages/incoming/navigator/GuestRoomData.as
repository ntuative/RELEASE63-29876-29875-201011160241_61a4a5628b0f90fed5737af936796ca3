package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1954:int;
      
      private var var_1967:String;
      
      private var var_1968:int;
      
      private var var_414:int;
      
      private var var_605:Boolean;
      
      private var var_1969:Boolean;
      
      private var var_323:int;
      
      private var var_1504:String;
      
      private var var_1965:int;
      
      private var var_1331:int;
      
      private var _ownerName:String;
      
      private var var_893:String;
      
      private var var_1966:int;
      
      private var var_1970:RoomThumbnailData;
      
      private var var_1964:Boolean;
      
      private var var_735:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_735 = new Array();
         super();
         this.var_323 = param1.readInteger();
         this.var_605 = param1.readBoolean();
         this.var_893 = param1.readString();
         this._ownerName = param1.readString();
         this.var_1965 = param1.readInteger();
         this.var_1954 = param1.readInteger();
         this.var_1966 = param1.readInteger();
         this.var_1504 = param1.readString();
         this.var_1968 = param1.readInteger();
         this.var_1964 = param1.readBoolean();
         this.var_414 = param1.readInteger();
         this.var_1331 = param1.readInteger();
         this.var_1967 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_735.push(_loc4_);
            _loc3_++;
         }
         this.var_1970 = new RoomThumbnailData(param1);
         this.var_1969 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return this.var_1966;
      }
      
      public function get roomName() : String
      {
         return this.var_893;
      }
      
      public function get userCount() : int
      {
         return this.var_1954;
      }
      
      public function get score() : int
      {
         return this.var_414;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_1967;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_1964;
      }
      
      public function get tags() : Array
      {
         return this.var_735;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_1969;
      }
      
      public function get event() : Boolean
      {
         return this.var_605;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_735 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get categoryId() : int
      {
         return this.var_1331;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_1968;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_1970;
      }
      
      public function get doorMode() : int
      {
         return this.var_1965;
      }
      
      public function get flatId() : int
      {
         return this.var_323;
      }
      
      public function get description() : String
      {
         return this.var_1504;
      }
   }
}
