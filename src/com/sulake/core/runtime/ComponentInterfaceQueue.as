package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1715:IID;
      
      private var var_910:Boolean;
      
      private var var_1080:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1715 = param1;
         this.var_1080 = new Array();
         this.var_910 = false;
      }
      
      public function get receivers() : Array
      {
         return this.var_1080;
      }
      
      public function get identifier() : IID
      {
         return this.var_1715;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_910;
      }
      
      public function dispose() : void
      {
         if(!this.var_910)
         {
            this.var_910 = true;
            this.var_1715 = null;
            while(this.var_1080.length > 0)
            {
               this.var_1080.pop();
            }
            this.var_1080 = null;
         }
      }
   }
}
