package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2193:int;
      
      private var var_2195:int = 0;
      
      private var var_2194:String;
      
      private var var_2197:int;
      
      private var var_2196:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2193 = param1;
         this.var_2197 = param2;
         this.var_2196 = param3;
         this.var_2194 = param4;
      }
      
      public function get length() : int
      {
         return this.var_2197;
      }
      
      public function get name() : String
      {
         return this.var_2196;
      }
      
      public function get creator() : String
      {
         return this.var_2194;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_2195;
      }
      
      public function get id() : int
      {
         return this.var_2193;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_2195 = param1;
      }
   }
}
