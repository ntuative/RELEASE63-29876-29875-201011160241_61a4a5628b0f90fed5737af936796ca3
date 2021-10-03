package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = -1;
      
      private static const const_813:int = 20;
      
      private static const const_543:int = 9;
       
      
      private var var_640:Boolean = false;
      
      private var var_267:Array;
      
      public function FurnitureBottleVisualization()
      {
         this.var_267 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_640)
            {
               this.var_640 = true;
               this.var_267 = new Array();
               this.var_267.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_640)
            {
               this.var_640 = false;
               this.var_267 = new Array();
               this.var_267.push(const_813);
               this.var_267.push(const_543 + param1);
               this.var_267.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(0))
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
