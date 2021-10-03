package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_642:uint;
      
      private var var_108:IUnknown;
      
      private var var_1556:String;
      
      private var var_1227:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1227 = param1;
         this.var_1556 = getQualifiedClassName(this.var_1227);
         this.var_108 = param2;
         this.var_642 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1227;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_108 == null;
      }
      
      public function get references() : uint
      {
         return this.var_642;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_642) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_108;
      }
      
      public function get iis() : String
      {
         return this.var_1556;
      }
      
      public function reserve() : uint
      {
         return ++this.var_642;
      }
      
      public function dispose() : void
      {
         this.var_1227 = null;
         this.var_1556 = null;
         this.var_108 = null;
         this.var_642 = 0;
      }
   }
}
