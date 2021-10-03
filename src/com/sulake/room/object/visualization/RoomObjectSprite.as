package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_949:int = 0;
       
      
      private var _updateID:int = 0;
      
      private var var_2048:Boolean = false;
      
      private var var_2050:String = "normal";
      
      private var var_1452:String = "";
      
      private var _instanceId:int = 0;
      
      private var var_333:Boolean = true;
      
      private var _height:int = 0;
      
      private var var_2011:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_1340:Boolean = false;
      
      private var var_1339:Boolean = false;
      
      private var var_2047:Boolean = false;
      
      private var _offset:Point;
      
      private var var_2049:Boolean = true;
      
      private var var_1468:Array;
      
      private var var_976:Number = 0;
      
      private var _width:int = 0;
      
      private var var_1880:String = "";
      
      private var var_368:BitmapData = null;
      
      public function RoomObjectSprite()
      {
         this._offset = new Point(0,0);
         this.var_1468 = [];
         super();
         this._instanceId = var_949++;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_1468 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1339 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2047 = param1;
         ++this._updateID;
      }
      
      public function dispose() : void
      {
         this.var_368 = null;
         this._width = 0;
         this._height = 0;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_2050 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_1880 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_1452 = param1;
         ++this._updateID;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2048;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_976;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get alpha() : int
      {
         return this.var_2011;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2049 = param1;
         ++this._updateID;
      }
      
      public function get visible() : Boolean
      {
         return this.var_333;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2048 = param1;
         ++this._updateID;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1340;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1339;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2047;
      }
      
      public function get blendMode() : String
      {
         return this.var_2050;
      }
      
      public function get instanceId() : int
      {
         return this._instanceId;
      }
      
      public function get tag() : String
      {
         return this.var_1880;
      }
      
      public function get assetName() : String
      {
         return this.var_1452;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_976 = param1;
         ++this._updateID;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2049;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2011 = param1;
         ++this._updateID;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this._width = param1.width;
            this._height = param1.height;
         }
         this.var_368 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_333 = param1;
         ++this._updateID;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_368;
      }
      
      public function get filters() : Array
      {
         return this.var_1468;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1340 = param1;
         ++this._updateID;
      }
   }
}
