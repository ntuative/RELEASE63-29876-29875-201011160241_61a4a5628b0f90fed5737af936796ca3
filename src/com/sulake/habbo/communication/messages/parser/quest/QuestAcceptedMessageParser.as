package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestAcceptedMessageParser implements IMessageParser
   {
       
      
      private var var_1431:String;
      
      private var var_932:QuestMessageData;
      
      public function QuestAcceptedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1431 = param1.readString();
         this.var_932 = new QuestMessageData(param1);
         return true;
      }
      
      public function get campaignId() : String
      {
         return this.var_1431;
      }
      
      public function flush() : Boolean
      {
         this.var_1431 = "";
         if(this.var_932)
         {
            this.var_932.dispose();
         }
         this.var_932 = null;
         return true;
      }
      
      public function get questData() : QuestMessageData
      {
         return this.var_932;
      }
   }
}
