package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_434:int = 0;
       
      
      private var var_1567:int = 0;
      
      private var var_1930:Boolean = false;
      
      private var var_2131:int = 0;
      
      private var var_1931:int = 0;
      
      private var var_1237:Dictionary;
      
      private var var_1566:int = 0;
      
      private var var_1929:int = 0;
      
      public function Purse()
      {
         this.var_1237 = new Dictionary();
         super();
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1237[param1];
      }
      
      public function get pastVipDays() : int
      {
         return this.var_1931;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_1929 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1237;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_1930;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1567 > 0 || this.var_1566 > 0;
      }
      
      public function get credits() : int
      {
         return this.var_2131;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_1931 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_1929;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1237 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_1930 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1567;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1567 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2131 = param1;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1566 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1566;
      }
   }
}
