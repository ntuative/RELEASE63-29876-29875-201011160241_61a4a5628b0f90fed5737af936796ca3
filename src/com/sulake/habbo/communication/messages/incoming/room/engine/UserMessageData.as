package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1373:String = "F";
      
      public static const const_871:String = "M";
       
      
      private var _x:Number = 0;
      
      private var var_1963:int;
      
      private var var_564:String = "";
      
      private var var_2470:int = 0;
      
      private var var_2471:String = "";
      
      private var var_2467:int = 0;
      
      private var var_2023:int = 0;
      
      private var var_2468:String = "";
      
      private var var_874:String = "";
      
      private var _id:int = 0;
      
      private var var_164:Boolean = false;
      
      private var var_218:int = 0;
      
      private var var_2469:String = "";
      
      private var _name:String = "";
      
      private var var_2026:int = 0;
      
      private var var_163:Number = 0;
      
      private var var_162:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get z() : Number
      {
         return this.var_162;
      }
      
      public function get dir() : int
      {
         return this.var_218;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_164)
         {
            this._name = param1;
         }
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
      
      public function get achievementScore() : int
      {
         return this.var_1963;
      }
      
      public function get userType() : int
      {
         return this.var_2470;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2467 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2469;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_2468 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_2469 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2023 = param1;
         }
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_1963 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_564 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2470 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_874 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2467;
      }
      
      public function get groupID() : String
      {
         return this.var_2468;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_164)
         {
            this.var_2026 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_2471 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         this.var_164 = true;
      }
      
      public function get sex() : String
      {
         return this.var_874;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
      
      public function get webID() : int
      {
         return this.var_2026;
      }
      
      public function get custom() : String
      {
         return this.var_2471;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_163 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_164)
         {
            this.var_162 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_164)
         {
            this._x = param1;
         }
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_163;
      }
      
      public function get xp() : int
      {
         return this.var_2023;
      }
   }
}
