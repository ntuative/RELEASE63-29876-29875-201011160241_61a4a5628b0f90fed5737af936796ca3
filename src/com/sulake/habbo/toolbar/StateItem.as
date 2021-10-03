package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1189:Boolean;
      
      private var var_2165:String;
      
      private var _frames:XMLList;
      
      private var var_1354:String = "-1";
      
      private var var_488:String;
      
      private var var_175:int = 120;
      
      private var var_1536:String;
      
      private var var_1461:String = "-1";
      
      private var var_2164:Boolean;
      
      private var var_1535:String = "-1";
      
      private var var_327:String;
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         this._id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            this.var_1189 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            this.var_2164 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            this.var_175 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            this.var_1536 = param1.@namebase;
         }
         else
         {
            this.var_1536 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            this.var_1354 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            this.var_1461 = param1.@nextState;
         }
         else
         {
            this.var_1461 = this._id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            this.var_1535 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            this.var_2165 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            this.var_488 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            this._frames = _loc3_;
         }
         if(param1.attribute("label").length() > 0)
         {
            this.var_327 = param1.@label;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return this.var_1354 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return this.var_2164;
      }
      
      public function get defaultState() : String
      {
         return this.var_1535;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return this.var_1535 != "-1";
      }
      
      public function get tooltip() : String
      {
         return this.var_2165;
      }
      
      public function get timer() : int
      {
         return this.var_175;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get loop() : Boolean
      {
         return this.var_1189;
      }
      
      public function get nextState() : String
      {
         return this.var_1461;
      }
      
      public function get frames() : XMLList
      {
         return this._frames;
      }
      
      public function get background() : String
      {
         return this.var_488;
      }
      
      public function get stateOver() : String
      {
         return this.var_1354;
      }
      
      public function get label() : String
      {
         return this.var_327;
      }
      
      public function get nameBase() : String
      {
         return this.var_1536;
      }
   }
}
