package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_681:Array;
      
      private var var_1529:int;
      
      private var var_1604:Array;
      
      private var var_682:Array;
      
      private var var_1270:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1270 = _loc2_.isWrappingEnabled;
         this.var_1529 = _loc2_.wrappingPrice;
         this.var_1604 = _loc2_.stuffTypes;
         this.var_682 = _loc2_.boxTypes;
         this.var_681 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_681;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1604;
      }
      
      public function get price() : int
      {
         return this.var_1529;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_682;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1270;
      }
   }
}
