package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1242:Array;
      
      private var var_2370:String;
      
      private var var_2371:String;
      
      private var var_2372:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         this.var_1242 = param1;
         this.var_2370 = param2;
         this.var_2371 = param3;
         this.var_2372 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_1242;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2370;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2371;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2372;
      }
   }
}
