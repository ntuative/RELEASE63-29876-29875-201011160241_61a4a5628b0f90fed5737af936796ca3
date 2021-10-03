package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_1963:int;
      
      private var var_564:String = "";
      
      private var var_2471:String = "";
      
      private var var_2467:int = 0;
      
      private var var_2023:int = 0;
      
      private var _type:int = 0;
      
      private var var_2468:String = "";
      
      private var var_874:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_2026:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_1963;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2467 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2468 = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_1963 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_564 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_874 = param1;
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
         this.var_2026 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
      
      public function get sex() : String
      {
         return this.var_874;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2471 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2471;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2026;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2023 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2023;
      }
   }
}
