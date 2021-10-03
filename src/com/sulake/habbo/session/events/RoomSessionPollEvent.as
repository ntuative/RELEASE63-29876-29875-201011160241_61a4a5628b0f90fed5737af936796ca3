package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_127:String = "RSPE_POLL_CONTENT";
      
      public static const const_134:String = "RSPE_POLL_OFFER";
      
      public static const const_69:String = "RSPE_POLL_ERROR";
       
      
      private var var_1275:Array = null;
      
      private var var_1646:String = "";
      
      private var var_1737:String;
      
      private var var_1647:String = "";
      
      private var var_1274:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         this._id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return this.var_1275;
      }
      
      public function get startMessage() : String
      {
         return this.var_1646;
      }
      
      public function get summary() : String
      {
         return this.var_1737;
      }
      
      public function set startMessage(param1:String) : void
      {
         this.var_1646 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         this.var_1274 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         this.var_1737 = param1;
      }
      
      public function get numQuestions() : int
      {
         return this.var_1274;
      }
      
      public function set endMessage(param1:String) : void
      {
         this.var_1647 = param1;
      }
      
      public function get endMessage() : String
      {
         return this.var_1647;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         this.var_1275 = param1;
      }
   }
}
