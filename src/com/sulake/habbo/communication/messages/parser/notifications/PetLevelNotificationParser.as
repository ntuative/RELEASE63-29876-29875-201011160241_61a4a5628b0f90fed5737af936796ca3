package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_564:String;
      
      private var var_1804:int;
      
      private var var_2338:String;
      
      private var var_1185:int;
      
      private var var_1618:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1618;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1618 = param1.readInteger();
         this.var_2338 = param1.readString();
         this.var_1804 = param1.readInteger();
         this.var_564 = param1.readString();
         this.var_1185 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return this.var_2338;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
      
      public function get petType() : int
      {
         return this.var_1185;
      }
      
      public function get level() : int
      {
         return this.var_1804;
      }
   }
}
