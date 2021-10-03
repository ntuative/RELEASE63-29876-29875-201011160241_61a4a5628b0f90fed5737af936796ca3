package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_401:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_633:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_872:String;
      
      private var var_288:int;
      
      private var _text:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         this.var_288 = param2;
         this._text = param3;
         this.var_872 = param4;
      }
      
      public function get objectId() : int
      {
         return this.var_288;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get colorHex() : String
      {
         return this.var_872;
      }
   }
}
