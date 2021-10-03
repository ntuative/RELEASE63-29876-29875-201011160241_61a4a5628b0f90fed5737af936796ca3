package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1908:String;
      
      private var var_840:String;
      
      private var var_1638:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1638 = param1.readInteger();
         this.var_1908 = param1.readString();
         this.var_840 = param1.readString();
      }
      
      public function get gender() : String
      {
         return this.var_840;
      }
      
      public function get figureString() : String
      {
         return this.var_1908;
      }
      
      public function get slotId() : int
      {
         return this.var_1638;
      }
   }
}
