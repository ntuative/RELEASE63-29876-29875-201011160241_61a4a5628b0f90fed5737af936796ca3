package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.MouseListenerType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowDisposeEvent;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.events.WindowTouchEvent;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.services.IMouseListenerService;
   import com.sulake.core.window.utils.DefaultAttStruct;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class WindowController extends WindowModel implements IWindow, IGraphicContextHost
   {
      
      protected static const const_1497:String = "_IGNORE_INHERITED_STYLE";
      
      protected static const TAG_INTERNAL:String = "_INTERNAL";
      
      private static var var_1119:uint = 0;
      
      protected static const TAG_EXCLUDE:String = "_EXCLUDE";
      
      private static var var_1368:Point = new Point();
      
      protected static const const_1105:String = "_COLORIZE";
       
      
      protected var var_147:Boolean = true;
      
      private var var_1367:Boolean = false;
      
      protected var _events:IEventDispatcher;
      
      private var var_329:Rectangle;
      
      protected var var_742:Function;
      
      protected var _children:Array;
      
      protected var _debug:Boolean = false;
      
      private var var_2527:uint;
      
      protected var var_13:WindowController;
      
      protected var var_20:IGraphicContext;
      
      public function WindowController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         var _loc14_:* = 0;
         this.var_2527 = var_1119++;
         var _loc12_:XML = param5.getWindowFactory().getLayoutByTypeAndStyle(param2,param3);
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,!!_loc12_ ? Number(int(_loc12_.attribute("width"))) : Number(10),!!_loc12_ ? Number(int(_loc12_.attribute("height"))) : Number(10));
         }
         super(param11,param1,param2,param3,param4,param5,param6,param10);
         if(!this.var_20)
         {
            this.var_20 = this.getGraphicContext(!testParamFlag(WindowParam.const_31));
         }
         this._events = new EventDispatcher(this);
         this._children = new Array();
         this.var_329 = new Rectangle();
         if(_loc12_ != null)
         {
            var_334 = new Rectangle(0,0,int(_loc12_.attribute("width")),int(_loc12_.attribute("height")));
            var_55 = var_334.clone();
            var_11 = var_334.clone();
            param5.getWindowParser().parseAndConstruct(_loc12_,this,null);
            _loc14_ = uint(_param);
            _param &= -1;
            this.setRectangle(param6.x,param6.y,param6.width,param6.height);
            _param = _loc14_;
            var_55.x = param6.x;
            var_55.y = param6.y;
            var_55.width = param6.width;
            var_55.height = param6.height;
         }
         var _loc13_:DefaultAttStruct = param5.getWindowFactory().getDefaultsByTypeAndStyle(param2,param3);
         if(_loc13_)
         {
            var_689 = _loc13_.blend;
            var_393 = _loc13_.treshold;
            if(var_488 != _loc13_.background)
            {
               this.background = _loc13_.background;
            }
            if(var_394 != _loc13_.color)
            {
               this.color = _loc13_.color;
            }
         }
         if(param9)
         {
            this.properties = param9;
         }
         this.var_742 = param8;
         if(param7 != null)
         {
            this.var_13 = param7 as WindowController;
            WindowController(param7).addChild(this);
            if(this.var_20)
            {
               var_17.invalidate(this,var_11,WindowRedrawFlag.const_76);
            }
         }
      }
      
      public static function expandToAccommodateChild(param1:WindowController, param2:IWindow) : void
      {
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.width;
         var _loc6_:int = param1.height;
         var _loc7_:Rectangle = param2.rectangle.clone();
         var _loc8_:Boolean = false;
         if(_loc7_.x < 0)
         {
            _loc3_ = _loc7_.x;
            _loc5_ -= _loc3_;
            _loc7_.x = 0;
            _loc8_ = true;
         }
         if(_loc7_.right > _loc5_)
         {
            _loc5_ = _loc7_.x + _loc7_.width;
            _loc8_ = true;
         }
         if(_loc7_.y < 0)
         {
            _loc4_ = _loc7_.y;
            _loc6_ -= _loc4_;
            _loc7_.y = 0;
            _loc8_ = true;
         }
         if(_loc7_.bottom > _loc6_)
         {
            _loc6_ = _loc7_.y + _loc7_.height;
            _loc8_ = true;
         }
         if(_loc8_)
         {
            _loc9_ = param1.getParamFlag(WindowParam.const_66);
            param1.setParamFlag(WindowParam.const_66,false);
            param1.setRectangle(param1.x + _loc3_,param1.y + _loc4_,_loc5_,_loc6_);
            if(_loc4_ != 0 || _loc3_ != 0)
            {
               _loc11_ = uint(param1.numChildren);
               _loc10_ = 0;
               while(_loc10_ < _loc11_)
               {
                  IWindow(param1.getChildAt(_loc10_)).offset(-_loc3_,-_loc4_);
                  _loc10_++;
               }
            }
            if(_loc9_)
            {
               param1.setParamFlag(WindowParam.const_66,true);
            }
         }
      }
      
      private static function calculateMouseRegion(param1:WindowController, param2:Rectangle) : void
      {
         var _loc3_:Rectangle = new Rectangle();
         param1.getGlobalRectangle(_loc3_);
         var _loc4_:int = param1.numChildren;
         var _loc5_:int = _loc3_.x;
         var _loc6_:int = _loc3_.y;
         param2.left = _loc5_ < param2.left ? Number(_loc5_) : Number(param2.left);
         param2.top = _loc6_ < param2.top ? Number(_loc6_) : Number(param2.top);
         param2.right = _loc3_.right > param2.right ? Number(_loc3_.right) : Number(param2.right);
         param2.bottom = _loc3_.bottom > param2.bottom ? Number(_loc3_.bottom) : Number(param2.bottom);
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            WindowController.calculateMouseRegion(param1.getChildAt(_loc7_) as WindowController,param2);
            _loc7_++;
         }
      }
      
      public static function resizeToAccommodateChildren(param1:WindowController, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc8_:* = null;
         var _loc12_:Boolean = false;
         var _loc4_:int = !!param2 ? 0 : 0;
         var _loc5_:int = !!param2 ? 0 : 0;
         var _loc6_:int = !!param2 ? 0 : 0;
         var _loc7_:int = !!param2 ? 0 : 0;
         var _loc9_:Boolean = false;
         var _loc10_:uint = param1.numChildren;
         var _loc11_:Boolean = param1.getParamFlag(WindowParam.const_66);
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc10_)
            {
               _loc8_ = param1.getChildAt(_loc3_).rectangle;
               if(_loc8_.x < _loc4_)
               {
                  _loc4_ = _loc8_.x;
                  _loc9_ = true;
               }
               if(_loc8_.right > _loc6_)
               {
                  _loc6_ = _loc8_.right;
                  _loc9_ = true;
               }
               if(_loc8_.y < _loc5_)
               {
                  _loc5_ = _loc8_.y;
                  _loc9_ = true;
               }
               if(_loc8_.bottom > _loc7_)
               {
                  _loc7_ = _loc8_.bottom;
                  _loc9_ = true;
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc10_)
            {
               _loc8_ = param1.getChildAt(_loc3_).rectangle;
               if(_loc8_.x < _loc4_)
               {
                  _loc4_ = _loc8_.x;
                  _loc9_ = true;
               }
               if(_loc8_.right > _loc6_)
               {
                  _loc6_ = _loc8_.right;
                  _loc9_ = true;
               }
               if(_loc8_.y < _loc5_)
               {
                  _loc5_ = _loc8_.y;
                  _loc9_ = true;
               }
               if(_loc8_.bottom > _loc7_)
               {
                  _loc7_ = _loc8_.bottom;
                  _loc9_ = true;
               }
               _loc3_++;
            }
         }
         if(_loc9_)
         {
            if(_loc11_)
            {
               param1.setParamFlag(WindowParam.const_66,false);
            }
            if(param2)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc10_)
               {
                  _loc12_ = param1.testParamFlag(WindowParam.const_89);
                  if(_loc12_)
                  {
                     param1.setParamFlag(WindowParam.const_89,false);
                  }
                  param1.offset(-_loc4_,-_loc5_);
                  if(_loc12_)
                  {
                     param1.setParamFlag(WindowParam.const_89,true);
                  }
                  _loc3_++;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < _loc10_)
               {
                  param1.getChildAt(_loc3_).offset(-_loc4_,-_loc5_);
                  _loc3_++;
               }
            }
            param1.setRectangle(param1.x + _loc4_,param1.y + _loc5_,!!param2 ? int(_loc6_ - _loc4_) : int(_loc6_),!!param2 ? int(_loc7_ - _loc5_) : int(_loc7_));
            if(_loc11_)
            {
               param1.setParamFlag(WindowParam.const_66,true);
            }
         }
      }
      
      public function getStyleFlag(param1:uint) : Boolean
      {
         return (var_76 & param1) != 0;
      }
      
      public function resolveHorizontalScale() : Number
      {
         return 0 / 0;
      }
      
      public function getChildByTag(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.tags.indexOf(param1) > -1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      protected function updateScaleRelativeToParent() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         if(this.var_13 == null)
         {
            return;
         }
         var _loc1_:* = !testParamFlag(WindowParam.const_123,WindowParam.const_154);
         var _loc2_:* = !testParamFlag(WindowParam.const_120,WindowParam.const_143);
         if(_loc1_ || _loc2_)
         {
            _loc3_ = var_11.clone();
            if(_loc1_)
            {
               _loc4_ = this.var_13.width - this.var_329.width;
               _loc5_ = uint(_param & 0);
               if(_loc5_ == WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRECH)
               {
                  _loc3_.width += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_376)
               {
                  _loc3_.x += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_158)
               {
                  if(this.var_13.width < _loc3_.width && this.getParamFlag(WindowParam.const_31))
                  {
                     _loc3_.x = 0;
                  }
                  else
                  {
                     _loc3_.x = this.var_13.width / 2 - _loc3_.width / 2;
                  }
               }
            }
            if(_loc2_)
            {
               _loc4_ = this.var_13.height - this.var_329.height;
               _loc5_ = uint(_param & 0);
               if(_loc5_ == WindowParam.const_322)
               {
                  _loc3_.height += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_373)
               {
                  _loc3_.y += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_173)
               {
                  if(this.var_13.height < _loc3_.height && this.getParamFlag(WindowParam.const_31))
                  {
                     _loc3_.y = 0;
                  }
                  else
                  {
                     _loc3_.y = this.var_13.height / 2 - _loc3_.height / 2;
                  }
               }
            }
            _loc6_ = uint(_param);
            _param &= -1;
            this.setRectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
            _param = _loc6_;
         }
         else if(testParamFlag(WindowParam.const_89))
         {
            _loc3_ = var_11.clone();
            if(this.var_13 != null)
            {
               _loc7_ = this.var_13.rectangle;
               _loc3_.x = _loc3_.x < 0 ? 0 : Number(_loc3_.x);
               _loc3_.y = _loc3_.y < 0 ? 0 : Number(_loc3_.y);
               _loc3_.x -= _loc3_.x + _loc3_.width > _loc7_.width ? _loc3_.x + _loc3_.width - _loc7_.width : 0;
               _loc3_.y -= _loc3_.y + _loc3_.height > _loc7_.height ? _loc3_.y + _loc3_.height - _loc7_.height : 0;
               _loc3_.width -= _loc3_.x + _loc3_.width > _loc7_.width ? _loc3_.x + _loc3_.width - _loc7_.width : 0;
               _loc3_.height -= _loc3_.y + _loc3_.height > _loc7_.height ? _loc3_.y + _loc3_.height - _loc7_.height : 0;
               if(_loc3_.x != var_11.x || _loc3_.y != var_11.y || _loc3_.width != var_11.width || _loc3_.height != var_11.height)
               {
                  _loc6_ = uint(_param);
                  _param &= -1;
                  this.setRectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
                  _param = _loc6_;
               }
            }
         }
      }
      
      public function get desktop() : IDesktopWindow
      {
         return var_17.getDesktopWindow();
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            if(true)
            {
               if(!this.isChildWindow())
               {
                  if(this.getStateFlag(WindowState.const_99))
                  {
                     this.deactivate();
                  }
               }
            }
            while(this._children.length > 0)
            {
               IDisposable(this._children.pop()).dispose();
            }
            if(this.parent)
            {
               this.parent = null;
            }
            this.dispatchEvent(new WindowDisposeEvent(this));
            if(this._events is IDisposable)
            {
               IDisposable(this._events).dispose();
               this._events = null;
            }
            if(this.var_20 != null)
            {
               this.var_20.dispose();
               this.var_20 = null;
            }
            super.dispose();
         }
      }
      
      protected function forwardKeyboardEvent(param1:KeyboardEvent) : WindowEvent
      {
         var _loc2_:String = "null";
         switch(param1.type)
         {
            case KeyboardEvent.KEY_DOWN:
               _loc2_ = "null";
               break;
            case KeyboardEvent.KEY_UP:
               _loc2_ = "null";
         }
         var _loc4_:WindowEvent = new WindowKeyboardEvent(_loc2_,param1,this,null,false,true);
         this.procedure(_loc4_,this);
         if(!_disposed && !_loc4_.isWindowOperationPrevented())
         {
            this.dispatchEvent(_loc4_);
         }
         return _loc4_;
      }
      
      public function set tags(param1:Array) : void
      {
         if(param1 != null)
         {
            var_735 = param1;
         }
      }
      
      public function getChildAt(param1:int) : IWindow
      {
         return this._children[param1] as IWindow;
      }
      
      public function set id(param1:uint) : void
      {
         _id = param1;
      }
      
      public function getChildByID(param1:uint) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findChildByName(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc2_ in this._children)
         {
            _loc2_ = _loc2_.findChildByName(param1) as WindowController;
            if(_loc2_)
            {
               return _loc2_ as IWindow;
            }
         }
         return null;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         var _loc2_:Boolean = false;
         if(!_disposed)
         {
            _loc2_ = this._events.dispatchEvent(param1);
         }
         return _loc2_;
      }
      
      public function setGlobalRectangle(param1:Rectangle) : void
      {
         var _loc2_:Point = new Point();
         if(this.var_13 != null)
         {
            this.var_13.getGlobalPosition(_loc2_);
            _loc2_.x += var_11.x;
            _loc2_.y += var_11.y;
         }
         else
         {
            _loc2_.x = var_11.x;
            _loc2_.y = var_11.y;
         }
         this.setRectangle(x + (param1.x - _loc2_.x),y + (param1.y - _loc2_.y),param1.width,param1.height);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(!_disposed)
         {
            this._events.addEventListener(param1,param2,param3,param4,param5);
         }
      }
      
      public function set position(param1:Point) : void
      {
         this.setRectangle(param1.x,param1.y,var_11.width,var_11.height);
      }
      
      public function get debug() : Boolean
      {
         return this._debug;
      }
      
      public function set height(param1:int) : void
      {
         if(param1 != var_11.height)
         {
            this.setRectangle(var_11.x,var_11.y,var_11.width,param1);
         }
      }
      
      public function set background(param1:Boolean) : void
      {
         var_488 = param1;
         var_394 = !!var_488 ? uint(var_394 | var_1134) : uint(var_394 & 16777215);
         this.var_147 = this.var_147 || param1;
         var_17.invalidate(this,var_11,WindowRedrawFlag.const_76);
      }
      
      public function set mouseTreshold(param1:uint) : void
      {
         var_393 = param1 > 255 ? 255 : uint(param1);
      }
      
      public function center() : void
      {
         if(this.var_13 != null)
         {
            this.x = this.var_13.width / 2 - 0;
            this.y = this.var_13.height / 2 - 0;
         }
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      private function notifyChildren(param1:WindowNotifyEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            _loc2_.update(this,param1);
         }
      }
      
      public function hitTestLocalRectangle(param1:Rectangle) : Boolean
      {
         return var_11.intersects(param1);
      }
      
      public function toString() : String
      {
         return "[Window " + getQualifiedClassName(this) + " " + this.var_2527 + "]";
      }
      
      public function setupGraphicsContext() : IGraphicContext
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         this.var_20 = this.getGraphicContext(true);
         if(this.var_13)
         {
            this.var_13.setupGraphicsContext();
         }
         if(this._children.length > 0)
         {
            if(this.var_20.numChildContexts != this.numChildren)
            {
               _loc1_ = 0;
               for each(_loc2_ in this._children)
               {
                  this.var_20.addChildContextAt(_loc2_.getGraphicContext(true),_loc1_++);
               }
            }
         }
         this.var_1367 = true;
         return this.var_20;
      }
      
      public function set type(param1:uint) : void
      {
         if(param1 != _type)
         {
            _type = param1;
            var_17.invalidate(this,var_11,WindowRedrawFlag.const_76);
         }
      }
      
      protected function notifyEventListeners(param1:WindowEvent) : void
      {
         this.procedure(param1,this);
         if(!param1.isWindowOperationPrevented())
         {
            if(this.hasEventListener(param1.type))
            {
               this.dispatchEvent(param1);
            }
         }
      }
      
      public function setStyleFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = var_76;
         var _loc4_:*;
         var_76 = !!param2 ? (_loc4_ = var_76 | param1, var_76 |= param1, uint(_loc4_)) : (_loc4_ = var_76 & ~param1, var_76 &= ~param1, uint(_loc4_));
         if(var_76 != _loc3_)
         {
            this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_459,this,null));
         }
      }
      
      public function deactivate() : Boolean
      {
         if(!this.getStateFlag(WindowState.const_99))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_921,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_99,false);
         _loc1_.type = WindowNotifyEvent.const_886;
         this.update(this,_loc1_);
         return true;
      }
      
      public function swapChildrenAt(param1:int, param2:int) : void
      {
         this.swapChildren(this._children[param1],this._children[param2]);
         this.var_20.swapChildContextsAt(param1,param2);
      }
      
      public function getChildByName(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function restore() : Boolean
      {
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1009,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_67,false);
         _loc1_.type = WindowNotifyEvent.const_1083;
         this.update(this,_loc1_);
         return true;
      }
      
      public function offset(param1:Number, param2:Number) : void
      {
         this.setRectangle(var_11.x + param1,var_11.y + param2,var_11.width,var_11.height);
      }
      
      public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !this.var_20)
         {
            this.var_20 = new GraphicContext("GC {" + _name + "}",GraphicContext.GC_TYPE_BITMAP,var_11);
            this.var_20.visible = var_333;
         }
         return this.var_20;
      }
      
      public function minimize() : Boolean
      {
         if(_state & 0)
         {
            return false;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_922,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_67,true);
         _loc1_.type = WindowNotifyEvent.const_905;
         this.update(this,_loc1_);
         return true;
      }
      
      public function findChildByTag(param1:String) : IWindow
      {
         if(var_735.indexOf(param1) > -1)
         {
            return this;
         }
         var _loc2_:WindowController = WindowController(this.getChildByTag(param1));
         if(_loc2_ == null)
         {
            for each(_loc2_ in this._children)
            {
               _loc2_ = _loc2_.findChildByTag(param1) as WindowController;
               if(_loc2_ != null)
               {
                  break;
               }
            }
         }
         return _loc2_ as IWindow;
      }
      
      protected function isChildWindow() : Boolean
      {
         return this.var_13 != context.getDesktopWindow();
      }
      
      public function set debug(param1:Boolean) : void
      {
         this._debug = param1;
      }
      
      public function set blend(param1:Number) : void
      {
         var_689 = param1 > 1 ? 1 : (param1 < 0 ? 0 : Number(param1));
         var_17.invalidate(this,var_11,WindowRedrawFlag.const_916);
      }
      
      public function addChildAt(param1:IWindow, param2:int) : IWindow
      {
         var _loc3_:WindowController = WindowController(param1);
         if(_loc3_.parent != null)
         {
            WindowController(_loc3_.parent).removeChild(_loc3_);
         }
         this._children.splice(param2,0,_loc3_);
         _loc3_.parent = this;
         if(this.var_1367 || _loc3_.hasGraphicsContext())
         {
            this.setupGraphicsContext();
            if(_loc3_.getGraphicContext(true).parent != this.var_20)
            {
               this.var_20.addChildContextAt(_loc3_.getGraphicContext(true),param2);
            }
         }
         this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_312,this,param1));
         return param1;
      }
      
      public function swapChildren(param1:IWindow, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(param1 != null && param2 != null && param1 != param2)
         {
            _loc3_ = this._children.indexOf(param1);
            if(_loc3_ < 0)
            {
               return;
            }
            _loc4_ = this._children.indexOf(param2);
            if(_loc4_ < 0)
            {
               return;
            }
            if(_loc4_ < _loc3_)
            {
               _loc5_ = param1;
               param1 = param2;
               param2 = _loc5_;
               _loc6_ = _loc3_;
               _loc3_ = _loc4_;
               _loc4_ = _loc6_;
            }
            this._children.splice(_loc4_,1);
            this._children.splice(_loc3_,1);
            this._children.splice(_loc3_,0,param2);
            this._children.splice(_loc4_,0,param1);
            if(WindowController(param1).hasGraphicsContext() || WindowController(param2).hasGraphicsContext())
            {
               this.var_20.swapChildContexts(WindowController(param1).getGraphicContext(true),WindowController(param2).getGraphicContext(true));
            }
         }
      }
      
      public function get parent() : IWindow
      {
         return this.var_13;
      }
      
      public function getRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null, param4:Rectangle = null) : void
      {
         if(param1 != null)
         {
            param1.x = var_11.x;
            param1.y = var_11.y;
            param1.width = var_11.width;
            param1.height = var_11.height;
         }
         if(param2 != null)
         {
            param2.x = var_55.x;
            param2.y = var_55.y;
            param2.width = var_55.width;
            param2.height = var_55.height;
         }
         if(param3 != null && var_124 != null)
         {
            param3.x = var_124.x;
            param3.y = var_124.y;
            param3.width = var_124.width;
            param3.height = var_124.height;
         }
         if(param4 != null && var_123 != null)
         {
            param4.x = var_123.x;
            param4.y = var_123.y;
            param4.width = var_123.width;
            param4.height = var_123.height;
         }
      }
      
      protected function requiresOwnGraphicContext() : Boolean
      {
         var _loc1_:* = null;
         if(testParamFlag(WindowParam.const_31))
         {
            for each(_loc1_ in this._children)
            {
               if(_loc1_.requiresOwnGraphicContext())
               {
                  return true;
               }
            }
            return false;
         }
         return true;
      }
      
      public function hasGraphicsContext() : Boolean
      {
         return this.var_20 != null || !testParamFlag(WindowParam.const_31);
      }
      
      public function validateLocalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         return this.testLocalPointHitAgainstAlpha(param1,param2,var_393);
      }
      
      public function set color(param1:uint) : void
      {
         var_1134 = param1 & 4278190080;
         var_394 = !!var_488 ? uint(param1) : uint(param1 & 16777215);
         var_17.invalidate(this,var_11,WindowRedrawFlag.const_76);
      }
      
      public function getMouseRegion(param1:Rectangle) : void
      {
         var _loc2_:* = null;
         this.getGlobalRectangle(param1);
         if(param1.width < 0)
         {
            param1.width = 0;
         }
         if(param1.height < 0)
         {
            param1.height = 0;
         }
         if(testParamFlag(WindowParam.const_31))
         {
            _loc2_ = new Rectangle();
            IWindow(this.var_13).getMouseRegion(_loc2_);
            if(param1.left < _loc2_.left)
            {
               param1.left = _loc2_.left;
            }
            if(param1.top < _loc2_.top)
            {
               param1.top = _loc2_.top;
            }
            if(param1.right > _loc2_.right)
            {
               param1.right = _loc2_.right;
            }
            if(param1.bottom > _loc2_.bottom)
            {
               param1.bottom = _loc2_.bottom;
            }
         }
      }
      
      protected function forwardNotifyEvent(param1:WindowNotifyEvent) : WindowEvent
      {
         var _loc5_:* = null;
         if(_disposed)
         {
            return _loc5_;
         }
         var _loc2_:String = "null";
         var _loc3_:IWindow = !!param1.related ? param1.related : param1.window;
         var _loc4_:Boolean = false;
         switch(param1.type)
         {
            case WindowNotifyEvent.const_645:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_165:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1043:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_517:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1002:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_345:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_921:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_886:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1267:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_1279:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_973:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_880:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_426:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_315:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_773:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_726:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_928:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_579:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1019:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_776:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1027:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_974:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1037:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_911:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_922:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_905:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_924:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_953:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1009:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_1083:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1015:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_1066:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_979:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_1033:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_926:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_956:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1084:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_971:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_459:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_433:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_397:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_557:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_223:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_975:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_288:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_495:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_312:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_884:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_694:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_447:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.WINDOW_NOTIFY_CHILD_RESIZED:
               _loc2_ = "null";
         }
         if(_loc2_ == WindowEvent.const_141)
         {
            throw new Error("Unknown window notify event: " + param1.type + "!");
         }
         _loc5_ = new WindowEvent(_loc2_,this,_loc3_,false,_loc4_);
         this.procedure(_loc5_,this);
         if(!_disposed)
         {
            if(!(_loc4_ && _loc5_.isWindowOperationPrevented()))
            {
               if(this.hasEventListener(_loc2_))
               {
                  this.dispatchEvent(_loc5_);
               }
            }
            if(param1.cancelable)
            {
               if(_loc5_.isWindowOperationPrevented())
               {
                  param1.preventWindowOperation();
               }
            }
         }
         return _loc5_;
      }
      
      public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:* = null;
         var _loc9_:* = 0;
         if(!testParamFlag(WindowParam.const_582))
         {
            if(param2 is WindowMouseEvent)
            {
               _loc5_ = this.forwardMouseEvent(param2 as WindowMouseEvent);
            }
            else if(param2 is WindowNotifyEvent)
            {
               _loc5_ = this.forwardNotifyEvent(param2 as WindowNotifyEvent);
            }
            else if(param2 is WindowTouchEvent)
            {
               _loc5_ = this.forwardTouchEvent(param2 as WindowTouchEvent);
            }
            else if(param2 is KeyboardEvent)
            {
               _loc5_ = this.forwardKeyboardEvent(param2 as KeyboardEvent);
            }
            else if(param2 is Event)
            {
               _loc5_ = this.forwardNormalEvent(param2);
            }
            if(_disposed)
            {
               return true;
            }
            if(_loc5_.cancelable)
            {
               if(_loc5_.isWindowOperationPrevented())
               {
                  return true;
               }
            }
            if(param2.cancelable)
            {
               if(!param2.isDefaultPrevented())
               {
                  return true;
               }
            }
         }
         if(param2 is WindowMouseEvent)
         {
            switch(param2.type)
            {
               case WindowMouseEvent.const_40:
                  if(this.activate())
                  {
                     if(param2.cancelable)
                     {
                        param2.preventDefault();
                     }
                  }
                  this.setStateFlag(WindowState.const_83,true);
                  _loc4_ = var_17.getWindowServices().getMouseListenerService();
                  _loc4_.begin(this);
                  _loc4_.eventTypes.push(WindowMouseEvent.const_57);
                  _loc4_.areaLimit = MouseListenerType.const_1012;
                  if(testParamFlag(WindowParam.const_344))
                  {
                     _loc3_ = {};
                     while(_loc3_ != null)
                     {
                        if(_loc3_.testParamFlag(WindowParam.const_218))
                        {
                           var_17.getWindowServices().getMouseDraggingService().begin(_loc3_);
                           break;
                        }
                        _loc3_ = _loc3_.parent;
                     }
                  }
                  if((_param & 0) > 0)
                  {
                     _loc3_ = {};
                     while(_loc3_ != null)
                     {
                        if(_loc3_.testParamFlag(WindowParam.const_295))
                        {
                           var_17.getWindowServices().getMouseScalingService().begin(_loc3_,_param & 0);
                           break;
                        }
                        _loc3_ = _loc3_.parent;
                     }
                  }
                  break;
               case WindowMouseEvent.const_57:
                  if(testStateFlag(WindowState.const_83))
                  {
                     this.setStateFlag(WindowState.const_83,false);
                  }
                  var_17.getWindowServices().getMouseListenerService().end(this);
                  if(testParamFlag(WindowParam.const_218))
                  {
                     var_17.getWindowServices().getMouseDraggingService().end(this);
                  }
                  if(testParamFlag(WindowParam.const_295))
                  {
                     var_17.getWindowServices().getMouseScalingService().end(this);
                  }
                  break;
               case WindowMouseEvent.const_25:
                  if(testStateFlag(WindowState.WINDOW_STATE_HOVERING))
                  {
                     this.setStateFlag(WindowState.WINDOW_STATE_HOVERING,false);
                  }
                  if(testStateFlag(WindowState.const_83))
                  {
                     this.setStateFlag(WindowState.const_83,false);
                  }
                  break;
               case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
                  if(!testStateFlag(WindowState.WINDOW_STATE_HOVERING))
                  {
                     this.setStateFlag(WindowState.WINDOW_STATE_HOVERING,true);
                  }
                  break;
               case WindowMouseEvent.const_269:
                  return false;
            }
         }
         if(param2 is WindowNotifyEvent)
         {
            switch(param2.type)
            {
               case WindowNotifyEvent.const_165:
                  var_17.invalidate(this,var_11.union(var_55),WindowRedrawFlag.RESIZE);
                  if(param1 == this)
                  {
                     this.notifyChildren(new WindowNotifyEvent(WindowNotifyEvent.const_447,this,null));
                     if(testParamFlag(WindowParam.const_158,WindowParam.const_154))
                     {
                        this.updateScaleRelativeToParent();
                     }
                     else if(testParamFlag(WindowParam.const_173,WindowParam.const_143))
                     {
                        this.updateScaleRelativeToParent();
                     }
                     if(this.var_13 != null)
                     {
                        _loc9_ = uint(_param);
                        _param &= ~(0 | 0);
                        if(testParamFlag(WindowParam.WINDOW_PARAM_REFLECT_HORIZONTAL_RESIZE_TO_PARENT))
                        {
                           this.var_13.width += 0 - 0;
                        }
                        if(testParamFlag(WindowParam.const_406))
                        {
                           this.var_13.height += 0 - 0;
                        }
                        _param = _loc9_;
                        this.var_13.update(this,new WindowNotifyEvent(WindowNotifyEvent.WINDOW_NOTIFY_CHILD_RESIZED,this.var_13,this));
                     }
                  }
                  break;
               case WindowNotifyEvent.const_517:
                  var_17.invalidate(this,var_11.union(var_55),WindowRedrawFlag.const_527);
                  if(param1 == this)
                  {
                     this.notifyChildren(new WindowNotifyEvent(WindowNotifyEvent.const_975,this,null));
                     if(this.var_13 != null)
                     {
                        this.var_13.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_288,this.var_13,this));
                     }
                  }
                  break;
               case WindowNotifyEvent.const_345:
                  if(param1 == this)
                  {
                     this.notifyChildren(new WindowNotifyEvent(WindowNotifyEvent.const_557,this,null));
                     if(this.var_13 != null)
                     {
                        this.var_13.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_223,this.var_13,this));
                     }
                  }
                  break;
               case WindowNotifyEvent.const_433:
                  var_17.invalidate(this,var_11,WindowRedrawFlag.const_933);
                  break;
               case WindowNotifyEvent.const_459:
                  _loc6_ = new Array();
                  this.groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc6_);
                  _loc7_ = uint(_loc6_.length);
                  while(--_loc7_ > -1)
                  {
                     _loc8_ = _loc6_[_loc7_] as WindowController;
                     if(_loc8_.tags.indexOf(const_1497) == -1)
                     {
                        _loc8_.style = var_76;
                     }
                  }
                  var_17.invalidate(this,var_11,WindowRedrawFlag.const_76);
                  break;
               case WindowNotifyEvent.const_397:
                  if(!(_param & 0))
                  {
                     if(!this.var_20)
                     {
                        this.setupGraphicsContext();
                        var_17.invalidate(this,var_11,WindowRedrawFlag.const_527);
                     }
                  }
                  else if(_param & 0)
                  {
                     if(this.var_20)
                     {
                        var_17.invalidate(this,var_11,WindowRedrawFlag.const_527);
                     }
                  }
                  break;
               case WindowNotifyEvent.const_495:
                  if(testParamFlag(WindowParam.const_158,WindowParam.const_154))
                  {
                     this.updateScaleRelativeToParent();
                  }
                  else if(testParamFlag(WindowParam.const_173,WindowParam.const_143))
                  {
                     this.updateScaleRelativeToParent();
                  }
                  var_17.invalidate(this,var_11,WindowRedrawFlag.const_76);
                  break;
               case WindowNotifyEvent.const_223:
                  this.activate();
                  break;
               case WindowNotifyEvent.const_447:
                  this.var_13.getRegionProperties(null,this.var_329);
                  this.updateScaleRelativeToParent();
                  break;
               case WindowNotifyEvent.const_312:
                  if(testParamFlag(WindowParam.const_66))
                  {
                     expandToAccommodateChild(this,WindowNotifyEvent(param2).related);
                  }
                  break;
               case WindowNotifyEvent.const_288:
                  if(testParamFlag(WindowParam.const_66))
                  {
                     expandToAccommodateChild(this,WindowNotifyEvent(param2).related);
                  }
                  break;
               case WindowNotifyEvent.const_694:
                  break;
               case WindowNotifyEvent.WINDOW_NOTIFY_CHILD_RESIZED:
                  if(testParamFlag(WindowParam.const_66))
                  {
                     expandToAccommodateChild(this,WindowNotifyEvent(param2).related);
                  }
            }
         }
         return true;
      }
      
      public function get procedure() : Function
      {
         return this.var_742 != null ? this.var_742 : (this.var_13 != null ? this.var_13.procedure : this.nullEventProc);
      }
      
      public function getGlobalRectangle(param1:Rectangle) : void
      {
         var _loc2_:Rectangle = var_11;
         if(this.var_13 != null)
         {
            this.var_13.getGlobalRectangle(param1);
            param1.x += _loc2_.x;
            param1.y += _loc2_.y;
         }
         else
         {
            param1.x = _loc2_.x;
            param1.y = _loc2_.y;
         }
         param1.width = _loc2_.width;
         param1.height = _loc2_.height;
      }
      
      public function focus() : Boolean
      {
         if(this.getStateFlag(WindowState.const_80))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1015,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_80,true);
         _loc1_.type = WindowNotifyEvent.const_1066;
         this.update(this,_loc1_);
         return true;
      }
      
      public function maximize() : Boolean
      {
         if(_state & 0)
         {
            return false;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_924,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_67,true);
         _loc1_.type = WindowNotifyEvent.const_953;
         this.update(this,_loc1_);
         return true;
      }
      
      public function set rectangle(param1:Rectangle) : void
      {
         this.setRectangle(param1.x,param1.y,param1.width,param1.height);
      }
      
      public function validateGlobalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         var _loc3_:Point = new Point();
         this.getGlobalPosition(_loc3_);
         _loc3_.x = param1.x - _loc3_.x;
         _loc3_.y = param1.y - _loc3_.y;
         return this.testLocalPointHitAgainstAlpha(_loc3_,param2,var_393);
      }
      
      public function getGlobalPosition(param1:Point) : void
      {
         if(this.var_13 != null)
         {
            this.var_13.getGlobalPosition(param1);
            param1.x += var_11.x;
            param1.y += var_11.y;
         }
         else
         {
            param1.x = var_11.x;
            param1.y = var_11.y;
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(param1 != var_333)
         {
            var_333 = param1;
            if(this.var_20)
            {
               this.var_20.visible = param1;
            }
            var_17.invalidate(this,var_11,WindowRedrawFlag.const_76);
         }
      }
      
      public function getStateFlag(param1:uint) : Boolean
      {
         return (_state & param1) != 0;
      }
      
      public function resolveVerticalScale() : Number
      {
         return 0 / 0;
      }
      
      public function getParamFlag(param1:uint) : Boolean
      {
         return (_param & param1) != 0;
      }
      
      public function set x(param1:int) : void
      {
         if(param1 != var_11.x)
         {
            this.setRectangle(param1,var_11.y,var_11.width,var_11.height);
         }
      }
      
      public function set y(param1:int) : void
      {
         if(param1 != var_11.y)
         {
            this.setRectangle(var_11.x,param1,var_11.width,var_11.height);
         }
      }
      
      public function activate() : Boolean
      {
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1002,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_99,true);
         _loc1_.type = WindowNotifyEvent.const_345;
         this.update(this,_loc1_);
         return true;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return !!_disposed ? false : Boolean(this._events.hasEventListener(param1));
      }
      
      public function setGlobalPosition(param1:Point) : void
      {
         var _loc2_:Point = new Point();
         if(this.var_13 != null)
         {
            this.var_13.getGlobalPosition(_loc2_);
            _loc2_.x += var_11.x;
            _loc2_.y += var_11.y;
         }
         else
         {
            _loc2_.x = var_11.x;
            _loc2_.y = var_11.y;
         }
         this.x = x + (param1.x - _loc2_.x);
         this.y = y + (param1.y - _loc2_.y);
      }
      
      public function isCapableOfUsingSharedGraphicContext() : Boolean
      {
         return true;
      }
      
      public function groupParameterFilteredChildrenUnderPoint(param1:Point, param2:Array, param3:uint = 0) : void
      {
         var _loc4_:* = null;
         if(var_333)
         {
            if(var_11.containsPoint(param1))
            {
               if((_param & param3) == param3)
               {
                  param2.push(this);
               }
               param1.offset(0,0);
               for each(_loc4_ in this._children)
               {
                  _loc4_.groupParameterFilteredChildrenUnderPoint(param1,param2,param3);
               }
               param1.offset(var_11.x,var_11.y);
            }
            else if(!var_734)
            {
               param1.offset(0,0);
               for each(_loc4_ in this._children)
               {
                  _loc4_.groupParameterFilteredChildrenUnderPoint(param1,param2,param3);
               }
               param1.offset(var_11.x,var_11.y);
            }
         }
      }
      
      public function disable() : Boolean
      {
         if(this.getStateFlag(WindowState.const_70))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1019,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_70,true);
         _loc1_.type = WindowNotifyEvent.const_776;
         this.update(this,_loc1_);
         return true;
      }
      
      public function getAbsoluteMousePosition(param1:Point) : void
      {
         param1.x = var_17.getDesktopWindow().mouseX;
         param1.y = var_17.getDesktopWindow().mouseY;
      }
      
      public function addChild(param1:IWindow) : IWindow
      {
         var _loc2_:WindowController = WindowController(param1);
         if(_loc2_.parent != null)
         {
            WindowController(_loc2_.parent).removeChild(_loc2_);
         }
         this._children.push(_loc2_);
         _loc2_.parent = this;
         if(this.var_1367 || _loc2_.hasGraphicsContext())
         {
            this.setupGraphicsContext();
            if(_loc2_.getGraphicContext(true).parent != this.var_20)
            {
               this.var_20.addChildContext(_loc2_.getGraphicContext(true));
            }
         }
         this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_312,this,param1));
         return param1;
      }
      
      public function fetchDrawBuffer() : IBitmapDrawable
      {
         return !testParamFlag(WindowParam.const_31) ? this.getGraphicContext(true).fetchDrawBuffer() : (this.var_13 != null ? this.var_13.fetchDrawBuffer() : null);
      }
      
      public function removeChild(param1:IWindow) : IWindow
      {
         var _loc2_:int = this._children.indexOf(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         this._children.splice(_loc2_,1);
         var _loc3_:WindowController = WindowController(param1);
         _loc3_.parent = null;
         if(_loc3_.hasGraphicsContext())
         {
            this.var_20.removeChildContext(_loc3_.getGraphicContext(true));
         }
         this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_694,this,param1));
         return param1;
      }
      
      public function getChildIndex(param1:IWindow) : int
      {
         return this._children.indexOf(param1);
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function setChildIndex(param1:IWindow, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = this._children.indexOf(param1);
         if(_loc3_ > -1 && param2 != _loc3_)
         {
            this._children.splice(_loc3_,1);
            this._children.splice(param2,0,param1);
            _loc4_ = WindowController(param1);
            if(_loc4_.hasGraphicsContext())
            {
               this.var_20.setChildContextIndex(_loc4_.getGraphicContext(true),this.getChildIndex(_loc4_));
            }
         }
      }
      
      public function set state(param1:uint) : void
      {
         if(param1 != _state)
         {
            _state = param1;
            this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_433,this,null));
         }
      }
      
      public function findParentByName(param1:String) : IWindow
      {
         if(_name == param1)
         {
            return this;
         }
         if(this.var_13 != null)
         {
            if(this.var_13.name == param1)
            {
               return this.var_13;
            }
            return this.var_13.findParentByName(param1);
         }
         return null;
      }
      
      public function setRectangle(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:* = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         param4 = Math.max(var_69.minHeight,param4);
         param4 = Math.min(var_69.maxHeight,param4);
         param3 = Math.max(var_69.minWidth,param3);
         param3 = Math.min(var_69.maxWidth,param3);
         var _loc5_:Boolean = param1 != var_11.x || param2 != var_11.y;
         var _loc6_:Boolean = param3 != var_11.width || param4 != var_11.height;
         if(_loc6_ && !_loc5_)
         {
            _loc7_ = uint(_param & 0);
            if(_loc7_ == WindowParam.const_508)
            {
               param1 -= (param3 - 0) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == WindowParam.const_425)
            {
               param1 -= param3 - 0;
               _loc5_ = true;
            }
            _loc7_ = uint(_param & 0);
            if(_loc7_ == WindowParam.const_417)
            {
               param2 -= (param4 - 0) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == WindowParam.const_446)
            {
               param2 -= param4 - 0;
               _loc5_ = true;
            }
         }
         if(testParamFlag(WindowParam.const_89))
         {
            if(this.var_13 != null)
            {
               _loc8_ = this.var_13.rectangle;
               param1 = param1 < 0 ? 0 : int(param1);
               param2 = param2 < 0 ? 0 : int(param2);
               if(_loc5_)
               {
                  param1 -= param1 + param3 > _loc8_.width ? param1 + param3 - _loc8_.width : 0;
                  param2 -= param2 + param4 > _loc8_.height ? param2 + param4 - _loc8_.height : 0;
                  _loc5_ = param1 != var_11.x || param2 != var_11.y;
               }
               else
               {
                  param3 -= param1 + param3 > _loc8_.width ? param1 + param3 - _loc8_.width : 0;
                  param4 -= param2 + param4 > _loc8_.height ? param2 + param4 - _loc8_.height : 0;
                  _loc6_ = param3 != var_11.width || param4 != var_11.height;
               }
            }
         }
         if(_loc5_ || _loc6_)
         {
            if(_loc5_)
            {
               _loc9_ = new WindowNotifyEvent(WindowNotifyEvent.const_1043,this,null,true);
               this.update(this,_loc9_);
               if(_loc9_.isWindowOperationPrevented())
               {
                  _loc5_ = false;
               }
            }
            if(_loc6_)
            {
               _loc9_ = new WindowNotifyEvent(WindowNotifyEvent.const_645,this,null,true);
               this.update(this,_loc9_);
               if(_loc9_.isWindowOperationPrevented())
               {
                  _loc6_ = false;
               }
            }
            if(_loc5_)
            {
               var_55.x = var_11.x;
               var_55.y = var_11.y;
               var_55.width = var_11.width;
               var_55.height = var_11.height;
               var_11.x = param1;
               var_11.y = param2;
            }
            if(_loc6_)
            {
               var_55.width = var_11.width;
               var_55.height = var_11.height;
               var_11.width = param3;
               var_11.height = param4;
            }
            if(_loc5_)
            {
               this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_517,this,null));
            }
            if(_loc6_)
            {
               this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_165,this,null));
            }
         }
      }
      
      public function lock() : Boolean
      {
         if(this.getStateFlag(WindowState.const_67))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_926,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_67,true);
         _loc1_.type = WindowNotifyEvent.const_956;
         this.update(this,_loc1_);
         return true;
      }
      
      protected function testLocalPointHitAgainstAlpha(param1:Point, param2:BitmapData, param3:uint) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:Boolean = false;
         if(true || true)
         {
            return false;
         }
         if(this.var_147 && var_393 > 0)
         {
            if(!testParamFlag(WindowParam.const_31))
            {
               if(param1.x <= var_11.width && param1.y <= var_11.height)
               {
                  _loc5_ = this.getGraphicContext(true).fetchDrawBuffer() as BitmapData;
                  if(_loc5_ != null)
                  {
                     _loc4_ = _loc5_.hitTest(var_1368,param3,param1);
                  }
               }
            }
            else
            {
               _loc4_ = param2 != null ? Boolean(param2.hitTest(var_1368,param3,param1)) : false;
            }
         }
         else if(param1.x >= 0 && param1.x < var_11.width)
         {
            if(param1.y >= 0 && param1.y < var_11.height)
            {
               _loc4_ = true;
            }
         }
         return _loc4_;
      }
      
      public function get properties() : Array
      {
         return new Array();
      }
      
      protected function forwardTouchEvent(param1:WindowTouchEvent) : WindowEvent
      {
         this.procedure(param1,this);
         if(!_disposed && !param1.isWindowOperationPrevented())
         {
            this.dispatchEvent(param1);
         }
         return param1;
      }
      
      override public function invalidate(param1:Rectangle = null) : void
      {
         if(param1 == null)
         {
            param1 = var_11;
         }
         var_17.invalidate(this,param1,WindowRedrawFlag.const_76);
      }
      
      public function convertPointFromLocalToGlobalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(this.var_13 == null)
         {
            param1.x = var_11.x;
            param1.y = var_11.y;
         }
         else
         {
            this.var_13.getGlobalPosition(param1);
            param1.x += var_11.x;
            param1.y += var_11.y;
         }
         param1.x += _loc2_;
         param1.y += _loc3_;
      }
      
      private function nullEventProc(param1:WindowEvent, param2:IWindow) : void
      {
      }
      
      public function getDrawRegion(param1:Rectangle) : void
      {
         if(!testParamFlag(WindowParam.const_31))
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = var_11.width;
            param1.height = var_11.height;
         }
         else if(this.var_13 != null)
         {
            this.var_13.getDrawRegion(param1);
            param1.x += var_11.x;
            param1.y += var_11.y;
            param1.width = var_11.width;
            param1.height = var_11.height;
         }
         else
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = 0;
            param1.height = 0;
         }
      }
      
      public function scale(param1:Number, param2:Number) : void
      {
         this.setRectangle(var_11.x,var_11.y,var_11.width + param1,var_11.height + param2);
      }
      
      public function getLocalRectangle(param1:Rectangle) : void
      {
         param1.x = var_11.x;
         param1.y = var_11.y;
         param1.width = var_11.width;
         param1.height = var_11.height;
      }
      
      public function unlock() : Boolean
      {
         if(!this.getStateFlag(WindowState.const_67))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1084,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_67,false);
         _loc1_.type = WindowNotifyEvent.const_971;
         this.update(this,_loc1_);
         return true;
      }
      
      public function set parent(param1:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1 == this)
         {
            throw new Error("Attempted to assign self as parent!");
         }
         if(param1 != null && param1.context != var_17)
         {
            var_17 = WindowContext(param1.context);
            for each(_loc3_ in this._children)
            {
               _loc3_.parent = this;
            }
         }
         var _loc2_:IWindow = this.var_13;
         if(this.var_13 != param1)
         {
            if(this.var_13 != null)
            {
               this.var_13.removeChild(this);
            }
            this.var_13 = WindowController(param1);
            if(this.var_13 != null)
            {
               this.var_329 = this.var_13.rectangle.clone();
               var_55.x = var_11.x;
               var_55.y = var_11.y;
               var_55.width = var_11.width;
               var_55.height = var_11.height;
               this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_495,this,this.var_13));
            }
            else
            {
               this.var_329.x = 0;
               this.var_329.y = 0;
               this.var_329.width = 0;
               this.var_329.height = 0;
               this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_884,this,_loc2_));
            }
         }
      }
      
      public function setParamFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = _param;
         var _loc4_:*;
         _param = !!param2 ? (_loc4_ = _param | param1, _param |= param1, uint(_loc4_)) : (_loc4_ = _param & ~param1, _param &= ~param1, uint(_loc4_));
         if(_param != _loc3_)
         {
            this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_397,this,null));
         }
      }
      
      public function expandToAccommodateChildren() : void
      {
         var _loc1_:* = null;
         var _loc6_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = this.getParamFlag(WindowParam.const_66);
         for each(_loc1_ in this._children)
         {
            _loc6_ = _loc1_.rectangle;
            if(_loc6_.x < _loc2_)
            {
               _loc4_ -= _loc6_.x - _loc2_;
               _loc2_ = _loc6_.x;
               _loc7_ = true;
            }
            if(_loc6_.right > _loc4_)
            {
               _loc4_ = _loc6_.x + _loc6_.width;
               _loc7_ = true;
            }
            if(_loc6_.y < _loc3_)
            {
               _loc5_ -= _loc6_.y - _loc3_;
               _loc3_ = _loc6_.y;
               _loc7_ = true;
            }
            if(_loc6_.bottom > _loc5_)
            {
               _loc5_ = _loc6_.y + _loc6_.height;
               _loc7_ = true;
            }
         }
         if(_loc7_)
         {
            if(_loc8_)
            {
               this.setParamFlag(WindowParam.const_66,false);
            }
            this.setRectangle(var_11.x + _loc2_,var_11.y + _loc3_,_loc4_,_loc5_);
            for each(_loc1_ in this._children)
            {
               _loc1_.offset(-_loc2_,-_loc3_);
            }
            if(_loc8_)
            {
               this.setParamFlag(WindowParam.const_66,true);
            }
         }
      }
      
      public function removeChildAt(param1:int) : IWindow
      {
         return this.removeChild(this.getChildAt(param1));
      }
      
      public function clone() : IWindow
      {
         var _loc1_:Class = getDefinitionByName(getQualifiedClassName(this)) as Class;
         var _loc2_:WindowController = new _loc1_(_name,_type,var_76,_param,var_17,var_11,null,this.var_742,this.properties,var_735.concat(),_id) as WindowController;
         _loc2_.var_393 = var_393;
         _loc2_.var_147 = this.var_147;
         _loc2_._debug = this._debug;
         _loc2_.var_329 = this.var_329.clone();
         _loc2_.var_11 = var_11.clone();
         _loc2_.var_334 = var_334.clone();
         _loc2_.var_55 = var_55.clone();
         _loc2_.var_124 = !!var_124 ? var_124.clone() : null;
         _loc2_.var_123 = !!var_123 ? var_123.clone() : null;
         _loc2_.var_69 = !!var_69 ? var_69.clone(_loc2_) : null;
         _loc2_.var_17 = var_17;
         _loc2_.var_394 = var_394;
         _loc2_.var_1134 = var_1134;
         _loc2_.var_734 = var_734;
         _loc2_.var_333 = var_333;
         _loc2_.var_689 = var_689;
         _loc2_._param = _param;
         _loc2_._state = _state;
         _loc2_._name = _name;
         _loc2_._id = _id;
         _loc2_.caption = var_96;
         _loc2_.background = var_488;
         this.cloneChildWindows(_loc2_);
         return _loc2_;
      }
      
      public function set style(param1:uint) : void
      {
         if(param1 != var_76)
         {
            var_76 = param1;
            this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_459,this,null));
         }
      }
      
      public function setStateFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = _state;
         var _loc4_:*;
         _state = !!param2 ? (_loc4_ = _state | param1, _state |= param1, uint(_loc4_)) : (_loc4_ = _state & ~param1, _state &= ~param1, uint(_loc4_));
         if(_state != _loc3_)
         {
            this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_433,this,null));
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(!_disposed)
         {
            this._events.removeEventListener(param1,param2,param3);
         }
      }
      
      public function groupChildrenWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         for each(_loc4_ in this._children)
         {
            if(_loc4_.tags.indexOf(param1) > -1)
            {
               param2.push(_loc4_);
               _loc5_++;
            }
            if(param3)
            {
               _loc5_ += _loc4_.groupChildrenWithTag(param1,param2,param3);
            }
         }
         return _loc5_;
      }
      
      public function enable() : Boolean
      {
         if(!this.getStateFlag(WindowState.const_70))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_928,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_70,false);
         _loc1_.type = WindowNotifyEvent.const_579;
         this.update(this,_loc1_);
         return true;
      }
      
      public function set clipping(param1:Boolean) : void
      {
         var_734 = param1;
         this.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_397,this,null));
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return !!_disposed ? false : Boolean(this._events.willTrigger(param1));
      }
      
      public function hitTestGlobalRectangle(param1:Rectangle) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         this.getGlobalRectangle(_loc2_);
         return _loc2_.intersects(param1);
      }
      
      public function hitTestLocalPoint(param1:Point) : Boolean
      {
         return var_11.containsPoint(param1);
      }
      
      public function set width(param1:int) : void
      {
         if(param1 != var_11.width)
         {
            this.setRectangle(var_11.x,var_11.y,param1,var_11.height);
         }
      }
      
      protected function forwardMouseEvent(param1:WindowMouseEvent) : WindowEvent
      {
         this.procedure(param1,this);
         if(!_disposed && !param1.isWindowOperationPrevented())
         {
            this.dispatchEvent(param1);
         }
         return param1;
      }
      
      public function releaseGraphicsContext() : void
      {
         this.var_1367 = false;
         if(!this.var_20)
         {
         }
      }
      
      public function getChildUnderPoint(param1:Point) : IWindow
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         if(var_333)
         {
            _loc2_ = new Rectangle();
            this.getMouseRegion(_loc2_);
            _loc3_ = _loc2_.containsPoint(param1);
            _loc5_ = uint(this.numChildren);
            if(_loc3_)
            {
               while(_loc5_ > 0)
               {
                  _loc4_ = WindowController(this._children[_loc5_ - 1]).getChildUnderPoint(param1);
                  if(_loc4_ != null)
                  {
                     return _loc4_;
                  }
                  _loc5_--;
               }
            }
            if(this.validateGlobalPointIntersection(param1,null))
            {
               return this;
            }
         }
         return null;
      }
      
      public function groupChildrenWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         for each(_loc4_ in this._children)
         {
            if(_loc4_.id == param1)
            {
               param2.push(_loc4_);
               _loc5_++;
            }
            if(param3)
            {
               _loc5_ += _loc4_.groupChildrenWithID(param1,param2,param3);
            }
         }
         return _loc5_;
      }
      
      public function get numChildren() : int
      {
         return this._children.length;
      }
      
      public function set procedure(param1:Function) : void
      {
         this.var_742 = param1;
      }
      
      public function get host() : IWindow
      {
         return this.var_13 == this.desktop ? {} : this.var_13.host;
      }
      
      public function buildFromXML(param1:XML, param2:Map = null) : Boolean
      {
         return var_17.getWindowParser().parseAndConstruct(param1,this,param2) != null;
      }
      
      public function convertPointFromGlobalToLocalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(this.var_13 == null)
         {
            param1.x = var_11.x;
            param1.y = var_11.y;
         }
         else
         {
            this.var_13.getGlobalPosition(param1);
            param1.x += var_11.x;
            param1.y += var_11.y;
         }
         param1.x = _loc2_ - param1.x;
         param1.y = _loc3_ - param1.y;
      }
      
      protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._children)
         {
            if(_loc2_.tags.indexOf(WindowController.TAG_EXCLUDE) == -1)
            {
               param1.addChild(_loc2_.clone());
            }
         }
      }
      
      public function hitTestGlobalPoint(param1:Point) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         this.getGlobalRectangle(_loc2_);
         return _loc2_.containsPoint(param1);
      }
      
      public function getRelativeMousePosition(param1:Point) : void
      {
         this.getGlobalPosition(param1);
         param1.x = var_17.getDesktopWindow().mouseX - param1.x;
         param1.y = var_17.getDesktopWindow().mouseY - param1.y;
      }
      
      public function setRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null) : void
      {
         if(param3 != null)
         {
            if(param3.width < 0 || param3.height < 0)
            {
               throw new Error("Invalid rectangle; maximized size can\'t be less than zero!");
            }
            if(var_123 == null)
            {
               var_123 = new Rectangle();
            }
            var_123.x = param3.x;
            var_123.y = param3.y;
            var_123.width = param3.width;
            var_123.height = param3.height;
         }
         if(param2 != null)
         {
            if(param2.width < 0 || param2.height < 0)
            {
               throw new Error("Invalid rectangle; minimized size can\'t be less than zero!");
            }
            if(var_124 == null)
            {
               var_124 = new Rectangle();
            }
            var_124.x = param2.x;
            var_124.y = param2.y;
            var_124.width = param2.width;
            var_124.height = param2.height;
         }
         if(param3.width < param2.width || param3.height < param2.height)
         {
            param3.width = param2.width;
            param3.height = param2.height;
            throw new Error("Maximized rectangle can\'t be smaller than minimized rectangle!");
         }
         if(param1 != null)
         {
            this.setRectangle(param1.x,param1.y,param1.width,param1.height);
         }
      }
      
      public function groupChildrenUnderPoint(param1:Point, param2:Array) : void
      {
         var _loc3_:* = null;
         if(var_333)
         {
            if(var_11.containsPoint(param1))
            {
               param2.push(this);
               param1.offset(0,0);
               for each(_loc3_ in this._children)
               {
                  _loc3_.groupChildrenUnderPoint(param1,param2);
               }
               param1.offset(var_11.x,var_11.y);
            }
            else if(!var_734)
            {
               param1.offset(0,0);
               for each(_loc3_ in this._children)
               {
                  _loc3_.groupChildrenUnderPoint(param1,param2);
               }
               param1.offset(var_11.x,var_11.y);
            }
         }
      }
      
      public function set caption(param1:String) : void
      {
         param1 = !!param1 ? param1 : "";
         if(param1 != caption)
         {
            var_96 = param1;
            var_17.invalidate(this,var_11,WindowRedrawFlag.const_76);
         }
      }
      
      public function unfocus() : Boolean
      {
         if(!this.getStateFlag(WindowState.const_80))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_979,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         this.setStateFlag(WindowState.const_80,false);
         _loc1_.type = WindowNotifyEvent.const_1033;
         this.update(this,_loc1_);
         return true;
      }
      
      public function resolve() : uint
      {
         return 0;
      }
      
      protected function forwardNormalEvent(param1:Event) : WindowEvent
      {
         var _loc2_:String = "null";
         switch(param1.type)
         {
            case Event.CHANGE:
               _loc2_ = "null";
         }
         var _loc4_:WindowEvent = new WindowEvent(_loc2_,this,null,false,true);
         this.procedure(_loc4_,this);
         if(!_disposed && !_loc4_.isWindowOperationPrevented())
         {
            this.dispatchEvent(_loc4_);
         }
         return _loc4_;
      }
      
      public function destroy() : Boolean
      {
         if(_state == WindowState.const_513)
         {
            return true;
         }
         _state = WindowState.const_513;
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_973,this,null);
         this.update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         _loc1_.type = WindowNotifyEvent.const_880;
         this.update(this,_loc1_);
         this.dispose();
         return true;
      }
      
      public function get filters() : Array
      {
         return !!this.hasGraphicsContext() ? this.getGraphicContext(true).filters : [];
      }
      
      public function childRectToClippedDrawRegion(param1:Rectangle, param2:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc3_:Boolean = false;
         if(testParamFlag(WindowParam.const_31))
         {
            param1.offset(var_11.x,var_11.y);
            if(clipping)
            {
               _loc4_ = param1.intersection(var_11);
               if(param1.x < var_11.x)
               {
                  param2.x -= param1.x - 0;
                  param1.x = var_11.x;
                  _loc3_ = true;
               }
               if(param1.y < var_11.y)
               {
                  param2.y -= param1.y - 0;
                  param1.y = var_11.y;
                  _loc3_ = true;
               }
               if(param1.width != _loc4_.width)
               {
                  param1.width = _loc4_.width;
                  _loc3_ = true;
               }
               if(param1.height != _loc4_.height)
               {
                  param1.height = _loc4_.height;
                  _loc3_ = true;
               }
               param2.width = _loc4_.width;
               param2.height = _loc4_.height;
            }
            if(this.var_13 != null)
            {
               _loc3_ = WindowController(this.var_13).childRectToClippedDrawRegion(param1,param2) || _loc3_;
            }
         }
         else if(clipping)
         {
            if(param1.x < 0)
            {
               param2.x -= param1.x;
               param1.x = 0;
               _loc3_ = true;
            }
            if(param1.y < 0)
            {
               param2.y -= param1.y;
               param1.y = 0;
               _loc3_ = true;
            }
            if(var_11.width < param1.right)
            {
               param2.right -= param1.right - 0;
               param1.right = param1.width;
               _loc3_ = true;
            }
            if(var_11.height < param1.bottom)
            {
               param2.bottom -= param1.bottom - 0;
               param1.bottom = var_11.height;
               _loc3_ = true;
            }
         }
         return !!_loc3_ ? param2.width > 0 && param2.height > 0 : true;
      }
      
      public function set filters(param1:Array) : void
      {
         if(this.hasGraphicsContext())
         {
            this.getGraphicContext(true).filters = param1;
         }
      }
      
      public function getLocalPosition(param1:Point) : void
      {
         param1.x = var_11.x;
         param1.y = var_11.y;
      }
   }
}
