package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_162:Number = 0;
      
      private var _data:String = "";
      
      private var var_1424:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var var_163:Number = 0;
      
      private var var_2529:Boolean = false;
      
      private var var_2640:String = "";
      
      private var _id:int = 0;
      
      private var var_164:Boolean = false;
      
      private var var_218:String = "";
      
      private var var_2531:int = 0;
      
      private var var_2530:int = 0;
      
      private var var_2438:int = 0;
      
      private var var_2436:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2529 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_163 = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2529;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_164)
         {
            this._type = param1;
         }
      }
      
      public function get dir() : String
      {
         return this.var_218;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_2438 = param1;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_2531 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_2530 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_218 = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_2436 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_164)
         {
            this._state = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get localX() : Number
      {
         return this.var_2438;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_164)
         {
            this._data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return this.var_2531;
      }
      
      public function get wallY() : Number
      {
         return this.var_2530;
      }
      
      public function get localY() : Number
      {
         return this.var_2436;
      }
      
      public function setReadOnly() : void
      {
         this.var_164 = true;
      }
      
      public function get y() : Number
      {
         return this.var_163;
      }
      
      public function get z() : Number
      {
         return this.var_162;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_162 = param1;
         }
      }
   }
}
