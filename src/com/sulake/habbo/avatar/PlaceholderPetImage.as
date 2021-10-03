package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class PlaceholderPetImage extends PetImage
   {
       
      
      private var _assets:IAssetLibrary;
      
      private var var_587:Map;
      
      private var var_37:BitmapData;
      
      public function PlaceholderPetImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:String, param4:String, param5:IAssetLibrary)
      {
         super(param1,param2,param3,param4);
         this._assets = param5;
         this.var_587 = new Map();
         var _loc6_:AvatarCanvas = _structure.getCanvas(_scale,var_244.definition.geometryType);
         if(_loc6_)
         {
            this.var_37 = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         }
      }
      
      override public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         if(var_910)
         {
            return null;
         }
         var _loc3_:BitmapData = this.getPlaceHolderImage(var_81,_scale);
         if(!_loc3_ || !this.var_37)
         {
            return null;
         }
         this.var_37.fillRect(this.var_37.rect,16777215);
         this.var_37.copyPixels(_loc3_,_loc3_.rect,new Point((this.var_37.width - _loc3_.width) / 2,this.var_37.height - _loc3_.height),null,null,true);
         if(param2)
         {
            return this.var_37.clone();
         }
         return this.var_37;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
      
      override public function getCroppedImage(param1:String) : BitmapData
      {
         if(var_910)
         {
            return null;
         }
         var _loc2_:BitmapData = this.getPlaceHolderImage(var_81,_scale);
         if(!_loc2_)
         {
            return null;
         }
         return _loc2_.clone();
      }
      
      private function getPlaceHolderImage(param1:int, param2:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc3_:String = "pet_placeholder_";
         if(param2 == AvatarScaleType.SMALL)
         {
            var _loc6_:* = _loc3_ + "s";
            _loc3_ += "s";
            _loc6_;
         }
         _loc6_ = _loc3_ + param1.toString();
         _loc3_ += param1.toString();
         _loc6_;
         _loc6_ = _loc3_ + "_png";
         _loc3_ += "_png";
         _loc6_;
         var _loc4_:BitmapData = this.var_587.getValue(_loc3_);
         if(!_loc4_)
         {
            _loc5_ = this._assets.getAssetByName(_loc3_) as BitmapDataAsset;
            _loc6_ = _loc5_.content as BitmapData;
            _loc4_ = _loc5_.content as BitmapData;
            _loc6_;
            this.var_587.add(_loc3_,_loc4_.clone());
            _loc4_ = this.var_587.getValue(_loc3_);
         }
         return _loc4_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_587)
         {
            for each(_loc1_ in this.var_587)
            {
            }
            this.var_587.dispose();
            var _loc2_:* = null;
            this.var_587 = null;
            _loc2_;
         }
         if(this.var_37)
         {
            _loc2_ = null;
            this.var_37 = null;
            _loc2_;
         }
         _loc2_ = null;
         this._assets = null;
         _loc2_;
         super.dispose();
      }
   }
}
