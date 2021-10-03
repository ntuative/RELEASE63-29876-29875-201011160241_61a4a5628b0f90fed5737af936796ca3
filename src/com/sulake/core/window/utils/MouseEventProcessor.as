package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContextStateListener;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MouseEventProcessor implements IEventProcessor, IDisposable
   {
       
      
      protected var var_144:IWindowRenderer;
      
      protected var _lastClickTarget:WindowController;
      
      protected var var_75:WindowController;
      
      private var _disposed:Boolean = false;
      
      protected var var_125:IDesktopWindow;
      
      protected var var_733:IWindowContextStateListener;
      
      protected var var_600:Point;
      
      public function MouseEventProcessor()
      {
         super();
         this.var_600 = new Point();
      }
      
      protected static function convertMouseEventType(param1:MouseEvent, param2:IWindow, param3:IWindow) : WindowMouseEvent
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         _loc5_ = new Point(param1.stageX,param1.stageY);
         param2.convertPointFromGlobalToLocalSpace(_loc5_);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_MOVE:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_OVER:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_OUT:
               _loc4_ = "null";
               break;
            case MouseEvent.ROLL_OUT:
               _loc4_ = "null";
               break;
            case MouseEvent.ROLL_OVER:
               _loc4_ = "null";
               break;
            case MouseEvent.CLICK:
               _loc4_ = "null";
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc4_ = "null";
               break;
            case MouseEvent.MOUSE_UP:
               _loc6_ = _loc5_.x > -1 && _loc5_.y > -1 && _loc5_.x < param2.width && _loc5_.y < param2.height;
               _loc4_ = !!_loc6_ ? "null" : WindowMouseEvent.const_171;
               break;
            case MouseEvent.MOUSE_WHEEL:
               _loc4_ = "null";
               break;
            default:
               _loc4_ = "null";
         }
         return new WindowMouseEvent(_loc4_,param2,param3,_loc5_.x,_loc5_.y,param1.stageX,param1.stageY,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown,param1.delta,false,true);
      }
      
      private function passMouseEvent(param1:WindowController, param2:MouseEvent, param3:Boolean = false) : WindowController
      {
         if(param1.disposed)
         {
            return null;
         }
         if(param1.testStateFlag(WindowState.const_70))
         {
            return null;
         }
         var _loc4_:Point = new Point(param2.stageX,param2.stageY);
         param1.convertPointFromGlobalToLocalSpace(_loc4_);
         if(param2.type == MouseEvent.MOUSE_UP)
         {
            if(param1 != this._lastClickTarget)
            {
               if(this._lastClickTarget && !this._lastClickTarget.disposed)
               {
                  this._lastClickTarget.update(this._lastClickTarget,convertMouseEventType(new MouseEvent(MouseEvent.MOUSE_UP,false,true,param2.localX,param2.localY,null,param2.ctrlKey,param2.altKey,param2.shiftKey,param2.buttonDown,param2.delta),this._lastClickTarget,param1));
                  this._lastClickTarget = null;
               }
            }
         }
         var _loc5_:BitmapData = this.var_144.getDrawBufferForRenderable(param1);
         if(!param1.validateLocalPointIntersection(_loc4_,_loc5_))
         {
            return null;
         }
         if(param1.testParamFlag(WindowParam.const_389))
         {
            if(param1.parent != null)
            {
               return this.passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         if(!param3)
         {
            switch(param2.type)
            {
               case MouseEvent.MOUSE_DOWN:
                  this._lastClickTarget = param1;
                  break;
               case MouseEvent.CLICK:
                  if(this._lastClickTarget != param1)
                  {
                     return null;
                  }
                  this._lastClickTarget = null;
                  break;
               case MouseEvent.DOUBLE_CLICK:
                  if(this._lastClickTarget != param1)
                  {
                     return null;
                  }
                  this._lastClickTarget = null;
                  break;
            }
         }
         if(!param1.update(param1,convertMouseEventType(param2,param1,null)) && !param3)
         {
            if(param1.parent)
            {
               return this.passMouseEvent(WindowController(param1.parent),param2);
            }
         }
         return param1;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         this.var_125 = param1.desktop;
         this.var_75 = param1.var_1128 as WindowController;
         this._lastClickTarget = param1.var_1130 as WindowController;
         this.var_144 = param1.renderer;
         this.var_733 = param1.var_1129;
         param2.begin();
         var _loc7_:Point = new Point();
         this.var_600.x = -1;
         this.var_600.y = -1;
         while(true)
         {
            _loc3_ = param2.next() as MouseEvent;
            if(_loc3_ == null)
            {
               break;
            }
            if(_loc3_.stageX != this.var_600.x || _loc3_.stageY != this.var_600.y)
            {
               this.var_600.x = _loc3_.stageX;
               this.var_600.y = _loc3_.stageY;
               _loc6_ = new Array();
               this.var_125.groupParameterFilteredChildrenUnderPoint(this.var_600,_loc6_,WindowParam.const_43);
            }
            _loc4_ = _loc6_ != null ? int(_loc6_.length) : 0;
            if(_loc4_ == 0)
            {
               if(_loc3_.type == MouseEvent.MOUSE_MOVE)
               {
                  if(this.var_75 != this.var_125 && !this.var_75.disposed)
                  {
                     this.var_75.getGlobalPosition(_loc7_);
                     this.var_75.update(this.var_75,new WindowMouseEvent(WindowMouseEvent.const_25,this.var_75,null,_loc3_.stageX - _loc7_.x,_loc3_.stageY - _loc7_.y,_loc3_.stageX,_loc3_.stageY,_loc3_.altKey,_loc3_.ctrlKey,_loc3_.shiftKey,_loc3_.buttonDown,_loc3_.delta));
                     this.var_75 = WindowController(this.var_125);
                  }
               }
            }
            while(--_loc4_ > -1)
            {
               _loc5_ = this.passMouseEvent(WindowController(_loc6_[_loc4_]),_loc3_);
               if(_loc5_ != null && _loc5_.visible)
               {
                  if(_loc3_.type == MouseEvent.MOUSE_MOVE)
                  {
                     if(_loc5_ != this.var_75)
                     {
                        if(!this.var_75.disposed)
                        {
                           this.var_75.getGlobalPosition(_loc7_);
                           this.var_75.update(this.var_75,new WindowMouseEvent(WindowMouseEvent.const_25,this.var_75,_loc5_,_loc3_.stageX - _loc7_.x,_loc3_.stageY - _loc7_.y,_loc3_.stageX,_loc3_.stageY,_loc3_.altKey,_loc3_.ctrlKey,_loc3_.shiftKey,_loc3_.buttonDown,_loc3_.delta));
                        }
                        if(!_loc5_.disposed)
                        {
                           _loc5_.getGlobalPosition(_loc7_);
                           _loc5_.update(_loc5_,new WindowMouseEvent(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,_loc5_,null,_loc3_.stageX - _loc7_.x,_loc3_.stageY - _loc7_.y,_loc3_.stageX,_loc3_.stageY,_loc3_.altKey,_loc3_.ctrlKey,_loc3_.shiftKey,_loc3_.buttonDown,_loc3_.delta));
                        }
                        if(!_loc5_.disposed)
                        {
                           this.var_75 = _loc5_;
                        }
                     }
                  }
                  else if(_loc3_.type == MouseEvent.MOUSE_UP || _loc3_.type == MouseEvent.CLICK)
                  {
                     if(this.var_75 && !this.var_75.disposed)
                     {
                        if(this.var_733 != null)
                        {
                           this.var_733.mouseEventReceived(_loc3_.type,this.var_75);
                        }
                     }
                  }
                  _loc8_ = _loc5_.parent;
                  while(_loc8_ && !_loc8_.disposed)
                  {
                     if(_loc8_ is IInputProcessorRoot)
                     {
                        IInputProcessorRoot(_loc8_).process(convertMouseEventType(_loc3_,_loc8_,_loc5_));
                        break;
                     }
                     _loc8_ = _loc8_.parent;
                  }
                  if(_loc3_.altKey)
                  {
                     if(this.var_75)
                     {
                        Logger.log("HOVER: " + this.var_75.name);
                     }
                  }
                  if(_loc5_ != this.var_125)
                  {
                     _loc3_.stopPropagation();
                     param2.remove();
                  }
                  break;
               }
            }
         }
         param2.end();
         param1.desktop = this.var_125;
         param1.var_1128 = this.var_75;
         param1.var_1130 = this._lastClickTarget;
         param1.renderer = this.var_144;
         param1.var_1129 = this.var_733;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
         }
      }
   }
}
