package com.sulake.habbo.communication.messages.parser.inventory.furni
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PostItPlacedParser implements IMessageParser
   {
       
      
      private var var_2419:int;
      
      private var _id:int;
      
      public function PostItPlacedParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = param1.readInteger();
         this.var_2419 = param1.readInteger();
         return true;
      }
      
      public function get itemsLeft() : int
      {
         return this.var_2419;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}
