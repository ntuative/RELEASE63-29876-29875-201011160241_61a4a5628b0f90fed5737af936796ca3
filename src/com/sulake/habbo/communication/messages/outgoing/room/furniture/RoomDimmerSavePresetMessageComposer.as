package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_2035:int;
      
      private var var_2036:int;
      
      private var var_2037:Boolean;
      
      private var var_2034:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2033:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2036 = param1;
         this.var_2035 = param2;
         this.var_2034 = param3;
         this.var_2033 = param4;
         this.var_2037 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2036,this.var_2035,this.var_2034,this.var_2033,int(this.var_2037)];
      }
      
      public function dispose() : void
      {
      }
   }
}
