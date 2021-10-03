package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2450:Boolean = false;
      
      private var var_2451:int = 0;
      
      private var var_1567:int = 0;
      
      private var var_1930:Boolean = false;
      
      private var var_1566:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_1930;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_1930 = param1;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2451;
      }
      
      public function get clubDays() : int
      {
         return this.var_1567;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2450;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2450 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1567 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2451 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1566;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1566 = Math.max(0,param1);
      }
   }
}
