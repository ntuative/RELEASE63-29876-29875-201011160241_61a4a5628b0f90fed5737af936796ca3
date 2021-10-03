package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2383:String;
      
      private var var_323:int;
      
      private var var_2386:String;
      
      private var var_2385:String;
      
      private var var_2387:int;
      
      private var var_2384:String;
      
      private var var_2388:int;
      
      private var var_735:Array;
      
      private var var_1110:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_735 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1110 = false;
            return;
         }
         this.var_1110 = true;
         this.var_2387 = int(_loc2_);
         this.var_2386 = param1.readString();
         this.var_323 = int(param1.readString());
         this.var_2388 = param1.readInteger();
         this.var_2383 = param1.readString();
         this.var_2385 = param1.readString();
         this.var_2384 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_735.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return this.var_2388;
      }
      
      public function get eventName() : String
      {
         return this.var_2383;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2385;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2386;
      }
      
      public function get tags() : Array
      {
         return this.var_735;
      }
      
      public function get creationTime() : String
      {
         return this.var_2384;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1110;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2387;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_735 = null;
      }
      
      public function get flatId() : int
      {
         return this.var_323;
      }
   }
}
