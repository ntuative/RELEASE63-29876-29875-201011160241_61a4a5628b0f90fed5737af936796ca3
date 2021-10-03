package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1944:String = "";
      
      private var var_288:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         this.var_1944 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         this.var_288 = param1;
      }
      
      public function get spriteTag() : String
      {
         return this.var_1944;
      }
      
      public function get objectId() : String
      {
         return this.var_288;
      }
   }
}
