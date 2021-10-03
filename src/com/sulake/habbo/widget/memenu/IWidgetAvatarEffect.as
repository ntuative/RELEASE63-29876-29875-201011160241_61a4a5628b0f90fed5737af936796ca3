package com.sulake.habbo.widget.memenu
{
   import flash.display.BitmapData;
   
   public interface IWidgetAvatarEffect
   {
       
      
      function get method_1() : Boolean;
      
      function get duration() : int;
      
      function get effectsInInventory() : int;
      
      function get secondsLeft() : int;
      
      function get isInUse() : Boolean;
      
      function get icon() : BitmapData;
      
      function get type() : int;
   }
}
