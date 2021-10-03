package com.sulake.habbo.communication.messages.outgoing.room.session
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GoToFlatMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var _roomCategory:int = 0;
      
      public function GoToFlatMessageComposer(param1:int, param2:int = 0)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this._roomId];
      }
      
      public function dispose() : void
      {
      }
   }
}
