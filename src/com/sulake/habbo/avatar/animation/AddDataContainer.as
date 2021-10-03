package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1549:String;
      
      private var var_1634:String;
      
      private var var_1031:String;
      
      private var var_689:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         this._id = String(param1.@id);
         this.var_1549 = String(param1.@align);
         this.var_1031 = String(param1.@base);
         this.var_1634 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            this.var_689 = Number(_loc2_);
            if(this.var_689 > 1)
            {
               this.var_689 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return this.var_1549;
      }
      
      public function get ink() : String
      {
         return this.var_1634;
      }
      
      public function get base() : String
      {
         return this.var_1031;
      }
      
      public function get isBlended() : Boolean
      {
         return this.var_689 != 1;
      }
      
      public function get blend() : Number
      {
         return this.var_689;
      }
      
      public function get id() : String
      {
         return this._id;
      }
   }
}
