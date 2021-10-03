package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_468:FloorRasterizer;
      
      private var var_851:Boolean = false;
      
      private var var_692:PlaneMaskManager;
      
      private var var_467:WallRasterizer;
      
      private var var_691:WallAdRasterizer;
      
      private var var_469:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_467 = new WallRasterizer();
         this.var_468 = new FloorRasterizer();
         this.var_691 = new WallAdRasterizer();
         this.var_469 = new LandscapeRasterizer();
         this.var_692 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_467;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_691;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_468;
      }
      
      public function get initialized() : Boolean
      {
         return this.var_851;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_692;
      }
      
      public function dispose() : void
      {
         if(this.var_467 != null)
         {
            this.var_467.dispose();
            this.var_467 = null;
         }
         if(this.var_468 != null)
         {
            this.var_468.dispose();
            this.var_468 = null;
         }
         if(this.var_691 != null)
         {
            this.var_691.dispose();
            this.var_691 = null;
         }
         if(this.var_469 != null)
         {
            this.var_469.dispose();
            this.var_469 = null;
         }
         if(this.var_692 != null)
         {
            this.var_692.dispose();
            this.var_692 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_467.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_468.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_691.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_469.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_692.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(this.var_467 != null)
         {
            this.var_467.clearCache();
         }
         if(this.var_468 != null)
         {
            this.var_468.clearCache();
         }
         if(this.var_469 != null)
         {
            this.var_469.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_469;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_851)
         {
            return;
         }
         this.var_467.initializeAssetCollection(param1);
         this.var_468.initializeAssetCollection(param1);
         this.var_691.initializeAssetCollection(param1);
         this.var_469.initializeAssetCollection(param1);
         this.var_692.initializeAssetCollection(param1);
         this.var_851 = true;
      }
   }
}
