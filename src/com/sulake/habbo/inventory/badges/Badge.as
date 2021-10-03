package com.sulake.habbo.inventory.badges
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class Badge implements IThumbListDrawableItem
   {
       
      
      private const const_1768:int = 8947848;
      
      private const const_1767:int = 13421772;
      
      private var _isSelected:Boolean;
      
      private var _window:IWindowContainer;
      
      private var var_1395:Boolean;
      
      private var var_37:BitmapData;
      
      private var _type:String;
      
      public function Badge(param1:String, param2:IWindowContainer)
      {
         this.var_37 = new BitmapData(1,1,false,4278255360);
         super();
         this._type = param1;
         this._window = param2;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_37 = param1;
         if(this.var_37 == null)
         {
            return;
         }
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("bitmap") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         param1 = this.var_37;
         var _loc3_:BitmapData = !!_loc2_.bitmap ? _loc2_.bitmap : new BitmapData(_loc2_.width,_loc2_.height);
         _loc3_.fillRect(_loc3_.rect,0);
         _loc3_.copyPixels(param1,param1.rect,new Point(_loc3_.width / 2 - param1.width / 2,_loc3_.height / 2 - param1.height / 2));
         _loc2_.bitmap = _loc3_;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
         if(param1)
         {
            this._window.color = this.const_1768;
         }
         else
         {
            this._window.color = this.const_1767;
         }
      }
      
      public function get isInUse() : Boolean
      {
         return this.var_1395;
      }
      
      public function get iconImage() : BitmapData
      {
         return this.var_37;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         this.var_1395 = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}
