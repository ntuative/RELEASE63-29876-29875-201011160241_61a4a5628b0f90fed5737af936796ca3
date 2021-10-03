package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class FramerateTracker
   {
       
      
      private var var_1444:int;
      
      private var var_412:Number;
      
      private var var_1484:int;
      
      private var var_956:int;
      
      private var var_2073:int;
      
      private var var_2075:Boolean;
      
      private var var_2074:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_956;
         var _loc3_:int = getTimer();
         if(this.var_956 == 1)
         {
            this.var_412 = param1;
            this.var_1444 = _loc3_;
         }
         else
         {
            _loc4_ = Number(this.var_956);
            this.var_412 = this.var_412 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2075 && _loc3_ - this.var_1444 >= this.var_2074 && this.var_1484 < this.var_2073)
         {
            _loc5_ = 1000 / this.var_412;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1484;
            this.var_1444 = _loc3_;
            this.var_956 = 0;
         }
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2074 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2073 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2075 = true;
      }
      
      public function dispose() : void
      {
      }
   }
}
