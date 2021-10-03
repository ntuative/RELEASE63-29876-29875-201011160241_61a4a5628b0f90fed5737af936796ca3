package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var var_163:Number = 0;
      
      private var var_162:Number = 0;
      
      private var var_218:int = 0;
      
      private var var_2083:int = 0;
      
      private var var_2302:Number = 0;
      
      private var var_2304:Number = 0;
      
      private var var_2305:Number = 0;
      
      private var var_2306:Number = 0;
      
      private var var_2303:Boolean = false;
      
      private var _x:Number = 0;
      
      private var _id:int = 0;
      
      private var var_276:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_276 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_163 = param3;
         this.var_162 = param4;
         this.var_2306 = param5;
         this.var_218 = param6;
         this.var_2083 = param7;
         this.var_2302 = param8;
         this.var_2304 = param9;
         this.var_2305 = param10;
         this.var_2303 = param11;
         this.var_276 = param12;
      }
      
      public function get y() : Number
      {
         return this.var_163;
      }
      
      public function get z() : Number
      {
         return this.var_162;
      }
      
      public function get dir() : int
      {
         return this.var_218;
      }
      
      public function get localZ() : Number
      {
         return this.var_2306;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2303;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get dirHead() : int
      {
         return this.var_2083;
      }
      
      public function get targetX() : Number
      {
         return this.var_2302;
      }
      
      public function get targetY() : Number
      {
         return this.var_2304;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2305;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get actions() : Array
      {
         return this.var_276.slice();
      }
   }
}
