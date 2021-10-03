package com.sulake.habbo.catalog.purse
{
   public interface IPurse
   {
       
      
      function get credits() : int;
      
      function get pastVipDays() : int;
      
      function get clubDays() : int;
      
      function get isVIP() : Boolean;
      
      function set credits(param1:int) : void;
      
      function get hasClubLeft() : Boolean;
      
      function set clubPeriods(param1:int) : void;
      
      function set clubDays(param1:int) : void;
      
      function getActivityPointsForType(param1:int) : int;
      
      function get clubPeriods() : int;
      
      function get pastClubDays() : int;
   }
}
