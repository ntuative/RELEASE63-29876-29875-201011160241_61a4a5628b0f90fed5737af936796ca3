package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1365:int;
      
      private var var_1366:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return this.var_1365;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1365 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1365 = this.var_1365;
         _loc1_.var_1366 = this.var_1366;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1366 = param1;
      }
      
      public function get imgId() : int
      {
         return this.var_1366;
      }
   }
}
