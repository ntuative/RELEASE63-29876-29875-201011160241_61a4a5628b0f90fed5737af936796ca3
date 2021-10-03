package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_646:String = "RWUAM_RESPECT_USER";
      
      public static const const_753:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_775:String = "RWUAM_START_TRADING";
      
      public static const const_774:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_700:String = "RWUAM_WHISPER_USER";
      
      public static const const_621:String = "RWUAM_IGNORE_USER";
      
      public static const const_334:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_754:String = "RWUAM_BAN_USER";
      
      public static const const_740:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_477:String = "RWUAM_KICK_USER";
      
      public static const const_705:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_416:String = " RWUAM_RESPECT_PET";
      
      public static const const_521:String = "RWUAM_KICK_BOT";
      
      public static const const_1436:String = "RWUAM_TRAIN_PET";
      
      public static const const_395:String = "RWUAM_PICKUP_PET";
      
      public static const const_735:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_605:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
