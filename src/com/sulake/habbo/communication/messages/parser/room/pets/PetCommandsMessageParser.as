package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_919:Array;
      
      private var var_1618:int;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1618 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_919 = new Array();
         while(_loc2_-- > 0)
         {
            this.var_919.push(param1.readInteger());
         }
         return true;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_919;
      }
      
      public function get petId() : int
      {
         return this.var_1618;
      }
      
      public function flush() : Boolean
      {
         this.var_1618 = -1;
         this.var_919 = null;
         return true;
      }
   }
}
