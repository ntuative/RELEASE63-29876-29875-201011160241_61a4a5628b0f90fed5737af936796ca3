package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1352:int = 4;
      
      public static const const_732:int = 3;
      
      public static const const_644:int = 2;
      
      public static const const_929:int = 1;
       
      
      private var var_1953:String;
      
      private var _disposed:Boolean;
      
      private var var_1954:int;
      
      private var var_1955:Boolean;
      
      private var var_791:String;
      
      private var var_754:PublicRoomData;
      
      private var var_1956:int;
      
      private var _index:int;
      
      private var var_1957:String;
      
      private var _type:int;
      
      private var var_1880:String;
      
      private var var_755:GuestRoomData;
      
      private var var_1952:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_1953 = param1.readString();
         this.var_1952 = param1.readString();
         this.var_1955 = param1.readInteger() == 1;
         this.var_1957 = param1.readString();
         this.var_791 = param1.readString();
         this.var_1956 = param1.readInteger();
         this.var_1954 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_929)
         {
            this.var_1880 = param1.readString();
         }
         else if(this._type == const_732)
         {
            this.var_754 = new PublicRoomData(param1);
         }
         else if(this._type == const_644)
         {
            this.var_755 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return this.var_1956;
      }
      
      public function get popupCaption() : String
      {
         return this.var_1953;
      }
      
      public function get userCount() : int
      {
         return this.var_1954;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_1955;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_929)
         {
            return 0;
         }
         if(this.type == const_644)
         {
            return this.var_755.maxUserCount;
         }
         if(this.type == const_732)
         {
            return this.var_754.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return this.var_1952;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_755 != null)
         {
            this.var_755.dispose();
            this.var_755 = null;
         }
         if(this.var_754 != null)
         {
            this.var_754.dispose();
            this.var_754 = null;
         }
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_755;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get picText() : String
      {
         return this.var_1957;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_754;
      }
      
      public function get picRef() : String
      {
         return this.var_791;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get tag() : String
      {
         return this.var_1880;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
   }
}
