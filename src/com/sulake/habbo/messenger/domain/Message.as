package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_675:int = 2;
      
      public static const const_1014:int = 6;
      
      public static const const_666:int = 1;
      
      public static const const_570:int = 3;
      
      public static const const_981:int = 4;
      
      public static const const_714:int = 5;
       
      
      private var var_2184:String;
      
      private var var_1011:int;
      
      private var var_2109:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1011 = param2;
         this.var_2109 = param3;
         this.var_2184 = param4;
      }
      
      public function get time() : String
      {
         return this.var_2184;
      }
      
      public function get senderId() : int
      {
         return this.var_1011;
      }
      
      public function get messageText() : String
      {
         return this.var_2109;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
