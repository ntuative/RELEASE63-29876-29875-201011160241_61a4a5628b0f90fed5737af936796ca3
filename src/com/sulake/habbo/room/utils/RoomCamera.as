package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_825:int = 3;
       
      
      private var var_2176:Boolean = false;
      
      private var var_2183:Boolean = false;
      
      private var var_1222:int = 0;
      
      private var var_358:Vector3d = null;
      
      private var var_2178:int = 0;
      
      private var var_2174:int = 0;
      
      private var var_2182:Boolean = false;
      
      private var var_2175:int = -2;
      
      private var var_2177:Boolean = false;
      
      private var var_2181:int = 0;
      
      private var var_2180:int = -1;
      
      private var var_298:Vector3d = null;
      
      private var var_2179:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return this.var_2178;
      }
      
      public function get targetId() : int
      {
         return this.var_2180;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2181 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2178 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2176 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2180 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2183 = param1;
      }
      
      public function dispose() : void
      {
         this.var_298 = null;
         this.var_358 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_298 == null)
         {
            this.var_298 = new Vector3d();
         }
         if(this.var_298.x != param1.x || this.var_298.y != param1.y || this.var_298.z != param1.z)
         {
            this.var_298.assign(param1);
            this.var_1222 = 0;
         }
      }
      
      public function get targetCategory() : int
      {
         return this.var_2175;
      }
      
      public function get screenHt() : int
      {
         return this.var_2179;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2174 = param1;
      }
      
      public function get location() : IVector3d
      {
         return this.var_358;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2179 = param1;
      }
      
      public function get roomHt() : int
      {
         return this.var_2181;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2176;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2183;
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_298 != null && this.var_358 != null)
         {
            ++this.var_1222;
            _loc4_ = Vector3d.dif(this.var_298,this.var_358);
            if(_loc4_.length <= param2)
            {
               this.var_358 = this.var_298;
               this.var_298 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_825 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1222 <= const_825)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_358 = Vector3d.sum(this.var_358,_loc4_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2182 = param1;
      }
      
      public function get screenWd() : int
      {
         return this.var_2174;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2177 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2175 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_358 != null)
         {
            return;
         }
         this.var_358 = new Vector3d();
         this.var_358.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2182;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2177;
      }
   }
}
