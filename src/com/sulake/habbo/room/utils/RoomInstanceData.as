package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_927:LegacyWallGeometry = null;
      
      private var var_613:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_614:TileHeightMap = null;
      
      private var var_1924:String = null;
      
      private var _roomId:int = 0;
      
      private var var_615:SelectedRoomObjectData = null;
      
      private var var_926:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_927 = new LegacyWallGeometry();
         this.var_926 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_613 != null)
         {
            this.var_613.dispose();
         }
         this.var_613 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_614 != null)
         {
            this.var_614.dispose();
         }
         this.var_614 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         this.var_1924 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_927;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_615;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_926;
      }
      
      public function dispose() : void
      {
         if(this.var_614 != null)
         {
            this.var_614.dispose();
            this.var_614 = null;
         }
         if(this.var_927 != null)
         {
            this.var_927.dispose();
            this.var_927 = null;
         }
         if(this.var_926 != null)
         {
            this.var_926.dispose();
            this.var_926 = null;
         }
         if(this.var_613 != null)
         {
            this.var_613.dispose();
            this.var_613 = null;
         }
         if(this.var_615 != null)
         {
            this.var_615.dispose();
            this.var_615 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_614;
      }
      
      public function get worldType() : String
      {
         return this.var_1924;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_615 != null)
         {
            this.var_615.dispose();
         }
         this.var_615 = param1;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_613;
      }
   }
}
