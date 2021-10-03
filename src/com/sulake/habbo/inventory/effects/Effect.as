package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1862:Date;
      
      private var var_1395:Boolean = false;
      
      private var _type:int;
      
      private var var_599:BitmapData;
      
      private var var_388:Boolean = false;
      
      private var var_1394:int;
      
      private var var_743:int = 1;
      
      private var var_1154:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return this.var_599;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --this.var_743;
         if(this.var_743 < 0)
         {
            this.var_743 = 0;
         }
         this.var_1154 = this.var_1394;
         this.var_388 = false;
         this.var_1395 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         this.var_1154 = param1;
      }
      
      public function get method_1() : Boolean
      {
         return this.var_388;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_599 = param1;
      }
      
      public function get duration() : int
      {
         return this.var_1394;
      }
      
      public function get isInUse() : Boolean
      {
         return this.var_1395;
      }
      
      public function get effectsInInventory() : int
      {
         return this.var_743;
      }
      
      public function get iconImage() : BitmapData
      {
         return this.var_599;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function set method_1(param1:Boolean) : void
      {
         if(param1 && !this.var_388)
         {
            this.var_1862 = new Date();
         }
         this.var_388 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         this.var_743 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(this.var_388)
         {
            _loc1_ = this.var_1154 - (new Date().valueOf() - this.var_1862.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return this.var_1154;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         this.var_1395 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         this.var_1394 = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
