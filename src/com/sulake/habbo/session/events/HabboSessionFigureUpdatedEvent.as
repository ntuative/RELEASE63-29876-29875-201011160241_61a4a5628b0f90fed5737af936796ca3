package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class HabboSessionFigureUpdatedEvent extends Event
   {
      
      public static const const_742:String = "HABBO_SESSION_FIGURE_UPDATE";
       
      
      private var var_840:String;
      
      private var var_564:String;
      
      private var _userId:int;
      
      public function HabboSessionFigureUpdatedEvent(param1:int, param2:String, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_742,param4,param5);
         this._userId = param1;
         this.var_564 = param2;
         this.var_840 = param3;
      }
      
      public function get gender() : String
      {
         return this.var_840;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
