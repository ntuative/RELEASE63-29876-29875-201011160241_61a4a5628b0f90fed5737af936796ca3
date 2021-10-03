package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2099:String;
      
      private var var_1191:String;
      
      private var var_2100:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         this.var_2100 = param1;
         this.var_1191 = param2;
         this.var_2099 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2100,this.var_1191,this.var_2099];
      }
      
      public function dispose() : void
      {
      }
   }
}
