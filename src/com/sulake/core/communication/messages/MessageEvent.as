package com.sulake.core.communication.messages
{
   import com.sulake.core.communication.connection.IConnection;
   
   public class MessageEvent implements IMessageEvent
   {
       
      
      private var _parserClass:Class;
      
      protected var var_248:Function;
      
      protected var _connection:IConnection;
      
      protected var var_10:IMessageParser;
      
      public function MessageEvent(param1:Function, param2:Class)
      {
         super();
         this.var_248 = param1;
         this._parserClass = param2;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function get callback() : Function
      {
         return this.var_248;
      }
      
      public function dispose() : void
      {
         this.var_248 = null;
         this._parserClass = null;
         this._connection = null;
         this.var_10 = null;
      }
      
      public function get connection() : IConnection
      {
         return this._connection;
      }
      
      public function set parser(param1:IMessageParser) : void
      {
         this.var_10 = param1;
      }
      
      public function get parserClass() : Class
      {
         return this._parserClass;
      }
   }
}
