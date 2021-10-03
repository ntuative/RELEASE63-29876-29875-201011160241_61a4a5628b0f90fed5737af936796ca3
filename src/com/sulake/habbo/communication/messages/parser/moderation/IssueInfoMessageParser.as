package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.getTimer;
   
   public class IssueInfoMessageParser implements IMessageParser
   {
       
      
      private var var_58:IssueMessageData;
      
      public function IssueInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_58 = new IssueMessageData();
         this.var_58.issueId = param1.readInteger();
         this.var_58.state = param1.readInteger();
         this.var_58.categoryId = param1.readInteger();
         this.var_58.reportedCategoryId = param1.readInteger();
         this.var_58.timeStamp = getTimer() - param1.readInteger();
         this.var_58.priority = param1.readInteger();
         this.var_58.reporterUserId = param1.readInteger();
         this.var_58.reporterUserName = param1.readString();
         this.var_58.reportedUserId = param1.readInteger();
         this.var_58.reportedUserName = param1.readString();
         this.var_58.pickerUserId = param1.readInteger();
         this.var_58.pickerUserName = param1.readString();
         this.var_58.message = param1.readString();
         this.var_58.chatRecordId = param1.readInteger();
         this.var_58.roomName = param1.readString();
         this.var_58.roomType = param1.readInteger();
         if(this.var_58.roomType == 0)
         {
            this.var_58.roomResources = param1.readString();
            this.var_58.unitPort = param1.readInteger();
            this.var_58.worldId = param1.readInteger();
         }
         if(this.var_58.roomType == 1)
         {
            this.var_58.flatType = param1.readString();
            this.var_58.flatId = param1.readInteger();
            this.var_58.flatOwnerName = param1.readString();
         }
         return true;
      }
      
      public function get issueData() : IssueMessageData
      {
         return this.var_58;
      }
      
      public function flush() : Boolean
      {
         this.var_58 = null;
         return true;
      }
   }
}
