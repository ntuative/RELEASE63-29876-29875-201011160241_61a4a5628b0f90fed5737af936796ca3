package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class GestureAgentService implements IGestureAgentService, IDisposable
   {
       
      
      protected var var_1143:int;
      
      private var _disposed:Boolean = false;
      
      protected var var_175:Timer;
      
      protected var var_1391:uint = 0;
      
      protected var _window:IWindow;
      
      protected var var_248:Function;
      
      protected var _working:Boolean;
      
      protected var var_1142:int;
      
      public function GestureAgentService()
      {
         super();
      }
      
      private function clientWindowDestroyed(param1:WindowEvent) : void
      {
         this.end(this._window);
      }
      
      protected function operate(param1:TimerEvent) : void
      {
         this.var_1142 *= 0.75;
         this.var_1143 *= 0.75;
         if(Math.abs(this.var_1142) <= 1 && Math.abs(this.var_1143) <= 1)
         {
            this.end(this._window);
         }
         else if(this.var_248 != null)
         {
            this.var_248(this.var_1142,this.var_1143);
         }
      }
      
      public function end(param1:IWindow) : IWindow
      {
         var _loc2_:IWindow = this._window;
         if(this.var_175)
         {
            this.var_175.stop();
            this.var_175.removeEventListener(TimerEvent.TIMER,this.operate);
            this.var_175 = null;
         }
         if(this._working)
         {
            if(this._window == param1)
            {
               if(!this._window.disposed)
               {
                  this._window.removeEventListener(WindowEvent.const_272,this.clientWindowDestroyed);
               }
               this._window = null;
               this._working = false;
            }
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         this.end(this._window);
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function begin(param1:IWindow, param2:Function, param3:uint, param4:int, param5:int) : IWindow
      {
         this.var_1391 = param3;
         var _loc6_:IWindow = this._window;
         if(this._window != null)
         {
            this.end(this._window);
         }
         if(param1 && !param1.disposed)
         {
            this._window = param1;
            this._window.addEventListener(WindowEvent.const_272,this.clientWindowDestroyed);
            this.var_248 = param2;
            this._working = true;
            this.var_1142 = param4;
            this.var_1143 = param5;
            this.var_175 = new Timer(40,0);
            this.var_175.addEventListener(TimerEvent.TIMER,this.operate);
            this.var_175.start();
         }
         return _loc6_;
      }
   }
}
