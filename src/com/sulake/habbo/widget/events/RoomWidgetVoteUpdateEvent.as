package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_125:String = "RWPUE_VOTE_RESULT";
      
      public static const const_129:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1470:int;
      
      private var var_1008:String;
      
      private var var_948:Array;
      
      private var var_1195:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1008 = param2;
         this.var_1195 = param3;
         this.var_948 = param4;
         if(this.var_948 == null)
         {
            this.var_948 = [];
         }
         this.var_1470 = param5;
      }
      
      public function get votes() : Array
      {
         return this.var_948.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1470;
      }
      
      public function get question() : String
      {
         return this.var_1008;
      }
      
      public function get choices() : Array
      {
         return this.var_1195.slice();
      }
   }
}
