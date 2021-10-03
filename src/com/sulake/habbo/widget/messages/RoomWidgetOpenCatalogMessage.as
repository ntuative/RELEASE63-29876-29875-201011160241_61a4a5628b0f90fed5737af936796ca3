package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_965:String = "RWOCM_CLUB_MAIN";
      
      public static const const_764:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1861:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_764);
         this.var_1861 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_1861;
      }
   }
}
