package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2204:Number = 0.0;
      
      private var var_1972:Number = 0.0;
      
      private var var_1971:Number = 0.0;
      
      private var var_2203:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_1972 = param1;
         this.var_1971 = param2;
         this.var_2204 = param3;
         this.var_2203 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_1972;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2204;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_1971;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2203;
      }
   }
}
