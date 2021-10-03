package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.session.IRoomHandlerListener;
   
   public class BaseHandler implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      public var _xxxRoomId:int;
      
      public var _xxxRoomCategory:int;
      
      private var var_143:IRoomHandlerListener;
      
      private var _connection:IConnection;
      
      public function BaseHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super();
         this._connection = param1;
         this.var_143 = param2;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get connection() : IConnection
      {
         return this._connection;
      }
      
      public function get listener() : IRoomHandlerListener
      {
         return this.var_143;
      }
      
      public function dispose() : void
      {
         this._connection = null;
         this.var_143 = null;
         this._disposed = true;
      }
   }
}
