package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   
   public class FriendRequest implements IDisposable
   {
      
      public static const const_358:int = 2;
      
      public static const const_151:int = 1;
      
      public static const const_1004:int = 4;
      
      public static const const_347:int = 3;
       
      
      private var var_2163:int;
      
      private var _view:IWindowContainer;
      
      private var var_2162:String;
      
      private var _state:int = 1;
      
      private var _disposed:Boolean;
      
      private var var_969:int;
      
      public function FriendRequest(param1:FriendRequestData)
      {
         super();
         this.var_969 = param1.requestId;
         this.var_2162 = param1.requesterName;
         this.var_2163 = param1.requesterUserId;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get requesterName() : String
      {
         return this.var_2162;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2163;
      }
      
      public function get requestId() : int
      {
         return this.var_969;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this._view = param1;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.view != null)
         {
            this.view.destroy();
            this.view = null;
         }
      }
   }
}
