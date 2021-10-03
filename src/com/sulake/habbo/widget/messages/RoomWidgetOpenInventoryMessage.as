package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_925:String = "inventory_badges";
      
      public static const const_1399:String = "inventory_clothes";
      
      public static const const_1323:String = "inventory_furniture";
      
      public static const const_734:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1091:String = "inventory_effects";
       
      
      private var var_2368:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_734);
         this.var_2368 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2368;
      }
   }
}
