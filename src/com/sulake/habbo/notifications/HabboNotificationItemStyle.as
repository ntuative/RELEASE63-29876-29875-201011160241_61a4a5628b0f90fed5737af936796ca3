package com.sulake.habbo.notifications
{
   import com.sulake.core.utils.Map;
   import flash.display.BitmapData;
   
   public class HabboNotificationItemStyle
   {
       
      
      private var var_2040:String;
      
      private var _icon:BitmapData;
      
      private var var_1465:Array;
      
      public function HabboNotificationItemStyle(param1:Map)
      {
         super();
         if(param1 == null)
         {
            this.var_1465 = [];
            this._icon = null;
         }
         else
         {
            this.var_1465 = param1["uilinks"];
            this._icon = param1["icon"];
         }
      }
      
      public function get iconSrc() : String
      {
         return this.var_2040;
      }
      
      public function set icon(param1:BitmapData) : void
      {
         this._icon = param1;
      }
      
      public function get icon() : BitmapData
      {
         return this._icon;
      }
      
      public function get componentLinks() : Array
      {
         return this.var_1465;
      }
      
      public function set iconSrc(param1:String) : void
      {
         this.var_2040 = param1;
      }
   }
}
