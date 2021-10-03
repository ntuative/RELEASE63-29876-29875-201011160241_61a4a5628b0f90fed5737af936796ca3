package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_478:int = 0;
      
      public static const const_113:int = 2;
      
      public static const const_167:int = 1;
      
      public static const const_708:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_2139:Boolean;
      
      private var var_2137:Boolean;
      
      private var var_2133:int;
      
      private var var_2135:Array;
      
      private var var_2136:int;
      
      private var var_1969:Boolean;
      
      private var var_1504:String;
      
      private var var_2134:int;
      
      private var var_2138:Boolean;
      
      private var var_1965:int;
      
      private var var_1331:int;
      
      private var _roomId:int;
      
      private var var_735:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2134;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2134 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2138 = param1;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_735;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_1969;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2136 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2135 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_735 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2139;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2137;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2133;
      }
      
      public function get categoryId() : int
      {
         return this.var_1331;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_1969 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2138;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2136;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get controllers() : Array
      {
         return this.var_2135;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_1965 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2139 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2137 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2133 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_1965;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1331 = param1;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1504 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1504;
      }
   }
}
