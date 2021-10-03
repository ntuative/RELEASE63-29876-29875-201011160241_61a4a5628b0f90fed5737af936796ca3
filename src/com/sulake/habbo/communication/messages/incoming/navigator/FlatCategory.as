package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_333:Boolean;
      
      private var var_1617:int;
      
      private var var_2417:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1617 = param1.readInteger();
         this.var_2417 = param1.readString();
         this.var_333 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return this.var_333;
      }
      
      public function get nodeName() : String
      {
         return this.var_2417;
      }
      
      public function get nodeId() : int
      {
         return this.var_1617;
      }
   }
}
