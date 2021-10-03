package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1442:GarbageMonitor = null;
      
      private var var_1444:int = 0;
      
      private var var_1722:Boolean = false;
      
      private var var_1988:String = "";
      
      private var var_1440:String = "";
      
      private var var_412:Number = 0;
      
      private var var_1441:int = 10;
      
      private var var_2585:Array;
      
      private var var_499:int = 0;
      
      private var var_1443:int = 60;
      
      private var var_1179:int = 0;
      
      private var var_1176:int = 0;
      
      private var var_2410:String = "";
      
      private var var_1989:Number = 0;
      
      private var var_1439:int = 1000;
      
      private var var_1987:Boolean = true;
      
      private var var_1990:Number = 0.15;
      
      private var var_157:IHabboConfigurationManager = null;
      
      private var var_1178:String = "";
      
      private var var_1177:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         this.var_2585 = [];
         super();
         this.var_1440 = Capabilities.version;
         this.var_1988 = Capabilities.os;
         this.var_1722 = Capabilities.isDebugger;
         this.var_1178 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1178 == null)
         {
            this.var_1178 = "unknown";
         }
         this.var_1442 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1444 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_1442.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_1442.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_412;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         this.var_1443 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return this.var_1440;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = this.updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++this.var_1176;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_1439)
         {
            ++this.var_1179;
            _loc3_ = true;
         }
         else
         {
            ++this.var_499;
            if(this.var_499 <= 1)
            {
               this.var_412 = param1;
            }
            else
            {
               _loc4_ = Number(this.var_499);
               this.var_412 = this.var_412 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - this.var_1444 > this.var_1443 * 1000 && this.var_1177 < this.var_1441)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_412);
            _loc5_ = true;
            if(this.var_1987 && this.var_1177 > 0)
            {
               _loc6_ = this.differenceInPercents(this.var_1989,this.var_412);
               if(_loc6_ < this.var_1990)
               {
                  _loc5_ = false;
               }
            }
            this.var_1444 = getTimer();
            if(_loc5_ || _loc3_)
            {
               this.var_1989 = this.var_412;
               if(this.sendReport())
               {
                  ++this.var_1177;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_1441 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_1439 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,this.var_1178,this.var_1440,this.var_1988,this.var_2410,this.var_1722,_loc4_,_loc3_,this.var_1176,this.var_412,this.var_1179);
            this._connection.send(_loc1_);
            this.var_1176 = 0;
            this.var_412 = 0;
            this.var_499 = 0;
            this.var_1179 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this.var_157 = param1;
         this.var_1443 = int(this.var_157.getKey("performancetest.interval","60"));
         this.var_1439 = int(this.var_157.getKey("performancetest.slowupdatelimit","1000"));
         this.var_1441 = int(this.var_157.getKey("performancetest.reportlimit","10"));
         this.var_1990 = Number(this.var_157.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_1987 = Boolean(int(this.var_157.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
