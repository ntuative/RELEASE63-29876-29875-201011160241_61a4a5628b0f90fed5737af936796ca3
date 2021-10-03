package com.sulake.habbo.communication.messages.outgoing.room.session
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenConnectionMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var var_2152:int;
      
      private var var_2151:Boolean;
      
      public function OpenConnectionMessageComposer(param1:Boolean, param2:int, param3:int = 0)
      {
         super();
         this._roomId = param2;
         this.var_2151 = param1;
         this.var_2152 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [int(this.var_2151),this._roomId,this.var_2152];
      }
      
      public function dispose() : void
      {
      }
   }
}
