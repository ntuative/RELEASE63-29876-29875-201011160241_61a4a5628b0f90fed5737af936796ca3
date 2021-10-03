package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class ExperienceData
   {
       
      
      private var var_37:BitmapData;
      
      private var var_2011:int;
      
      private var var_368:BitmapDataAsset;
      
      private var var_2525:int;
      
      public function ExperienceData(param1:PetVisualizationData)
      {
         super();
         this.var_368 = param1.getAvatarRendererAsset("pet_experience_bubble_png") as BitmapDataAsset;
      }
      
      public function get alpha() : int
      {
         return this.var_2011;
      }
      
      public function setExperience(param1:int) : void
      {
         if(this.var_2525 == param1)
         {
            return;
         }
         if(this.var_37)
         {
            this.var_37.dispose();
         }
         this.var_37 = (this.var_368.content as BitmapData).clone();
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.font = "Volter";
         _loc2_.color = 16777215;
         _loc2_.size = 9;
         var _loc3_:TextField = new TextField();
         _loc3_.embedFonts = true;
         _loc3_.width = 30;
         _loc3_.height = 12;
         _loc3_.background = true;
         _loc3_.backgroundColor = 3871388928;
         _loc3_.defaultTextFormat = _loc2_;
         _loc3_.text = "+" + param1;
         var _loc4_:Matrix = new Matrix();
         _loc4_.translate(15,19);
         this.var_37.draw(_loc3_,_loc4_);
      }
      
      public function get image() : BitmapData
      {
         if(!this.var_37)
         {
            this.setExperience(0);
         }
         return this.var_37;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2011 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_37)
         {
            this.var_37.dispose();
         }
         this.var_37 = null;
         this.var_368 = null;
      }
   }
}
