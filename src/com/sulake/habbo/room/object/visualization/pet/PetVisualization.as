package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IPetImageListener
   {
      
      private static const const_859:int = 2;
      
      private static const const_1194:Array = [0,0,0];
       
      
      private var var_564:String;
      
      private const const_1521:int = 1;
      
      private var var_324:String = "";
      
      private var var_1030:int = 0;
      
      private var var_910:Boolean = false;
      
      private var var_1873:int = 0;
      
      private var var_1268:String = "";
      
      private var var_1718:Boolean = false;
      
      private var var_766:Boolean;
      
      private const const_1195:int = 3;
      
      private var var_1314:String = "";
      
      private var var_52:IAvatarImage = null;
      
      private var var_1029:int = 0;
      
      private const const_1778:int = 3;
      
      private var var_1473:int = -1;
      
      private var var_1637:Boolean = false;
      
      private var var_1721:int = -1;
      
      private var var_499:int = 0;
      
      private var _updateTimes:Array;
      
      private const const_858:int = 0;
      
      private var var_1717:Boolean = false;
      
      private var var_1719:int = -1;
      
      private var var_373:ExperienceData;
      
      private var var_1636:Number = NaN;
      
      private var var_1081:Boolean = false;
      
      private var var_1313:Boolean = false;
      
      private var var_580:BitmapDataAsset;
      
      private const const_1529:int = 2;
      
      private var var_1269:int = 0;
      
      private var var_856:PetVisualizationData = null;
      
      private var var_458:Map;
      
      private var var_1635:Boolean = false;
      
      public function PetVisualization()
      {
         super();
         this._updateTimes = new Array();
         this.var_458 = new Map();
         this.var_766 = false;
      }
      
      public function imageReady() : void
      {
         this.var_1637 = true;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_316,this.var_324,this.var_1314);
         if(this.var_1268 != null && this.var_1268 != "")
         {
            param1.appendAction(AvatarAction.const_292,this.var_1268);
         }
         if(this.var_1718 || this.var_1313)
         {
            param1.appendAction(AvatarAction.const_516);
         }
         param1.endActionAppends();
         var _loc2_:int = param1.getSprites().length + this.const_1195;
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      private function validateActions() : void
      {
         var _loc1_:int = 0;
         this.var_1635 = false;
         switch(this.var_324)
         {
            case AvatarAction.const_498:
            case AvatarAction.const_1070:
            case AvatarAction.const_879:
            case AvatarAction.const_1050:
            case AvatarAction.const_951:
            case AvatarAction.const_1077:
            case AvatarAction.const_778:
            case AvatarAction.const_279:
            case AvatarAction.const_236:
               this.var_1635 = true;
         }
         this.var_1717 = false;
         this.var_1081 = false;
         if(this.var_324 == "lay")
         {
            this.var_1081 = true;
            _loc1_ = int(this.var_1314);
            if(_loc1_ < 0)
            {
               this.var_1717 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_910;
      }
      
      private function resetAvatarImages() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_458)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_458.reset();
         this.var_52 = null;
      }
      
      public function petImageReady(param1:String) : void
      {
         this.resetAvatarImages();
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_856 = param1 as PetVisualizationData;
         createSprites(this.const_1195);
         this.var_373 = new ExperienceData(this.var_856);
         return true;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(this.var_458 != null)
         {
            _loc1_ = this.var_458.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = this.var_458.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         this.var_458.dispose();
         if(this.var_373)
         {
            this.var_373.dispose();
         }
         this.var_373 = null;
         this.var_856 = null;
         this.var_910 = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1521);
         this.var_580 = null;
         _loc2_ = getSprite(this.const_1521);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 < 48)
         {
            this.var_580 = this.var_52.getAsset("sh_std_sd_1_0_0");
            _loc3_ = -8;
            _loc4_ = -3;
         }
         else
         {
            this.var_580 = this.var_52.getAsset("h_std_sd_1_0_0");
            _loc3_ = -17;
            _loc4_ = -7;
         }
         if(this.var_580)
         {
            _loc2_.asset = this.var_580.content as BitmapData;
            _loc2_.offsetX = _loc3_;
            _loc2_.offsetY = _loc4_;
            _loc2_.alpha = 50;
            _loc2_.relativeDepth = 1;
         }
         else
         {
            _loc2_.asset = null;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = this.var_458.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = this.var_856.getAvatar(this.var_564,param1,this);
            if(_loc3_ != null)
            {
               this.var_458.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_208)
         {
            this.var_1718 = param1.getNumber(RoomObjectVariableEnum.const_510) > 0;
            this.var_1268 = param1.getString(RoomObjectVariableEnum.const_291);
            this.var_324 = param1.getString(RoomObjectVariableEnum.const_442);
            this.var_1314 = param1.getString(RoomObjectVariableEnum.const_592);
            this.var_1636 = param1.getNumber(RoomObjectVariableEnum.const_341);
            this.var_1269 = param1.getNumber(RoomObjectVariableEnum.const_1053);
            this.var_1873 = param1.getNumber(RoomObjectVariableEnum.const_895);
            this.validateActions();
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_170);
            if(this.var_564 != _loc3_)
            {
               this.var_564 = _loc3_;
               this.resetAvatarImages();
            }
            var_208 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_856 == null)
         {
            return;
         }
         var _loc5_:IRoomObjectModel = _loc4_.getModel();
         if(this.var_1637)
         {
            this.var_1637 = false;
            this.var_1030 = 0;
            this.var_1029 = 1;
            this.resetAvatarImages();
         }
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = this.updateModel(_loc5_,_loc6_);
         if(_loc9_ || _loc6_ != var_246 || this.var_52 == null)
         {
            if(_loc6_ != var_246)
            {
               var_246 = _loc6_;
               _loc7_ = true;
            }
            if(_loc7_ || this.var_52 == null)
            {
               this.var_52 = this.getAvatarImage(_loc6_);
            }
            if(this.var_52 == null)
            {
               return;
            }
            if(_loc7_)
            {
               this.updateShadow(_loc6_);
            }
            _loc8_ = this.updateObject(_loc4_,param1,true);
            this.updateActions(this.var_52);
         }
         else
         {
            _loc8_ = this.updateObject(_loc4_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = this.var_766 || this.var_1029 > 0 || this.var_1635;
         this.var_373.alpha = 0;
         if(this.var_1269 > 0)
         {
            _loc12_ = param2 - this.var_1269;
            if(_loc12_ < AvatarAction.const_881)
            {
               this.var_373.alpha = int(Math.sin(_loc12_ / 0 * 0) * 255);
               this.var_373.setExperience(this.var_1873);
               this.var_1029 = this.const_1778;
            }
            else
            {
               this.var_1269 = 0;
            }
            _loc13_ = getSprite(this.const_1529);
            if(_loc13_ != null)
            {
               if(this.var_373.alpha > 0)
               {
                  _loc13_.asset = this.var_373.image;
                  _loc13_.offsetX = -20;
                  _loc13_.offsetY = -80;
                  _loc13_.alpha = this.var_373.alpha;
                  _loc13_.visible = true;
               }
               else
               {
                  _loc13_.asset = null;
                  _loc13_.visible = false;
               }
            }
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --this.var_1029;
            ++this.var_499;
            --this.var_1030;
            if(!(this.var_1030 <= 0 || _loc7_))
            {
               return;
            }
            this.var_52.updateAnimationByFrames(1);
            this.var_1030 = const_859;
            this.var_766 = this.var_52.isAnimating();
            _loc14_ = this.var_52.getCanvasOffsets();
            if(_loc14_ == null || _loc14_.length < 3)
            {
               _loc14_ = const_1194;
            }
            _loc15_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc15_ = Math.min(_loc6_ / 2.75,0);
            }
            _loc13_ = getSprite(this.const_858);
            if(_loc13_)
            {
               _loc18_ = this.var_52.getImage(AvatarSetType.const_32,false);
               if(_loc18_ != null)
               {
                  _loc13_.asset = _loc18_;
               }
               if(_loc6_ < 48)
               {
                  _loc13_.offsetX = -16 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 8 + _loc14_[1] + _loc15_;
               }
               else
               {
                  _loc13_.offsetX = -32 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 16 + _loc14_[1] + _loc15_;
               }
            }
            _loc16_ = this.const_1195;
            for each(_loc17_ in this.var_52.getSprites())
            {
               _loc13_ = getSprite(_loc16_);
               if(_loc13_ != null)
               {
                  _loc19_ = this.var_52.getLayerData(_loc17_);
                  _loc20_ = 0;
                  _loc21_ = _loc17_.getDirectionOffsetX(this.var_52.getDirection());
                  _loc22_ = _loc17_.getDirectionOffsetY(this.var_52.getDirection());
                  _loc23_ = _loc17_.getDirectionOffsetZ(this.var_52.getDirection());
                  _loc24_ = 0;
                  if(_loc17_.hasDirections)
                  {
                     _loc24_ = this.var_52.getDirection();
                  }
                  if(_loc19_ != null)
                  {
                     _loc20_ = _loc19_.animationFrame;
                     _loc21_ += _loc19_.dx;
                     _loc22_ += _loc19_.dy;
                     _loc24_ += _loc19_.directionOffset;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc21_ /= 2;
                     _loc22_ /= 2;
                  }
                  if(_loc24_ < 0)
                  {
                     _loc24_ += 8;
                  }
                  if(_loc24_ > 7)
                  {
                     _loc24_ -= 8;
                  }
                  _loc25_ = this.var_52.getScale() + "_" + _loc17_.member + "_" + _loc24_ + "_" + _loc20_;
                  _loc26_ = this.var_52.getAsset(_loc25_);
                  if(_loc26_ != null)
                  {
                     _loc13_.asset = _loc26_.content as BitmapData;
                     _loc13_.offsetX = -1 * _loc26_.offset.x - _loc6_ / 2 + _loc21_;
                     _loc13_.offsetY = -1 * _loc26_.offset.y + _loc22_;
                     _loc13_.relativeDepth = -0.01 - 0.1 * _loc16_ * _loc23_;
                     if(_loc17_.ink == 33)
                     {
                        _loc13_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc13_.blendMode = BlendMode.NORMAL;
                     }
                     _loc16_++;
                  }
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_396 != param1.getUpdateID() || this.var_1473 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = this.var_1636;
            if(isNaN(this.var_1636))
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
               _loc5_ = (_loc5_ % 360 + 360) % 360;
            }
            if(_loc4_ != this.var_1721 || param3)
            {
               this.var_1721 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               this.var_52.setDirectionAngle(AvatarSetType.const_32,_loc4_);
            }
            if(_loc5_ != this.var_1719 || param3)
            {
               this.var_1719 = _loc5_;
               _loc5_ -= 112.5;
               _loc5_ = (_loc5_ + 360) % 360;
               this.var_52.setDirectionAngle(AvatarSetType.const_42,_loc5_);
            }
            var_396 = param1.getUpdateID();
            this.var_1473 = param2.updateId;
            return true;
         }
         return false;
      }
   }
}
