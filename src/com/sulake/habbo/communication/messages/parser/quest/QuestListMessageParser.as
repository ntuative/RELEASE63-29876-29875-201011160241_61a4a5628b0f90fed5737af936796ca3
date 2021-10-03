package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestListMessageParser implements IMessageParser
   {
       
      
      private var var_379:Array;
      
      private var var_1431:String;
      
      public function QuestListMessageParser()
      {
         super();
      }
      
      public function get quests() : Array
      {
         return this.var_379;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1431 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_379.push(new QuestMessageData(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var _loc1_:* = null;
         this.var_1431 = "";
         if(this.var_379)
         {
            for each(_loc1_ in this.var_379)
            {
               _loc1_.dispose();
            }
         }
         this.var_379 = [];
         return true;
      }
      
      public function get campaignId() : String
      {
         return this.var_1431;
      }
   }
}
