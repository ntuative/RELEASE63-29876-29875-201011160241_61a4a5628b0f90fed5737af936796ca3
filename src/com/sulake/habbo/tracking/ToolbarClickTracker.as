package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1772:Boolean = false;
      
      private var var_1153:IHabboTracking;
      
      private var var_1730:int = 0;
      
      private var var_2429:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1153 = param1;
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1772)
         {
            return;
         }
         ++this.var_1730;
         if(this.var_1730 <= this.var_2429)
         {
            this.var_1153.track("toolbar",param1);
         }
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1772 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2429 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function dispose() : void
      {
         this.var_1153 = null;
      }
   }
}
