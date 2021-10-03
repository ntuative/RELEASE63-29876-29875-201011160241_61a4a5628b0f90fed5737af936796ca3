package com.sulake.core.runtime.events
{
   import com.sulake.core.Core;
   import com.sulake.core.runtime.IDisposable;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class EventDispatcher implements IEventDispatcher, IDisposable
   {
      
      private static const const_1212:uint = 1;
      
      private static const const_542:uint = 0;
      
      private static const const_861:uint = 2;
       
      
      private var var_583:Error;
      
      protected var _disposed:Boolean = false;
      
      private var var_232:Dictionary;
      
      private var var_209:flash.events.EventDispatcher;
      
      private var _result:uint;
      
      public function EventDispatcher(param1:IEventDispatcher = null)
      {
         this.var_232 = new Dictionary();
         super();
         this.var_209 = new flash.events.EventDispatcher(!!param1 ? param1 : this);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         if(!this._disposed)
         {
            this._result = const_542;
            this.var_209.dispatchEvent(param1);
            if(this._result == const_861)
            {
               if(this.var_583 != null)
               {
                  Core.crash("Error catched when handling " + getQualifiedClassName(param1) + ": " + this.var_583.message,this.var_583.errorID,this.var_583);
               }
               else
               {
                  Core.crash("Error catched when handling " + getQualifiedClassName(param1) + ". No error data available!",0,this.var_583);
               }
            }
            return this._result == const_542;
         }
         return false;
      }
      
      public function callEventListeners(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = this.var_232[param1];
         if(_loc2_)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.callback(null);
            }
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return !!this._disposed ? false : this.var_232[param1] != null;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(!this._disposed)
         {
            _loc4_ = this.var_232[param1];
            if(_loc4_)
            {
               _loc5_ = 0;
               for each(_loc6_ in _loc4_)
               {
                  if(_loc6_.callback == param2 && _loc6_.var_1817 == param3)
                  {
                     _loc4_.splice(_loc5_,1);
                     _loc6_.callback = null;
                     if(_loc4_.length == 0)
                     {
                        delete this.var_232[param1];
                     }
                     return;
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc8_:* = null;
         var _loc6_:Array = this.var_232[param1];
         var _loc7_:EventListenerStruct = new EventListenerStruct(param2,param3,param4,param5);
         if(!_loc6_)
         {
            _loc6_ = [_loc7_];
            this.var_232[param1] = _loc6_;
            this.var_209.addEventListener(param1,this.eventProcessor);
         }
         else
         {
            for each(_loc8_ in _loc6_)
            {
               if(_loc8_.callback == param2 && _loc8_.var_1817 == param3)
               {
                  return;
               }
               if(param4 > _loc8_.priority)
               {
                  _loc6_.splice(_loc6_.indexOf(_loc8_),0,_loc7_);
                  return;
               }
            }
            _loc6_.push(_loc7_);
         }
      }
      
      public function get error() : Error
      {
         return this.var_583;
      }
      
      private function eventProcessor(param1:Event) : void
      {
         var callbacks:Array = null;
         var callback:Function = null;
         var struct:EventListenerStruct = null;
         var event:Event = param1;
         var array:Array = this.var_232[event.type];
         if(array)
         {
            callbacks = [];
            for each(struct in array)
            {
               callbacks.push(struct.callback);
            }
            while(callbacks.length > 0)
            {
               try
               {
                  callback = callbacks.shift();
                  callback(event);
               }
               catch(e:Error)
               {
                  Logger.log(e.getStackTrace());
                  _result = const_861;
                  var_583 = e;
                  return;
               }
            }
         }
         this._result = !!event.isDefaultPrevented() ? uint(const_1212) : uint(const_542);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this._disposed)
         {
            for(_loc1_ in this.var_232)
            {
               _loc2_ = this.var_232[_loc1_] as Array;
               for each(_loc3_ in _loc2_)
               {
                  _loc3_.callback = null;
               }
               delete this.var_232[_loc1_];
            }
            this.var_232 = null;
            this.var_209 = null;
            this._disposed = true;
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return !!this._disposed ? false : this.var_232[param1] != null;
      }
   }
}
