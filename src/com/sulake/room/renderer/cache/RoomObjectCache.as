package com.sulake.room.renderer.cache
{
   import com.sulake.core.utils.Map;
   
   public class RoomObjectCache
   {
       
      
      private var _roomObjectVariableAccurateZ:String = "";
      
      private var _data:Map = null;
      
      public function RoomObjectCache(param1:String)
      {
         super();
         this._roomObjectVariableAccurateZ = param1;
         this._data = new Map();
      }
      
      public function removeObjectCache(param1:String) : void
      {
         var _loc2_:RoomObjectCacheItem = this._data.remove(param1) as RoomObjectCacheItem;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
         }
      }
      
      public function getObjectCache(param1:String) : RoomObjectCacheItem
      {
         var _loc2_:RoomObjectCacheItem = this._data.getValue(param1) as RoomObjectCacheItem;
         if(_loc2_ == null)
         {
            _loc2_ = new RoomObjectCacheItem(this._roomObjectVariableAccurateZ);
            this._data.add(param1,_loc2_);
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this._data != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this._data.length)
            {
               _loc2_ = this._data.getWithIndex(_loc1_) as RoomObjectCacheItem;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this._data.dispose();
            this._data = null;
         }
      }
   }
}
