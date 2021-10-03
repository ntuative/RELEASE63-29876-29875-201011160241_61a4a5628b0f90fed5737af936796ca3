package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
       
      
      private var var_1772:Boolean = false;
      
      private var var_1680:int;
      
      private var var_1679:int;
      
      private var var_1054:int;
      
      private var _connection:IConnection;
      
      public function LagWarningLogger()
      {
         super();
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1772 = Boolean(int(param1.getKey("lagWarningLog.enabled","1")));
         this.var_1679 = int(param1.getKey("lagWarningLog.interval.seconds","10")) * 1000;
      }
      
      public function update() : void
      {
         this.reportWarningsAsNeeded();
      }
      
      public function chatLagDetected() : void
      {
         if(!this.var_1772 || this.var_1679 <= 0)
         {
            return;
         }
         ++this.var_1054;
         this.reportWarningsAsNeeded();
      }
      
      private function reportWarningsAsNeeded() : void
      {
         var _loc2_:* = null;
         if(this.var_1054 == 0 || this._connection == null)
         {
            return;
         }
         var _loc1_:int = getTimer();
         if(this.var_1680 == 0 || _loc1_ - this.var_1680 > this.var_1679)
         {
            _loc2_ = new LagWarningReportMessageComposer(this.var_1054);
            this._connection.send(_loc2_);
            this.var_1680 = _loc1_;
            this.var_1054 = 0;
         }
      }
   }
}
