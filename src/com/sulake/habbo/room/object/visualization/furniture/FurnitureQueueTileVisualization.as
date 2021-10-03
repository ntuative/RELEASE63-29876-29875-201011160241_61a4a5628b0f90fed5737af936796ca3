package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1107:int = 1;
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1108:int = 2;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_918:int;
      
      private var var_267:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_267 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1108)
         {
            this.var_267 = new Array();
            this.var_267.push(const_1107);
            this.var_918 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_918 > 0)
         {
            --this.var_918;
         }
         if(this.var_918 == 0)
         {
            if(this.var_267.length > 0)
            {
               super.setAnimation(this.var_267.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
