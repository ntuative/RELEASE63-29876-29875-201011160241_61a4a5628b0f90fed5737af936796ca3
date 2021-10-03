package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_274:String = "WE_CHILD_RESIZED";
      
      public static const const_1248:String = "WE_CLOSE";
      
      public static const const_1251:String = "WE_DESTROY";
      
      public static const const_110:String = "WE_CHANGE";
      
      public static const const_1422:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1626:String = "WE_PARENT_RESIZE";
      
      public static const const_97:String = "WE_UPDATE";
      
      public static const const_1452:String = "WE_MAXIMIZE";
      
      public static const const_528:String = "WE_SCROLL";
      
      public static const const_272:String = "WE_DESTROYED";
      
      public static const const_651:String = "WE_UNSELECT";
      
      public static const const_1459:String = "WE_MAXIMIZED";
      
      public static const const_1403:String = "WE_UNLOCKED";
      
      public static const const_471:String = "WE_CHILD_REMOVED";
      
      public static const const_162:String = "WE_OK";
      
      public static const const_44:String = "WE_RESIZED";
      
      public static const const_1310:String = "WE_ACTIVATE";
      
      public static const const_261:String = "WE_ENABLED";
      
      public static const const_445:String = "WE_CHILD_RELOCATED";
      
      public static const const_1236:String = "WE_CREATE";
      
      public static const const_421:String = "WE_SELECT";
      
      public static const const_141:String = "";
      
      public static const const_1333:String = "WE_LOCKED";
      
      public static const const_1598:String = "WE_PARENT_RELOCATE";
      
      public static const const_1711:String = "WE_CHILD_REMOVE";
      
      public static const const_1610:String = "WE_CHILD_RELOCATE";
      
      public static const const_1446:String = "WE_LOCK";
      
      public static const const_270:String = "WE_FOCUSED";
      
      public static const const_707:String = "WE_UNSELECTED";
      
      public static const const_1093:String = "WE_DEACTIVATED";
      
      public static const const_1232:String = "WE_MINIMIZED";
      
      public static const const_1671:String = "WE_ARRANGED";
      
      public static const const_1229:String = "WE_UNLOCK";
      
      public static const const_1599:String = "WE_ATTACH";
      
      public static const const_1332:String = "WE_OPEN";
      
      public static const const_1284:String = "WE_RESTORE";
      
      public static const const_1595:String = "WE_PARENT_RELOCATED";
      
      public static const const_1430:String = "WE_RELOCATE";
      
      public static const const_1698:String = "WE_CHILD_RESIZE";
      
      public static const const_1666:String = "WE_ARRANGE";
      
      public static const const_1402:String = "WE_OPENED";
      
      public static const const_1419:String = "WE_CLOSED";
      
      public static const const_1679:String = "WE_DETACHED";
      
      public static const const_1743:String = "WE_UPDATED";
      
      public static const const_1410:String = "WE_UNFOCUSED";
      
      public static const const_321:String = "WE_RELOCATED";
      
      public static const const_1295:String = "WE_DEACTIVATE";
      
      public static const const_233:String = "WE_DISABLED";
      
      public static const const_780:String = "WE_CANCEL";
      
      public static const const_746:String = "WE_ENABLE";
      
      public static const const_1225:String = "WE_ACTIVATED";
      
      public static const const_1280:String = "WE_FOCUS";
      
      public static const const_1628:String = "WE_DETACH";
      
      public static const const_1420:String = "WE_RESTORED";
      
      public static const const_1434:String = "WE_UNFOCUS";
      
      public static const const_59:String = "WE_SELECTED";
      
      public static const const_1264:String = "WE_PARENT_RESIZED";
      
      public static const const_1463:String = "WE_CREATED";
      
      public static const const_1678:String = "WE_ATTACHED";
      
      public static const const_1388:String = "WE_MINIMIZE";
      
      public static const const_751:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1846:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1845:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1846 = param3;
         this.var_1845 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1845;
      }
      
      public function get related() : IWindow
      {
         return this.var_1846;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1845 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
