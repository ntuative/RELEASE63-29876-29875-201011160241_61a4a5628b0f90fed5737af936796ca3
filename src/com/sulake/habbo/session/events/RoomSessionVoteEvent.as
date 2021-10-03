package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_125:String = "RSPE_VOTE_RESULT";
      
      public static const const_129:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1470:int = 0;
      
      private var var_1008:String = "";
      
      private var var_948:Array;
      
      private var var_1195:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1195 = [];
         this.var_948 = [];
         super(param1,param2,param7,param8);
         this.var_1008 = param3;
         this.var_1195 = param4;
         this.var_948 = param5;
         if(this.var_948 == null)
         {
            this.var_948 = [];
         }
         this.var_1470 = param6;
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
