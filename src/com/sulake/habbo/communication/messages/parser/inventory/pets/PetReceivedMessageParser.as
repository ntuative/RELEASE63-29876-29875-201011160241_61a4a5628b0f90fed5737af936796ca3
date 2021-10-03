package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1040:PetData;
      
      private var var_1662:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1662 = param1.readBoolean();
         this.var_1040 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1662 + ", " + this.var_1040.id + ", " + this.var_1040.name + ", " + this.pet.figure + ", " + this.var_1040.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1662;
      }
      
      public function get pet() : PetData
      {
         return this.var_1040;
      }
   }
}
