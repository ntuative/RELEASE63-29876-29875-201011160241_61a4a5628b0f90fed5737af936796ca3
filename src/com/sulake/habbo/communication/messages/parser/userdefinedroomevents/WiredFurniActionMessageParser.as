package com.sulake.habbo.communication.messages.parser.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.ActionDefinition;
   
   public class WiredFurniActionMessageParser implements IMessageParser
   {
       
      
      private var var_1463:ActionDefinition;
      
      public function WiredFurniActionMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1463 = new ActionDefinition(param1);
         return true;
      }
      
      public function get def() : ActionDefinition
      {
         return this.var_1463;
      }
      
      public function flush() : Boolean
      {
         this.var_1463 = null;
         return true;
      }
   }
}
