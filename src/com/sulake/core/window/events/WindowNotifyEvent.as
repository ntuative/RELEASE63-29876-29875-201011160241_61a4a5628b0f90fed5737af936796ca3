package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1279:String = "WN_CREATED";
      
      public static const const_1019:String = "WN_DISABLE";
      
      public static const const_886:String = "WN_DEACTIVATED";
      
      public static const const_974:String = "WN_OPENED";
      
      public static const const_911:String = "WN_CLOSED";
      
      public static const const_973:String = "WN_DESTROY";
      
      public static const const_1573:String = "WN_ARRANGED";
      
      public static const const_447:String = "WN_PARENT_RESIZED";
      
      public static const const_928:String = "WN_ENABLE";
      
      public static const const_1043:String = "WN_RELOCATE";
      
      public static const const_1015:String = "WN_FOCUS";
      
      public static const const_975:String = "WN_PARENT_RELOCATED";
      
      public static const const_397:String = "WN_PARAM_UPDATED";
      
      public static const const_557:String = "WN_PARENT_ACTIVATED";
      
      public static const const_165:String = "WN_RESIZED";
      
      public static const const_1037:String = "WN_CLOSE";
      
      public static const const_884:String = "WN_PARENT_REMOVED";
      
      public static const const_288:String = "WN_CHILD_RELOCATED";
      
      public static const const_579:String = "WN_ENABLED";
      
      public static const WINDOW_NOTIFY_CHILD_RESIZED:String = "WN_CHILD_RESIZED";
      
      public static const const_905:String = "WN_MINIMIZED";
      
      public static const const_776:String = "WN_DISABLED";
      
      public static const const_223:String = "WN_CHILD_ACTIVATED";
      
      public static const const_433:String = "WN_STATE_UPDATED";
      
      public static const const_726:String = "WN_UNSELECTED";
      
      public static const const_459:String = "WN_STYLE_UPDATED";
      
      public static const const_1658:String = "WN_UPDATE";
      
      public static const const_495:String = "WN_PARENT_ADDED";
      
      public static const const_645:String = "WN_RESIZE";
      
      public static const const_694:String = "WN_CHILD_REMOVED";
      
      public static const const_1565:String = "";
      
      public static const const_1083:String = "WN_RESTORED";
      
      public static const const_315:String = "WN_SELECTED";
      
      public static const const_922:String = "WN_MINIMIZE";
      
      public static const const_1066:String = "WN_FOCUSED";
      
      public static const const_926:String = "WN_LOCK";
      
      public static const const_312:String = "WN_CHILD_ADDED";
      
      public static const const_1033:String = "WN_UNFOCUSED";
      
      public static const const_517:String = "WN_RELOCATED";
      
      public static const const_921:String = "WN_DEACTIVATE";
      
      public static const const_1267:String = "WN_CRETAE";
      
      public static const const_1009:String = "WN_RESTORE";
      
      public static const const_345:String = "WN_ACTVATED";
      
      public static const const_956:String = "WN_LOCKED";
      
      public static const const_426:String = "WN_SELECT";
      
      public static const const_924:String = "WN_MAXIMIZE";
      
      public static const const_1027:String = "WN_OPEN";
      
      public static const const_773:String = "WN_UNSELECT";
      
      public static const const_1651:String = "WN_ARRANGE";
      
      public static const const_971:String = "WN_UNLOCKED";
      
      public static const const_1734:String = "WN_UPDATED";
      
      public static const const_1002:String = "WN_ACTIVATE";
      
      public static const const_1084:String = "WN_UNLOCK";
      
      public static const const_953:String = "WN_MAXIMIZED";
      
      public static const const_880:String = "WN_DESTROYED";
      
      public static const const_979:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1846,cancelable);
      }
   }
}
