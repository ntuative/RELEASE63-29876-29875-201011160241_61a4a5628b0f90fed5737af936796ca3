package com.sulake.habbo.avatar.animation
{
   import com.sulake.core.utils.Map;
   import flash.geom.ColorTransform;
   
   public class AvatarDataContainer implements IAvatarDataContainer
   {
       
      
      private var _alphaMultiplier:Number = 1.0;
      
      private var var_2321:uint;
      
      private var _rgb:uint;
      
      private var var_1027:Map;
      
      private var var_1491:Number = 1.0;
      
      private var _b:uint;
      
      private var var_1490:Number = 1.0;
      
      private var var_1634:int;
      
      private var var_1771:ColorTransform;
      
      private var var_2320:uint;
      
      private var var_1492:uint;
      
      private var var_1493:Number = 1.0;
      
      private var var_2319:Boolean = true;
      
      private var var_1494:uint;
      
      public function AvatarDataContainer(param1:XML)
      {
         super();
         this.var_1634 = parseInt(param1.@ink);
         var _loc2_:String = String(param1.@foreground);
         _loc2_ = _loc2_.replace("#","");
         var _loc3_:String = String(param1.@background);
         _loc3_ = _loc3_.replace("#","");
         this.var_2321 = parseInt(_loc2_,16);
         this.var_2320 = parseInt(_loc3_,16);
         this._rgb = parseInt(_loc2_,16);
         this.var_1494 = this._rgb >> 16 & 255;
         this.var_1492 = this._rgb >> 8 & 255;
         this._b = this._rgb >> 0 & 255;
         this.var_1493 = this.var_1494 / 255 * 1;
         this.var_1490 = this.var_1492 / 255 * 1;
         this.var_1491 = this._b / 255 * 1;
         if(this.var_1634 == 37)
         {
            this._alphaMultiplier = 0.5;
            this.var_2319 = false;
         }
         this.var_1771 = new ColorTransform(this.var_1493,this.var_1490,this.var_1491,this._alphaMultiplier);
         this.var_1027 = this.generatePaletteMapForGrayscale(this.var_2320,this.var_2321);
      }
      
      public function get reds() : Array
      {
         return this.var_1027.getValue("reds") as Array;
      }
      
      private function generatePaletteMapForGrayscale(param1:uint, param2:uint) : Map
      {
         var _loc3_:* = param1 >> 24 & 255;
         var _loc4_:* = param1 >> 16 & 255;
         var _loc5_:* = param1 >> 8 & 255;
         var _loc6_:* = param1 >> 0 & 255;
         var _loc7_:* = param2 >> 24 & 255;
         var _loc8_:* = param2 >> 16 & 255;
         var _loc9_:* = param2 >> 8 & 255;
         var _loc10_:* = param2 >> 0 & 255;
         var _loc11_:Number = (_loc7_ - _loc3_) / 255;
         var _loc12_:Number = (_loc8_ - _loc4_) / 255;
         var _loc13_:Number = (_loc9_ - _loc5_) / 255;
         var _loc14_:Number = (_loc10_ - _loc6_) / 255;
         var _loc15_:Map = new Map();
         var _loc16_:* = [];
         var _loc17_:* = [];
         var _loc18_:* = [];
         var _loc19_:* = [];
         var _loc20_:* = Number(_loc3_);
         var _loc21_:Number = _loc4_;
         var _loc22_:Number = _loc5_;
         var _loc23_:Number = _loc6_;
         var _loc24_:int = 0;
         while(_loc24_ < 256)
         {
            if(_loc21_ == _loc4_ && _loc22_ == _loc5_ && _loc23_ == _loc6_)
            {
               _loc20_ = 0;
            }
            _loc20_ += _loc11_;
            _loc21_ += _loc12_;
            _loc22_ += _loc13_;
            _loc23_ += _loc14_;
            _loc19_.push(_loc20_ << 24);
            _loc16_.push(_loc20_ << 24 | _loc21_ << 16 | _loc22_ << 8 | _loc23_);
            _loc17_.push(_loc20_ << 24 | _loc21_ << 16 | _loc22_ << 8 | _loc23_);
            _loc18_.push(_loc20_ << 24 | _loc21_ << 16 | _loc22_ << 8 | _loc23_);
            _loc24_++;
         }
         _loc15_.add("alphas",_loc16_);
         _loc15_.add("reds",_loc16_);
         _loc15_.add("greens",_loc17_);
         _loc15_.add("blues",_loc18_);
         return _loc15_;
      }
      
      public function get blues() : Array
      {
         return this.var_1027.getValue("blues") as Array;
      }
      
      public function get greens() : Array
      {
         return this.var_1027.getValue("greens") as Array;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_1771;
      }
      
      public function get alphas() : Array
      {
         return this.var_1027.getValue("alphas") as Array;
      }
      
      public function get paletteIsGrayscale() : Boolean
      {
         return this.var_2319;
      }
      
      public function get ink() : int
      {
         return this.var_1634;
      }
   }
}
