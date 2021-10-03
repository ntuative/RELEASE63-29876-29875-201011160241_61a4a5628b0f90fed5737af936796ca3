package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_148:String = "RSUBE_FIGURE";
       
      
      private var var_840:String = "";
      
      private var var_1963:int;
      
      private var var_564:String = "";
      
      private var _userId:int = 0;
      
      private var var_1749:String = "";
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:String, param6:int, param7:Boolean = false, param8:Boolean = false)
      {
         super(const_148,param1,param7,param8);
         this._userId = param2;
         this.var_564 = param3;
         this.var_840 = param4;
         this.var_1749 = param5;
         this.var_1963 = param6;
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
      
      public function get achievementScore() : int
      {
         return this.var_1963;
      }
      
      public function get customInfo() : String
      {
         return this.var_1749;
      }
   }
}
