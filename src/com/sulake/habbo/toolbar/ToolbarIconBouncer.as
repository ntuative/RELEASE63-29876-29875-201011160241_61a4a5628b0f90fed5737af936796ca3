package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2289:Number;
      
      private var var_826:Number = 0;
      
      private var var_2288:Number;
      
      private var var_825:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2289 = param1;
         this.var_2288 = param2;
      }
      
      public function update() : void
      {
         this.var_825 += this.var_2288;
         this.var_826 += this.var_825;
         if(this.var_826 > 0)
         {
            this.var_826 = 0;
            this.var_825 = this.var_2289 * -1 * this.var_825;
         }
      }
      
      public function reset(param1:int) : void
      {
         this.var_825 = param1;
         this.var_826 = 0;
      }
      
      public function get location() : Number
      {
         return this.var_826;
      }
   }
}
