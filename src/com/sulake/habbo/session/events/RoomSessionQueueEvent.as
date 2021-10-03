package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionQueueEvent extends RoomSessionEvent
   {
      
      public static const const_438:String = "RSQE_QUEUE_STATUS";
      
      public static const const_958:int = 2;
      
      public static const const_1068:String = "c";
      
      public static const const_1451:String = "d";
      
      public static const const_1086:int = 1;
       
      
      private var var_1160:Map;
      
      private var _name:String;
      
      private var var_2639:String;
      
      private var var_388:Boolean;
      
      private var _target:int;
      
      public function RoomSessionQueueEvent(param1:IRoomSession, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_438,param1,param5,param6);
         this._name = param2;
         this._target = param3;
         this.var_1160 = new Map();
         this.var_388 = param4;
      }
      
      public function getQueueSize(param1:String) : int
      {
         return this.var_1160.getValue(param1);
      }
      
      public function get queueTypes() : Array
      {
         return this.var_1160.getKeys();
      }
      
      public function get queueSetTarget() : int
      {
         return this._target;
      }
      
      public function get method_1() : Boolean
      {
         return this.var_388;
      }
      
      public function get queueSetName() : String
      {
         return this._name;
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         this.var_1160.add(param1,param2);
      }
   }
}
