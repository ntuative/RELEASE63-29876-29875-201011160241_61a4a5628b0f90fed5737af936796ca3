package com.sulake.habbo.widget.events
{
   public class RoomWidgetAvatarEditorUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_597:String = "RWUE_AVATAR_EDITOR_CLOSED";
      
      public static const const_559:String = "RWUE_HIDE_AVATAR_EDITOR";
       
      
      public function RoomWidgetAvatarEditorUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
