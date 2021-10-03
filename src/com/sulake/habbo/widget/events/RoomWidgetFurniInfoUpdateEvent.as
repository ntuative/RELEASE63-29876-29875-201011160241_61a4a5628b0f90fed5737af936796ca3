package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_665:String = "RWFIUE_FURNI";
       
      
      private var var_1668:Boolean = false;
      
      private var var_2212:int = -1;
      
      private var var_2167:Boolean = false;
      
      private var var_2342:Boolean = false;
      
      private var _id:int = 0;
      
      private var var_1543:int = -1;
      
      private var var_1667:Boolean = false;
      
      private var var_1504:String = "";
      
      private var _offerId:int = -1;
      
      private var var_37:BitmapData = null;
      
      private var _category:int = 0;
      
      private var var_2343:Boolean = false;
      
      private var _name:String = "";
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2212;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2212 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2343 = param1;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1667;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_1668;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2342;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1667 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_1543;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2167 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_37 = param1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_1668 = param1;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2342 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2343;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2167;
      }
      
      public function get image() : BitmapData
      {
         return this.var_37;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_1543 = param1;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1504 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1504;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
