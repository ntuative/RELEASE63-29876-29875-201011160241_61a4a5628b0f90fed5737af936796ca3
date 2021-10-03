package com.sulake.habbo.quest
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestAcceptedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestCompletedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestListMessageEvent;
   import com.sulake.habbo.communication.messages.parser.quest.QuestAcceptedMessageParser;
   import com.sulake.habbo.communication.messages.parser.quest.QuestCompletedMessageParser;
   import com.sulake.habbo.communication.messages.parser.quest.QuestListMessageParser;
   
   public class IncomingMessages
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      public function IncomingMessages(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         var _loc2_:IHabboCommunicationManager = this._questEngine.communication;
         _loc2_.addHabboConnectionMessageEvent(new QuestListMessageEvent(this.onQuestList));
         _loc2_.addHabboConnectionMessageEvent(new QuestAcceptedMessageEvent(this.onQuestAccepted));
         _loc2_.addHabboConnectionMessageEvent(new QuestCompletedMessageEvent(this.onQuestCompleted));
      }
      
      private function onQuestCompleted(param1:IMessageEvent) : void
      {
         var _loc2_:QuestCompletedMessageParser = (param1 as QuestCompletedMessageEvent).getParser();
         Logger.log("Quest Completed: " + _loc2_.campaignId + " quest: " + _loc2_.questData.id);
         this._questEngine.controller.questCompleted(_loc2_.campaignId,_loc2_.questData);
      }
      
      private function onQuestList(param1:IMessageEvent) : void
      {
         var _loc2_:QuestListMessageParser = (param1 as QuestListMessageEvent).getParser();
         Logger.log("Got Quest List: " + _loc2_.campaignId + " quests: " + _loc2_.quests.length);
         this._questEngine.controller.openCampaign(_loc2_.campaignId,_loc2_.quests);
      }
      
      private function onQuestAccepted(param1:IMessageEvent) : void
      {
         var _loc2_:QuestAcceptedMessageParser = (param1 as QuestAcceptedMessageEvent).getParser();
         Logger.log("Quest Accepted: " + _loc2_.campaignId + " quest: " + _loc2_.questData.id);
         this._questEngine.controller.questAccepted(_loc2_.campaignId,_loc2_.questData);
      }
   }
}
