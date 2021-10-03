package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.utils.ChildEntityArray;
   
   public class SkinTemplate extends ChildEntityArray implements ISkinTemplate
   {
       
      
      protected var _name:String;
      
      protected var var_368:IAsset;
      
      protected var var_735:Array;
      
      public function SkinTemplate(param1:String, param2:IAsset)
      {
         super();
         this._name = param1;
         this.var_735 = new Array();
         this.var_368 = param2;
      }
      
      public function get tags() : Array
      {
         return this.var_735;
      }
      
      public function get id() : uint
      {
         return 0;
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:uint = this.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.removeChildAt(0);
            _loc2_++;
         }
         this.var_368 = null;
         this.var_735 = null;
         this._name = null;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get asset() : IAsset
      {
         return this.var_368;
      }
   }
}
