package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_737:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_836:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_737);
         this.var_836 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_836;
      }
   }
}
