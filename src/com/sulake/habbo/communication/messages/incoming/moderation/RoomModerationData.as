package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_109:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1954:int;
      
      private var var_323:int;
      
      private var var_605:RoomData;
      
      private var var_1875:int;
      
      private var _ownerName:String;
      
      private var var_2448:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_323 = param1.readInteger();
         this.var_1954 = param1.readInteger();
         this.var_2448 = param1.readBoolean();
         this.var_1875 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_109 = new RoomData(param1);
         this.var_605 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return this.var_1954;
      }
      
      public function get event() : RoomData
      {
         return this.var_605;
      }
      
      public function get room() : RoomData
      {
         return this.var_109;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_109 != null)
         {
            this.var_109.dispose();
            this.var_109 = null;
         }
         if(this.var_605 != null)
         {
            this.var_605.dispose();
            this.var_605 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_323;
      }
      
      public function get ownerId() : int
      {
         return this.var_1875;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2448;
      }
   }
}
