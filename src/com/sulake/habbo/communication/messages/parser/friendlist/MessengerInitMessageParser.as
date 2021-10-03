package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2489:int;
      
      private var var_2488:int;
      
      private var var_88:Array;
      
      private var var_207:Array;
      
      private var var_2491:int;
      
      private var var_2493:int;
      
      private var var_2492:int;
      
      private var var_2490:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_88 = new Array();
         this.var_207 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2489;
      }
      
      public function get friends() : Array
      {
         return this.var_207;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2491;
      }
      
      public function get categories() : Array
      {
         return this.var_88;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2488;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2490;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2490 = param1.readInteger();
         this.var_2491 = param1.readInteger();
         this.var_2489 = param1.readInteger();
         this.var_2492 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_88.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_207.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2488 = param1.readInteger();
         this.var_2493 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2492;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2493;
      }
   }
}
