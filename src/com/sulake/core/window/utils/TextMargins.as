package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_939:int;
      
      private var _right:int;
      
      private var var_941:int;
      
      private var var_940:int;
      
      private var var_248:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         this.var_941 = param1;
         this.var_940 = param2;
         this._right = param3;
         this.var_939 = param4;
         this.var_248 = param5 != null ? param5 : this.nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         this.var_939 = param1;
         this.var_248(this);
      }
      
      public function get left() : int
      {
         return this.var_941;
      }
      
      public function get isZeroes() : Boolean
      {
         return this.var_941 == 0 && this._right == 0 && this.var_940 == 0 && this.var_939 == 0;
      }
      
      public function get right() : int
      {
         return this._right;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function set top(param1:int) : void
      {
         this.var_940 = param1;
         this.var_248(this);
      }
      
      public function get top() : int
      {
         return this.var_940;
      }
      
      public function set left(param1:int) : void
      {
         this.var_941 = param1;
         this.var_248(this);
      }
      
      public function get bottom() : int
      {
         return this.var_939;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(this.var_941,this.var_940,this._right,this.var_939,param1);
      }
      
      public function dispose() : void
      {
         this.var_248 = null;
         this._disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         this._right = param1;
         this.var_248(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
