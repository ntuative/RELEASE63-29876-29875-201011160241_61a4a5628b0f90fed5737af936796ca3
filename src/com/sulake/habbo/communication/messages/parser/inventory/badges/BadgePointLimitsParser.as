package com.sulake.habbo.communication.messages.parser.inventory.badges
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class BadgePointLimitsParser implements IMessageParser
   {
       
      
      private var _data:Array;
      
      public function BadgePointLimitsParser()
      {
         super();
      }
      
      public function get data() : Array
      {
         return this._data;
      }
      
      public function flush() : Boolean
      {
         this._data = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            _loc5_ = param1.readInteger();
            _loc6_ = 0;
            while(_loc6_ < _loc5_)
            {
               this._data.push(new BadgeAndPointLimit(_loc4_,param1));
               _loc6_++;
            }
            _loc3_++;
         }
         return true;
      }
   }
}
