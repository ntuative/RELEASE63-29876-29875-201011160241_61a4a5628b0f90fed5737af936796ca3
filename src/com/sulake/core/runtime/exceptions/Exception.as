package com.sulake.core.runtime.exceptions
{
   public class Exception extends Error
   {
       
      
      private var var_1523:String;
      
      public function Exception(param1:String, param2:String = "")
      {
         this.var_1523 = param2;
         super(param1);
      }
      
      override public function getStackTrace() : String
      {
         return this.var_1523 != "" ? this.var_1523 : super.getStackTrace();
      }
      
      public function toString() : String
      {
         return "Exception: " + super.message;
      }
   }
}
