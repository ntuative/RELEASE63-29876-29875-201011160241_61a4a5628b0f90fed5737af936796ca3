package com.sulake.habbo.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_1008:String = "whisper";
      
      public static const const_1385:String = "shout";
      
      public static const const_772:String = "RWWCIDE_CHAT_INPUT_CONTENT";
       
      
      private var var_2459:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_772,param3,param4);
         this.var_2459 = param1;
         this._userName = param2;
      }
      
      public function get messageType() : String
      {
         return this.var_2459;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}
