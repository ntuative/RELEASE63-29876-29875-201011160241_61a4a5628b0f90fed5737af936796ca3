package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureScoreBoardVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1190:String = "ones_sprite";
      
      private static const const_1193:String = "tens_sprite";
      
      private static const const_1191:String = "hundreds_sprite";
      
      private static const const_1192:String = "thousands_sprite";
       
      
      public function FurnitureScoreBoardVisualization()
      {
         super();
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:String = getSpriteTag(param1,_direction,param2);
         var _loc4_:int = super.animationId;
         switch(_loc3_)
         {
            case const_1190:
               return _loc4_ % 10;
            case const_1193:
               return _loc4_ / 10 % 10;
            case const_1191:
               return _loc4_ / 100 % 10;
            case const_1192:
               return _loc4_ / 1000 % 10;
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
