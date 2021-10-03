package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1510:String;
      
      private var var_2227:int;
      
      private var var_2230:int;
      
      private var var_2228:int;
      
      private var var_2229:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2227 = param1.readInteger();
         this.var_2228 = param1.readInteger();
         this.var_2230 = param1.readInteger();
         this.var_2229 = param1.readString();
         this.var_1510 = param1.readString();
      }
      
      public function get msg() : String
      {
         return this.var_1510;
      }
      
      public function get hour() : int
      {
         return this.var_2227;
      }
      
      public function get minute() : int
      {
         return this.var_2228;
      }
      
      public function get chatterName() : String
      {
         return this.var_2229;
      }
      
      public function get chatterId() : int
      {
         return this.var_2230;
      }
   }
}
