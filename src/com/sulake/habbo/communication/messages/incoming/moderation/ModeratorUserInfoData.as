package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2533:int;
      
      private var var_2537:int;
      
      private var var_2535:int;
      
      private var _userName:String;
      
      private var var_2534:int;
      
      private var var_2536:int;
      
      private var var_2538:int;
      
      private var _userId:int;
      
      private var var_632:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2536 = param1.readInteger();
         this.var_2534 = param1.readInteger();
         this.var_632 = param1.readBoolean();
         this.var_2535 = param1.readInteger();
         this.var_2537 = param1.readInteger();
         this.var_2533 = param1.readInteger();
         this.var_2538 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return this.var_2538;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get online() : Boolean
      {
         return this.var_632;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2534;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2537;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2533;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2535;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2536;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}
