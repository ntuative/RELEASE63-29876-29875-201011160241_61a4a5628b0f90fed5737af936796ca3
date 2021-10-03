package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1339:Boolean;
      
      private var _name:String;
      
      private var var_2014:String;
      
      private var var_1340:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         this._name = String(param1.@name);
         this.var_2014 = String(param1.@link);
         this.var_1340 = Boolean(parseInt(param1.@fliph));
         this.var_1339 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1340;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1339;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get link() : String
      {
         return this.var_2014;
      }
   }
}
