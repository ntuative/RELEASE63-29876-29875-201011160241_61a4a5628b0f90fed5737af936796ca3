package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomSearchResultData implements IDisposable, MsgWithRequestId
   {
       
      
      private var _searchType:int;
      
      private var _disposed:Boolean;
      
      private var var_2412:String;
      
      private var var_1083:OfficialRoomEntryData;
      
      private var var_107:Array;
      
      public function GuestRoomSearchResultData(param1:IMessageDataWrapper)
      {
         this.var_107 = new Array();
         super();
         this._searchType = param1.readInteger();
         this.var_2412 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_107.push(new GuestRoomData(param1));
            _loc3_++;
         }
         var _loc4_:Boolean = param1.readBoolean();
         if(_loc4_)
         {
            this.var_1083 = new OfficialRoomEntryData(param1);
         }
      }
      
      public function get ad() : OfficialRoomEntryData
      {
         return this.var_1083;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get searchType() : int
      {
         return this._searchType;
      }
      
      public function get rooms() : Array
      {
         return this.var_107;
      }
      
      public function get searchParam() : String
      {
         return this.var_2412;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_107 != null)
         {
            for each(_loc1_ in this.var_107)
            {
               _loc1_.dispose();
            }
         }
         if(this.var_1083 != null)
         {
            this.var_1083.dispose();
            this.var_1083 = null;
         }
         this.var_107 = null;
      }
   }
}
