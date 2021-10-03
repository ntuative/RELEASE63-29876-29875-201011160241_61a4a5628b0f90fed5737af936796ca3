package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_591;
         param1["bitmap"] = const_601;
         param1["border"] = const_790;
         param1["border_notify"] = const_1255;
         param1["button"] = const_484;
         param1["button_thick"] = const_628;
         param1["button_icon"] = const_1391;
         param1["button_group_left"] = const_712;
         param1["button_group_center"] = const_648;
         param1["button_group_right"] = const_550;
         param1["canvas"] = const_709;
         param1["checkbox"] = const_615;
         param1["closebutton"] = const_998;
         param1["container"] = const_362;
         param1["container_button"] = const_681;
         param1["display_object_wrapper"] = const_602;
         param1["dropmenu"] = const_487;
         param1["dropmenu_item"] = const_469;
         param1["frame"] = const_357;
         param1["frame_notify"] = const_1364;
         param1["header"] = const_660;
         param1["icon"] = const_1072;
         param1["itemgrid"] = const_954;
         param1["itemgrid_horizontal"] = const_473;
         param1["itemgrid_vertical"] = const_638;
         param1["itemlist"] = const_934;
         param1["itemlist_horizontal"] = const_314;
         param1["itemlist_vertical"] = const_342;
         param1["maximizebox"] = WINDOW_TYPE_MAXIMIZEBOX;
         param1["menu"] = const_1470;
         param1["menu_item"] = const_1340;
         param1["submenu"] = const_887;
         param1["minimizebox"] = const_1359;
         param1["notify"] = const_1303;
         param1["null"] = const_711;
         param1["password"] = const_566;
         param1["radiobutton"] = const_792;
         param1["region"] = const_688;
         param1["restorebox"] = const_1325;
         param1["scaler"] = const_667;
         param1["scaler_horizontal"] = const_1298;
         param1["scaler_vertical"] = const_1426;
         param1["scrollbar_horizontal"] = const_402;
         param1["scrollbar_vertical"] = const_606;
         param1["scrollbar_slider_button_up"] = const_1016;
         param1["scrollbar_slider_button_down"] = const_1038;
         param1["scrollbar_slider_button_left"] = const_1076;
         param1["scrollbar_slider_button_right"] = const_930;
         param1["scrollbar_slider_bar_horizontal"] = const_972;
         param1["scrollbar_slider_bar_vertical"] = const_1073;
         param1["scrollbar_slider_track_horizontal"] = const_1059;
         param1["scrollbar_slider_track_vertical"] = const_872;
         param1["scrollable_itemlist"] = const_1345;
         param1["scrollable_itemlist_vertical"] = const_457;
         param1["scrollable_itemlist_horizontal"] = const_1046;
         param1["selector"] = const_610;
         param1["selector_list"] = const_750;
         param1["submenu"] = const_887;
         param1["tab_button"] = const_600;
         param1["tab_container_button"] = const_986;
         param1["tab_context"] = const_366;
         param1["tab_content"] = const_1065;
         param1["tab_selector"] = const_548;
         param1["text"] = const_693;
         param1["input"] = const_758;
         param1["toolbar"] = const_1386;
         param1["tooltip"] = const_354;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
