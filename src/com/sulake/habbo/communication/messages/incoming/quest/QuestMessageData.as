package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1597:String;
      
      private var var_1415:String;
      
      private var var_1414:int;
      
      private var var_335:int;
      
      private var var_1413:int;
      
      private var _type:String;
      
      private var _id:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this.var_335 = param1.readInteger();
         this._type = param1.readString();
         this.var_1414 = param1.readInteger();
         this.var_1413 = param1.readInteger();
         this.var_1415 = param1.readString();
         this.var_1597 = param1.readString();
      }
      
      public function get status() : int
      {
         return this.var_335;
      }
      
      public function get localizationCode() : String
      {
         return this.var_1597;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1413;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get endDateTimeStamp() : String
      {
         return this.var_1415;
      }
      
      public function get stuffId() : int
      {
         return this.var_1414;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this.var_335 = 0;
         this._type = "";
         this.var_1414 = 0;
         this.var_1413 = 0;
         this.var_1415 = "";
      }
   }
}
