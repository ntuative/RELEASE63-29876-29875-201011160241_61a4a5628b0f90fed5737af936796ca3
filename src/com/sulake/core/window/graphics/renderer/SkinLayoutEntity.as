package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_260:uint = 1;
      
      public static const const_462:uint = 0;
      
      public static const const_888:uint = 8;
      
      public static const const_276:uint = 4;
      
      public static const const_398:uint = 2;
       
      
      private var var_689:uint;
      
      private var var_1898:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1899:uint;
      
      private var _region:Rectangle;
      
      private var var_735:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._region = param3;
         this._color = param4;
         this.var_689 = param5;
         this.var_1898 = param6;
         this.var_1899 = param7;
         this.var_735 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return this.var_1898;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get blend() : uint
      {
         return this.var_689;
      }
      
      public function get scaleV() : uint
      {
         return this.var_1899;
      }
      
      public function get tags() : Array
      {
         return this.var_735;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function dispose() : void
      {
         this._region = null;
         this.var_735 = null;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get region() : Rectangle
      {
         return this._region;
      }
   }
}
