package com.sulake.habbo.quest
{
   public class QuestCampaign
   {
       
      
      private var _id:String;
      
      public function QuestCampaign(param1:String)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : String
      {
         Logger.log("QuestCampaign: return " + this._id + " instead of xmas10.");
         return "xmas10";
      }
      
      public function dispose() : void
      {
      }
   }
}
