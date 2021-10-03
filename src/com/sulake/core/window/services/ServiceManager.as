package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices
   {
       
      
      private var var_126:DisplayObject;
      
      private var var_2612:uint;
      
      private var var_1052:IToolTipAgentService;
      
      private var var_1051:IMouseScalingService;
      
      private var _windowContext:IWindowContext;
      
      private var var_1050:IFocusManagerService;
      
      private var var_1053:IMouseListenerService;
      
      private var var_1049:IGestureAgentService;
      
      private var var_1048:IMouseDraggingService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2612 = 0;
         this.var_126 = param2;
         this._windowContext = param1;
         this.var_1048 = new WindowMouseDragger(param2);
         this.var_1051 = new WindowMouseScaler(param2);
         this.var_1053 = new WindowMouseListener(param2);
         this.var_1050 = new FocusManager(param2);
         this.var_1052 = new WindowToolTipAgent(param2);
         this.var_1049 = new GestureAgentService();
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1051;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1050;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1052;
      }
      
      public function dispose() : void
      {
         if(this.var_1048 != null)
         {
            this.var_1048.dispose();
            this.var_1048 = null;
         }
         if(this.var_1051 != null)
         {
            this.var_1051.dispose();
            this.var_1051 = null;
         }
         if(this.var_1053 != null)
         {
            this.var_1053.dispose();
            this.var_1053 = null;
         }
         if(this.var_1050 != null)
         {
            this.var_1050.dispose();
            this.var_1050 = null;
         }
         if(this.var_1052 != null)
         {
            this.var_1052.dispose();
            this.var_1052 = null;
         }
         if(this.var_1049 != null)
         {
            this.var_1049.dispose();
            this.var_1049 = null;
         }
         this._windowContext = null;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1049;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1053;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1048;
      }
   }
}
