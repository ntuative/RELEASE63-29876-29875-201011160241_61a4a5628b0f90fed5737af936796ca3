package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_404:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_414:int = 0;
      
      public static const const_885:int = 2;
      
      public static const const_1071:int = 1;
      
      public static const const_587:Boolean = false;
      
      public static const const_752:String = "";
      
      public static const const_515:int = 0;
      
      public static const const_424:int = 0;
      
      public static const const_503:int = 0;
       
      
      private var var_2517:int = 0;
      
      private var var_1880:String = "";
      
      private var var_1634:int = 0;
      
      private var var_2516:int = 0;
      
      private var var_2515:Number = 0;
      
      private var var_2011:int = 255;
      
      private var var_2518:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return this.var_2517;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1634 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2515;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2516 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2517 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_1880;
      }
      
      public function get alpha() : int
      {
         return this.var_2011;
      }
      
      public function get ink() : int
      {
         return this.var_1634;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2515 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2516;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2518 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2518;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_1880 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2011 = param1;
      }
   }
}
