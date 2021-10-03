package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1755:int = 2;
      
      public static const const_1455:int = 4;
      
      public static const const_1277:int = 1;
      
      public static const const_1254:int = 3;
       
      
      private var var_1231:int = 0;
      
      private var var_1230:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get method_2() : int
      {
         return this.var_1231;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1231 = param1.readInteger();
         if(this.var_1231 == 3)
         {
            this.var_1230 = param1.readString();
         }
         else
         {
            this.var_1230 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1231 = 0;
         this.var_1230 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return this.var_1230;
      }
   }
}
