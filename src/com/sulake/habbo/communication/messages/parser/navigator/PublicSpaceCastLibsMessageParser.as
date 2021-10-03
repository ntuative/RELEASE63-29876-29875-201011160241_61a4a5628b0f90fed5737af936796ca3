package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PublicSpaceCastLibsMessageParser implements IMessageParser
   {
       
      
      private var var_2402:int;
      
      private var var_2403:String;
      
      private var var_1617:int;
      
      public function PublicSpaceCastLibsMessageParser()
      {
         super();
      }
      
      public function get unitPort() : int
      {
         return this.var_2402;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get castLibs() : String
      {
         return this.var_2403;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1617 = param1.readInteger();
         this.var_2403 = param1.readString();
         this.var_2402 = param1.readInteger();
         return true;
      }
      
      public function get nodeId() : int
      {
         return this.var_1617;
      }
   }
}
