package com.sulake.room.renderer.cache
{
   import com.sulake.room.renderer.utils.SortableSprite;
   
   public class RoomObjectSortableSpriteCacheItem
   {
       
      
      private var var_1791:Boolean = false;
      
      private var var_2512:int = -1;
      
      private var var_179:Array;
      
      private var var_2513:int = -1;
      
      public function RoomObjectSortableSpriteCacheItem()
      {
         this.var_179 = [];
         super();
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_1791;
      }
      
      public function addSprite(param1:SortableSprite) : void
      {
         this.var_179.push(param1);
      }
      
      public function get spriteCount() : int
      {
         return this.var_179.length;
      }
      
      public function needsUpdate(param1:int, param2:int) : Boolean
      {
         if(param1 != this.var_2512 || param2 != this.var_2513)
         {
            this.var_2512 = param1;
            this.var_2513 = param2;
            return true;
         }
         return false;
      }
      
      public function setSpriteCount(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1 < this.var_179.length)
         {
            _loc2_ = param1;
            while(_loc2_ < this.var_179.length)
            {
               _loc3_ = this.getSprite(_loc2_);
               if(_loc3_)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            this.var_179.splice(param1,this.var_179.length - param1);
         }
         if(this.var_179.length == 0)
         {
            this.var_1791 = true;
         }
         else
         {
            this.var_1791 = false;
         }
      }
      
      public function getSprite(param1:int) : SortableSprite
      {
         return this.var_179[param1];
      }
      
      public function dispose() : void
      {
         this.setSpriteCount(0);
      }
   }
}
