package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_1864:String;
      
      private var var_1399:int = -1;
      
      private var var_1400:Boolean;
      
      private var var_1401:String;
      
      private var var_1863:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_1863 = String(param1["set-type"]);
         this.var_1401 = String(param1["flipped-set-type"]);
         this.var_1864 = String(param1["remove-set-type"]);
         this.var_1400 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1399 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1401;
      }
      
      public function get staticId() : int
      {
         return this.var_1399;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1399 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1400;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1400 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1401 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_1863;
      }
      
      public function get removeSetType() : String
      {
         return this.var_1864;
      }
   }
}
