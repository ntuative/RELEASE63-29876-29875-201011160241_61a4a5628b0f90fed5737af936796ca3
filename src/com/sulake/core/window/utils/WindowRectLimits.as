package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_435:int = -2.147483648E9;
      
      private var var_433:int = 2.147483647E9;
      
      private var var_432:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      private var var_434:int = -2.147483648E9;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get maxWidth() : int
      {
         return this.var_433;
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_434 == int.MIN_VALUE && this.var_433 == int.MAX_VALUE && this.var_435 == int.MIN_VALUE && this.var_432 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_433 = param1;
         if(this.var_433 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_433)
         {
            this._target.width = this.var_433;
         }
      }
      
      public function setEmpty() : void
      {
         this.var_434 = int.MIN_VALUE;
         this.var_433 = int.MAX_VALUE;
         this.var_435 = int.MIN_VALUE;
         this.var_432 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_432 = param1;
         if(this.var_432 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_432)
         {
            this._target.height = this.var_432;
         }
      }
      
      public function get minHeight() : int
      {
         return this.var_435;
      }
      
      public function get minWidth() : int
      {
         return this.var_434;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_434 = this.var_434;
         _loc2_.var_433 = this.var_433;
         _loc2_.var_435 = this.var_435;
         _loc2_.var_432 = this.var_432;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_434 = param1;
         if(this.var_434 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_434)
         {
            this._target.width = this.var_434;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_435 = param1;
         if(this.var_435 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_435)
         {
            this._target.height = this.var_435;
         }
      }
      
      public function get maxHeight() : int
      {
         return this.var_432;
      }
   }
}
