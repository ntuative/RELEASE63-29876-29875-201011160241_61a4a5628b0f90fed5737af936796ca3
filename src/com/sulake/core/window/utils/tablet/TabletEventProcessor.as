package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2649:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_125 = param1.desktop;
         var_75 = param1.var_1128 as WindowController;
         _lastClickTarget = param1.var_1130 as WindowController;
         var_144 = param1.renderer;
         var_733 = param1.var_1129;
         param2.begin();
         param2.end();
         param1.desktop = var_125;
         param1.var_1128 = var_75;
         param1.var_1130 = _lastClickTarget;
         param1.renderer = var_144;
         param1.var_1129 = var_733;
      }
   }
}
