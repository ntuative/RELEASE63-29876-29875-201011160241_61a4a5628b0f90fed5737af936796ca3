package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static var var_332:IEventQueue;
      
      public static var var_1383:IMouseCursor;
      
      private static var stage:Stage;
      
      public static const const_1597:int = 1;
      
      private static var var_545:IEventProcessor;
      
      public static const const_1662:int = 0;
      
      public static const const_1719:int = 3;
      
      public static const const_423:uint = 0;
      
      private static var var_1558:uint = const_423;
      
      private static var var_144:IWindowRenderer;
      
      public static const const_319:int = 5;
      
      public static const const_1258:uint = 1;
      
      public static const const_1291:int = 4;
      
      public static const const_1579:int = 2;
       
      
      private var _disposed:Boolean = false;
      
      protected var var_2569:IInternalWindowServices;
      
      protected var var_2570:IWindowParser;
      
      protected var var_1141:Error;
      
      private var var_2218:Boolean = false;
      
      private var var_2217:IWindowContextStateListener;
      
      protected var var_1849:int = -1;
      
      private var _eventProcessorState:EventProcessorState;
      
      protected var var_125:IDesktopWindow;
      
      protected var var_2622:Boolean = true;
      
      protected var var_1387:SubstituteParentController;
      
      private var var_496:Boolean = false;
      
      protected var var_169:DisplayObjectContainer;
      
      private var _name:String;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_2568:IWindowFactory;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_144 = param2;
         this._localization = param4;
         this.var_169 = param5;
         this.var_2569 = new ServiceManager(this,param5);
         this.var_2568 = param3;
         this.var_2570 = new WindowParser(this);
         this.var_2217 = param7;
         if(!stage)
         {
            if(this.var_169 is Stage)
            {
               stage = this.var_169 as Stage;
            }
            else if(this.var_169.stage)
            {
               stage = this.var_169.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_125 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_169.addChild(this.var_125.getDisplayObject());
         this.var_169.doubleClickEnabled = true;
         this.var_169.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this._eventProcessorState = new EventProcessorState(var_144,this.var_125,this.var_125,null,this.var_2217);
         inputMode = const_423;
         this.var_1387 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1558;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_332)
         {
            if(var_332 is IDisposable)
            {
               IDisposable(var_332).dispose();
            }
         }
         if(var_545)
         {
            if(var_545 is IDisposable)
            {
               IDisposable(var_545).dispose();
            }
         }
         switch(value)
         {
            case const_423:
               var_332 = new MouseEventQueue(stage);
               var_545 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1258:
               var_332 = new TabletEventQueue(stage);
               var_545 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_423;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_125)
         {
            this.var_125 = null;
         }
         if(param1.state != WindowState.const_513)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = Classes.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            this.handleError(WindowContext.const_1291,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1387;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_125,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_2569;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2218 = true;
         var_144.update(param1);
         this.var_2218 = false;
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_169.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_169.removeChild(IGraphicContextHost(this.var_125).getGraphicContext(true) as DisplayObject);
            this.var_125.destroy();
            this.var_125 = null;
            this.var_1387.destroy();
            this.var_1387 = null;
            var_144 = null;
            this._disposed = true;
         }
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_2570;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_125 != null && !this.var_125.disposed)
         {
            if(this.var_169 is Stage)
            {
               this.var_125.width = Stage(this.var_169).stageWidth;
               this.var_125.height = Stage(this.var_169).stageHeight;
            }
            else
            {
               this.var_125.width = this.var_169.width;
               this.var_125.height = this.var_169.height;
            }
         }
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         var_144.addToRenderQueue(WindowController(param1),param2,param3);
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2568;
      }
      
      public function update(param1:uint) : void
      {
         this.var_496 = true;
         if(this.var_1141)
         {
            throw this.var_1141;
         }
         var_545.process(this._eventProcessorState,var_332);
         this.var_496 = false;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1141 = param2;
         this.var_1849 = param1;
         if(this.var_2622)
         {
            throw param2;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1141;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1383 == null)
         {
            var_1383 = new MouseCursorControl(this.var_169);
         }
         return var_1383;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_1849;
      }
      
      public function flushError() : void
      {
         this.var_1141 = null;
         this.var_1849 = -1;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_125.findChildByName(param1);
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_125;
      }
   }
}
