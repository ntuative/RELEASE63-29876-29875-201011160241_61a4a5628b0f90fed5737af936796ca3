package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1470:int;
      
      private var var_1008:String;
      
      private var var_948:Array;
      
      private var var_1195:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return this.var_948.slice();
      }
      
      public function flush() : Boolean
      {
         this.var_1008 = "";
         this.var_1195 = [];
         this.var_948 = [];
         this.var_1470 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return this.var_1470;
      }
      
      public function get question() : String
      {
         return this.var_1008;
      }
      
      public function get choices() : Array
      {
         return this.var_1195.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1008 = param1.readString();
         this.var_1195 = [];
         this.var_948 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1195.push(param1.readString());
            this.var_948.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1470 = param1.readInteger();
         return true;
      }
   }
}
