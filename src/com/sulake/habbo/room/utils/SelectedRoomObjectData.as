package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_71:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_218:Vector3d = null;
      
      private var var_1982:int = 0;
      
      private var var_1984:String = null;
      
      private var _category:int = 0;
      
      private var var_1983:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         this._id = param1;
         this._category = param2;
         this.var_1983 = param3;
         this.var_71 = new Vector3d();
         this.var_71.assign(param4);
         this.var_218 = new Vector3d();
         this.var_218.assign(param5);
         this.var_1982 = param6;
         this.var_1984 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return this.var_71;
      }
      
      public function get typeId() : int
      {
         return this.var_1982;
      }
      
      public function get dir() : Vector3d
      {
         return this.var_218;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get instanceData() : String
      {
         return this.var_1984;
      }
      
      public function get operation() : String
      {
         return this.var_1983;
      }
      
      public function dispose() : void
      {
         this.var_71 = null;
         this.var_218 = null;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
