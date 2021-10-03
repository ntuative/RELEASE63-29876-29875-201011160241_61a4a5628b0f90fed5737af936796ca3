package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2041:Boolean = false;
      
      private var var_2043:Boolean = false;
      
      private var var_1517:String = "";
      
      private var _type:String = "";
      
      private var var_2042:Boolean = false;
      
      private var var_1944:String = "";
      
      private var var_2437:Number = 0;
      
      private var var_2435:Number = 0;
      
      private var var_2434:String = "";
      
      private var var_2436:Number = 0;
      
      private var var_2044:Boolean = false;
      
      private var var_2438:Number = 0;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1517 = param2;
         this.var_2434 = param3;
         this.var_1944 = param4;
         this.var_2437 = param5;
         this.var_2435 = param6;
         this.var_2438 = param7;
         this.var_2436 = param8;
         this.var_2044 = param9;
         this.var_2043 = param10;
         this.var_2042 = param11;
         this.var_2041 = param12;
      }
      
      public function get spriteTag() : String
      {
         return this.var_1944;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2044;
      }
      
      public function get screenX() : Number
      {
         return this.var_2437;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2041;
      }
      
      public function get localX() : Number
      {
         return this.var_2438;
      }
      
      public function get localY() : Number
      {
         return this.var_2436;
      }
      
      public function get canvasId() : String
      {
         return this.var_2434;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2043;
      }
      
      public function get eventId() : String
      {
         return this.var_1517;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get screenY() : Number
      {
         return this.var_2435;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2042;
      }
   }
}
