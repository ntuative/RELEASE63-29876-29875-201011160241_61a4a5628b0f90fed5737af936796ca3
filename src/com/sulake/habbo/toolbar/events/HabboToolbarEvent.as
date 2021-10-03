package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_61:String = "HTE_INITIALIZED";
      
      public static const const_39:String = "HTE_TOOLBAR_CLICK";
      
      public static const TOOLBAR_ORIENTATION:String = "HTE_TOOLBAR_ORIENTATION";
       
      
      private var var_1353:String;
      
      private var var_478:String;
      
      private var var_717:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_478 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1353;
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_717 = param1;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1353 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_478;
      }
      
      public function get iconId() : String
      {
         return this.var_717;
      }
   }
}
