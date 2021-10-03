package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var var_337:Timer;
      
      protected var var_1152:String;
      
      protected var var_1390:uint;
      
      protected var var_1151:Point;
      
      protected var var_249:IToolTipWindow;
      
      protected var var_1150:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         this.var_1151 = new Point();
         this.var_1150 = new Point(20,20);
         this.var_1390 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(this.var_337 != null)
         {
            this.var_337.stop();
            this.var_337.removeEventListener(TimerEvent.TIMER,this.showToolTip);
            this.var_337 = null;
         }
         this.hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,this.var_1151);
            if(this.var_249 != null && !this.var_249.disposed)
            {
               this.var_249.x = param1 + this.var_1150.x;
               this.var_249.y = param2 + this.var_1150.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_337 != null)
         {
            this.var_337.reset();
         }
         if(_window && true)
         {
            if(this.var_249 == null || this.var_249.disposed)
            {
               this.var_249 = _window.context.create("undefined::ToolTip",this.var_1152,WindowType.const_354,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            this.var_249.x = _loc2_.x + this.var_1151.x + this.var_1150.x;
            this.var_249.y = _loc2_.y + this.var_1151.y + this.var_1150.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               this.var_1152 = IInteractiveWindow(param1).toolTipCaption;
               this.var_1390 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               this.var_1152 = param1.caption;
               this.var_1390 = 500;
            }
            _mouse.x = var_126.mouseX;
            _mouse.y = var_126.mouseY;
            getMousePositionRelativeTo(param1,_mouse,this.var_1151);
            if(this.var_1152 != null && this.var_1152 != "")
            {
               if(this.var_337 == null)
               {
                  this.var_337 = new Timer(this.var_1390,1);
                  this.var_337.addEventListener(TimerEvent.TIMER,this.showToolTip);
               }
               this.var_337.reset();
               this.var_337.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(this.var_249 != null && !this.var_249.disposed)
         {
            this.var_249.destroy();
            this.var_249 = null;
         }
      }
   }
}
