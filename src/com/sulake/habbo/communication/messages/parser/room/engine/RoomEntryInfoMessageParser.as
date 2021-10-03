package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2556:int;
      
      private var var_377:Boolean;
      
      private var var_1813:Boolean;
      
      private var var_1127:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1813 = param1.readBoolean();
         if(this.var_1813)
         {
            this.var_2556 = param1.readInteger();
            this.var_377 = param1.readBoolean();
         }
         else
         {
            this.var_1127 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1127 != null)
         {
            this.var_1127.dispose();
            this.var_1127 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2556;
      }
      
      public function get owner() : Boolean
      {
         return this.var_377;
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1813;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1127;
      }
   }
}
