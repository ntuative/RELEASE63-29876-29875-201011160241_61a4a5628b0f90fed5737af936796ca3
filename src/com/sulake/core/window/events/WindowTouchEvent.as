package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowTouchEvent extends WindowEvent
   {
      
      public static const const_1542:String = "WTE_ROLL_OUT";
      
      public static const const_1710:String = "WTE_MOVE";
      
      public static const const_1026:String = "WTE_END";
      
      public static const const_1544:String = "WTE_OVER";
      
      public static const const_1567:String = "WTE_ROLL_OVER";
      
      public static const const_616:String = "WTE_BEGIN";
      
      public static const const_407:String = "WTE_TAP";
      
      public static const const_1629:String = "WTE_OUT";
       
      
      public var stageX:Number;
      
      public var stageY:Number;
      
      public var shiftKey:Boolean;
      
      public var var_2557:Number;
      
      public var localX:Number;
      
      public var localY:Number;
      
      public var altKey:Boolean;
      
      public var sizeX:Number;
      
      public var sizeY:Number;
      
      public var ctrlKey:Boolean;
      
      public function WindowTouchEvent(param1:String, param2:IWindow, param3:IWindow, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Boolean, param13:Boolean, param14:Boolean = false, param15:Boolean = false)
      {
         _type = param1;
         this.sizeX = param6;
         this.sizeY = param7;
         this.localX = param4;
         this.localY = param5;
         this.stageX = param8;
         this.stageY = param9;
         this.var_2557 = param10;
         this.altKey = param11;
         this.ctrlKey = param12;
         this.shiftKey = param13;
         super(param1,param2,param3,param14,false);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowTouchEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowTouchEvent(_type,window,related,this.localX,this.localY,this.sizeX,this.sizeY,this.stageX,this.stageY,this.var_2557,this.altKey,this.ctrlKey,this.shiftKey,bubbles,cancelable);
      }
   }
}
