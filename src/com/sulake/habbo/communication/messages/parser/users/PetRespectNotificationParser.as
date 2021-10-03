package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_2220:int;
      
      private var var_1330:PetData;
      
      private var var_2221:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return this.var_2220;
      }
      
      public function get petData() : PetData
      {
         return this.var_1330;
      }
      
      public function flush() : Boolean
      {
         this.var_1330 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return this.var_2221;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2220 = param1.readInteger();
         this.var_2221 = param1.readInteger();
         this.var_1330 = new PetData(param1);
         return true;
      }
   }
}
