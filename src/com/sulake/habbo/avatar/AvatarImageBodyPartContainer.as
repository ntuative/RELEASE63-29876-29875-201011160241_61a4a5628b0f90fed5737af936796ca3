package com.sulake.habbo.avatar
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AvatarImageBodyPartContainer
   {
       
      
      private var var_508:Point;
      
      private var var_37:BitmapData;
      
      private var _offset:Point;
      
      public function AvatarImageBodyPartContainer(param1:BitmapData, param2:Point)
      {
         this._offset = new Point(0,0);
         super();
         this.var_37 = param1;
         this.var_508 = param2;
         this.cleanPoints();
      }
      
      public function set offset(param1:Point) : void
      {
         this._offset = param1;
         this.cleanPoints();
      }
      
      private function cleanPoints() : void
      {
         this.var_508.x = int(this.var_508.x);
         this.var_508.y = int(this.var_508.y);
         this._offset.x = int(this._offset.x);
         this._offset.y = int(this._offset.y);
      }
      
      public function get image() : BitmapData
      {
         return this.var_37;
      }
      
      public function get regPoint() : Point
      {
         return this.var_508.add(this._offset);
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_37 = param1;
      }
      
      public function setRegPoint(param1:Point) : void
      {
         this.var_508 = param1;
         this.cleanPoints();
      }
      
      public function dispose() : void
      {
         if(this.var_37)
         {
            this.var_37.dispose();
         }
         this.var_37 = null;
         this.var_508 = null;
         this._offset = null;
      }
   }
}
