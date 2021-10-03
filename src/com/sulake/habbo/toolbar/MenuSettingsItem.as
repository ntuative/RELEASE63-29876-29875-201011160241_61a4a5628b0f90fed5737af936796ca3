package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2169:Array;
      
      private var var_2170:String;
      
      private var var_2168:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2170 = param1;
         this.var_2169 = param2;
         this.var_2168 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2170;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2169;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2168;
      }
   }
}
