package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.visualization.furniture.data.AnimationData;
   import com.sulake.habbo.room.object.visualization.furniture.data.AnimationFrame;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   
   public class AnimatedFurnitureVisualization extends FurnitureVisualization
   {
       
      
      private var var_992:int = 0;
      
      private var var_1569:int = 0;
      
      private var var_442:AnimatedFurnitureVisualizationData = null;
      
      private var _state:int = -1;
      
      private var var_1568:Number = 0;
      
      private var var_1769:int = 0;
      
      private var _lastFramePlayed:Array;
      
      private var var_621:int = 0;
      
      private var var_220:Array;
      
      private var var_802:Boolean = false;
      
      public function AnimatedFurnitureVisualization()
      {
         this.var_220 = [];
         this._lastFramePlayed = [];
         super();
      }
      
      private function updateAnimationFrames(param1:Number) : Array
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(this.var_802)
         {
            return null;
         }
         if(this.var_621 == 0)
         {
            this.var_621 = this.var_442.getStartFrame(this.animationId,param1);
         }
         this.var_621 += 1;
         var _loc3_:* = null;
         this.var_802 = true;
         var _loc4_:int = this.var_1769 - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = null;
            if(_loc4_ < this.var_220.length)
            {
               _loc5_ = this.var_220[_loc4_] as AnimationFrame;
            }
            this._lastFramePlayed[_loc4_] = false;
            if(_loc5_ != null)
            {
               if(_loc5_.isLastFrame && _loc5_.remainingFrameRepeats <= 1)
               {
                  this._lastFramePlayed[_loc4_] = true;
               }
            }
            if(_loc5_ == null || _loc5_.remainingFrameRepeats >= 0 && _loc7_ <= 0)
            {
               _loc6_ = 0;
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.activeSequence;
               }
               if(_loc6_ == AnimationFrame.const_1090)
               {
                  _loc5_ = this.var_442.getFrame(_loc4_,this.animationId,this.var_621,param1);
               }
               else
               {
                  _loc5_ = this.var_442.getFrameFromSequence(_loc4_,this.animationId,_loc6_,_loc5_.activeSequenceOffset + _loc5_.repeats,this.var_621,param1);
               }
               this.var_220[_loc4_] = _loc5_;
               if(_loc5_ != null)
               {
                  if(_loc3_ != null)
                  {
                     _loc3_.push(_loc4_);
                  }
                  else
                  {
                     _loc3_ = [_loc4_];
                  }
               }
            }
            if(_loc5_ == null || _loc5_.isLastFrame && _loc5_.remainingFrameRepeats <= 0)
            {
               this._lastFramePlayed[_loc4_] = true;
            }
            else if(_loc5_.remainingFrameRepeats >= 0)
            {
               this.var_802 = false;
            }
            _loc4_--;
         }
         return _loc3_;
      }
      
      protected function setAnimation(param1:int) : void
      {
         if(this.var_442 != null && this._state >= 0)
         {
            if(this.var_442.hasAnimation(AnimationData.getTransitionAnimationId(param1),this.var_1568))
            {
               if(this.var_992 != AnimationData.getTransitionAnimationId(param1))
               {
                  param1 = AnimationData.getTransitionAnimationId(param1);
               }
            }
         }
         this.var_992 = param1;
         this.var_621 = 0;
         this.var_220 = [];
         this._lastFramePlayed = [];
         this.var_802 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         if(!(param1 is AnimatedFurnitureVisualizationData))
         {
            return false;
         }
         this.var_442 = param1 as AnimatedFurnitureVisualizationData;
         return super.initialize(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_442 = null;
         this.var_220 = null;
         this._lastFramePlayed = null;
      }
      
      override protected function updateModel(param1:Number) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(super.updateModel(param1))
         {
            _loc2_ = object;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.getModel();
               if(_loc3_ != null)
               {
                  _loc4_ = _loc3_.getNumber(RoomObjectVariableEnum.const_677);
                  if(_loc4_ > this.var_1569)
                  {
                     this.var_1569 = _loc4_;
                     this.setAnimation(this._state);
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:* = null;
         if(param1 >= 0 && param1 < this.var_220.length)
         {
            _loc3_ = this.var_220[param1] as AnimationFrame;
            if(_loc3_ != null)
            {
               return _loc3_.id;
            }
         }
         return super.getFrameNumber(param1,param2);
      }
      
      override protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(super.updateObject(param1,param2))
         {
            _loc3_ = object;
            if(_loc3_ == null)
            {
               return false;
            }
            _loc4_ = _loc3_.getState(0);
            if(_loc4_ != this._state)
            {
               this.setAnimation(_loc4_);
               this._state = _loc4_;
               _loc5_ = _loc3_.getModel();
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.getNumber(RoomObjectVariableEnum.const_677);
                  this.var_1569 = _loc6_;
               }
            }
            return true;
         }
         return false;
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:* = null;
         var _loc4_:int = super.getSpriteYOffset(param1,param2,param3);
         if(param1 >= 0 && param1 < this.var_220.length)
         {
            _loc5_ = this.var_220[param1] as AnimationFrame;
            if(_loc5_ != null)
            {
               _loc4_ += _loc5_.y;
            }
         }
         return _loc4_;
      }
      
      protected function getLastFramePlayed(param1:int) : Boolean
      {
         if(param1 < 0 || param1 >= this._lastFramePlayed.length)
         {
            return false;
         }
         return this._lastFramePlayed[param1];
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:* = null;
         var _loc4_:int = super.getSpriteXOffset(param1,param2,param3);
         if(param1 >= 0 && param1 < this.var_220.length)
         {
            _loc5_ = this.var_220[param1] as AnimationFrame;
            if(_loc5_ != null)
            {
               _loc4_ += _loc5_.x;
            }
         }
         return _loc4_;
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_442 == null)
         {
            return null;
         }
         if(param1 != this.var_1568)
         {
            this.var_220 = [];
            this._lastFramePlayed = [];
            this.var_802 = false;
            this.var_1769 = this.var_442.getLayerCount(param1);
         }
         var _loc2_:Array = this.updateAnimationFrames(param1);
         if(this.var_802 && _loc2_ != null && AnimationData.isTransitionAnimation(this.var_992))
         {
            this.setAnimation(AnimationData.getAnimationId(this.var_992));
            _loc2_ = this.updateAnimationFrames(param1);
         }
         this.var_1568 = param1;
         return _loc2_;
      }
      
      public function get animationId() : int
      {
         return this.var_992;
      }
   }
}
