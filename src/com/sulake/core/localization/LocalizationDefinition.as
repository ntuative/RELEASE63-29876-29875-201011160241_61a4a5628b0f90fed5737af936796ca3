package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1687:String;
      
      private var var_914:String;
      
      private var var_1688:String;
      
      private var var_1686:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         this.var_1686 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         this.var_1687 = _loc5_[0];
         this.var_1688 = _loc5_[1];
         this._name = param2;
         this.var_914 = param3;
      }
      
      public function get countryCode() : String
      {
         return this.var_1687;
      }
      
      public function get languageCode() : String
      {
         return this.var_1686;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get url() : String
      {
         return this.var_914;
      }
      
      public function get encoding() : String
      {
         return this.var_1688;
      }
      
      public function get id() : String
      {
         return this.var_1686 + "_" + this.var_1687 + "." + this.var_1688;
      }
   }
}
