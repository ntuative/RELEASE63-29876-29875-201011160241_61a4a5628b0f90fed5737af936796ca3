package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_480:int = 0;
      
      private var _data:String = "";
      
      private var var_1424:int = -1;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var var_593:int = 0;
      
      private var var_2640:String = "";
      
      private var var_2259:int = 0;
      
      private var _id:int = 0;
      
      private var var_164:Boolean = false;
      
      private var var_218:int = 0;
      
      private var var_2258:String = null;
      
      private var _x:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_162:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get y() : Number
      {
         return this.var_163;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_164)
         {
            this._type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_163 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_218;
      }
      
      public function get extra() : int
      {
         return this.var_1424;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_218 = param1;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_164)
         {
            this._x = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_1424 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_162;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_164)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2259;
      }
      
      public function get staticClass() : String
      {
         return this.var_2258;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2259 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_164)
         {
            this._data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_2258 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         this.var_164 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_480 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_593 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_162 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_480;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get sizeY() : int
      {
         return this.var_593;
      }
   }
}
