package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ItemRemoveMessageParser implements IMessageParser
   {
       
      
      private var var_1748:int = 0;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function ItemRemoveMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1748 = 0;
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function get itemId() : int
      {
         return this.var_1748;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1748 = int(param1.readString());
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
   }
}
