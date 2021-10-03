package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2519:Boolean;
      
      private var var_2520:int;
      
      private var _offerId:int;
      
      private var var_2082:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_2519 = param1.readBoolean();
         this.var_2520 = param1.readInteger();
         this.var_2082 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2082;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2519;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2520;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
   }
}
