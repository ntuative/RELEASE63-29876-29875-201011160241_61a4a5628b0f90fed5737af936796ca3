package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class PrizeContainer extends PrizeGridItem
   {
       
      
      private var var_2188:String;
      
      private var var_2601:PrizeGridItem;
      
      private var var_2189:int;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_1547:int;
      
      public function PrizeContainer(param1:String, param2:int, param3:IFurnitureData, param4:int)
      {
         super();
         this.var_2188 = param1;
         this.var_1547 = param2;
         this._furnitureData = param3;
         this.var_2189 = param4;
      }
      
      public function get oddsLevelId() : int
      {
         return this.var_2189;
      }
      
      public function get productItemType() : String
      {
         return this.var_2188;
      }
      
      public function get title() : String
      {
         if(this._furnitureData == null)
         {
            return "";
         }
         return this._furnitureData.title;
      }
      
      public function get gridItem() : PrizeGridItem
      {
         return this.var_2601;
      }
      
      public function setIcon(param1:IRoomEngine) : void
      {
         initProductIcon(param1,this._furnitureData.type,this.var_1547);
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_1547;
      }
   }
}
