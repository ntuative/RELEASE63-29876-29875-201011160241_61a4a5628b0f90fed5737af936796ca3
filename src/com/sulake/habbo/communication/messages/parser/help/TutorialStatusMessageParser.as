package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1364:Boolean;
      
      private var var_1118:Boolean;
      
      private var var_1363:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1364;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1118;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1363 = param1.readBoolean();
         this.var_1118 = param1.readBoolean();
         this.var_1364 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1363;
      }
      
      public function flush() : Boolean
      {
         this.var_1363 = false;
         this.var_1118 = false;
         this.var_1364 = false;
         return true;
      }
   }
}
