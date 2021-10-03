package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureCounterClockVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1180:String = "seconds_sprite";
      
      private static const const_1182:String = "ten_minutes_sprite";
      
      private static const const_1181:String = "ten_seconds_sprite";
      
      private static const const_1179:String = "minutes_sprite";
       
      
      public function FurnitureCounterClockVisualization()
      {
         super();
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:String = getSpriteTag(param1,_direction,param2);
         var _loc4_:int = super.animationId;
         switch(_loc3_)
         {
            case const_1180:
               return _loc4_ % 60 % 10;
            case const_1181:
               return _loc4_ % 60 / 10;
            case const_1179:
               return _loc4_ / 60 % 10;
            case const_1182:
               return _loc4_ / 60 / 10 % 10;
            default:
               return super.getFrameNumber(param1,param2);
         }
      }
      
      override public function get animationId() : int
      {
         return 0;
      }
   }
}
