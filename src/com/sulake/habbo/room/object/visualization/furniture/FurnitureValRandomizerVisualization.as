package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1139:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
      
      private static const const_813:int = 20;
      
      private static const const_543:int = 10;
       
      
      private var var_640:Boolean = false;
      
      private var var_267:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_267 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_640)
            {
               this.var_640 = true;
               this.var_267 = new Array();
               this.var_267.push(const_1139);
               this.var_267.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_543)
         {
            if(this.var_640)
            {
               this.var_640 = false;
               this.var_267 = new Array();
               if(_direction == 2)
               {
                  this.var_267.push(const_813 + 5 - param1);
                  this.var_267.push(const_543 + 5 - param1);
               }
               else
               {
                  this.var_267.push(const_813 + param1);
                  this.var_267.push(const_543 + param1);
               }
               this.var_267.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
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
