package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class AvatarActionMessageData
   {
       
      
      private var _actionParameter:String;
      
      private var var_1446:String;
      
      public function AvatarActionMessageData(param1:String, param2:String)
      {
         super();
         this.var_1446 = param1;
         this._actionParameter = param2;
      }
      
      public function get actionType() : String
      {
         return this.var_1446;
      }
      
      public function get actionParameter() : String
      {
         return this._actionParameter;
      }
   }
}
