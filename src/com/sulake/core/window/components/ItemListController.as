package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IInputProcessorRoot;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.Iterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class ItemListController extends WindowController implements IItemListWindow, IInputProcessorRoot
   {
      
      protected static const const_1100:String = "resize_on_item_update";
      
      protected static const const_1103:String = "spacing";
      
      protected static const const_1492:Boolean = false;
      
      protected static const DEF_SPACING:int = 0;
      
      protected static const const_1102:String = "scale_to_fit_items";
      
      protected static const DEF_RESIZE_ON_ITEM_UPDATE:Boolean = false;
      
      protected static const const_1491:Boolean = true;
      
      protected static const const_1101:String = "auto_arrange_items";
       
      
      protected var _container:IWindowContainer;
      
      protected var _spacing:int = 0;
      
      protected var var_87:Number;
      
      protected var var_1146:Number;
      
      protected var var_1145:Number;
      
      protected var var_2624:Number = 0.0;
      
      protected var var_497:Boolean = false;
      
      protected var var_2623:Number = 0.0;
      
      protected var var_1854:int = 0;
      
      protected var var_1855:int = 0;
      
      protected var var_602:Number;
      
      protected var var_1388:Boolean = false;
      
      protected var var_603:Number;
      
      protected var var_1144:Boolean = false;
      
      protected var var_496:Boolean = false;
      
      protected var var_97:Number;
      
      protected var var_1856:Boolean = false;
      
      protected var _horizontal:Boolean = false;
      
      protected var var_913:Boolean = true;
      
      public function ItemListController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         this.var_602 = 0;
         this.var_603 = 0;
         this.var_97 = 0;
         this.var_87 = 0;
         this._horizontal = param2 == WindowType.const_314;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_147 = var_488 || !testParamFlag(WindowParam.const_31);
         this._container = var_17.create("_CONTAINER","",WindowType.const_362,WindowStyle.const_704,0 | 0 | 0,new Rectangle(0,0,width,height),null,this,0,null,[WindowController.TAG_INTERNAL,WindowController.TAG_EXCLUDE]) as IWindowContainer;
         this._container.addEventListener(WindowEvent.const_44,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_471,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_274,this.containerEventHandler);
         this._container.addEventListener(WindowEvent.const_445,this.containerEventHandler);
         this.resizeOnItemUpdate = this.var_1144;
      }
      
      public function swapListItemsAt(param1:int, param2:int) : void
      {
         this._container.swapChildrenAt(param1,param2);
         this.updateScrollAreaRegion();
      }
      
      public function get visibleRegion() : Rectangle
      {
         return new Rectangle(this.var_602 * this.maxScrollH,this.var_603 * this.maxScrollV,width,height);
      }
      
      public function get maxScrollH() : int
      {
         var _loc1_:int = this.var_97 - width;
         return _loc1_ < 0 ? 0 : int(_loc1_);
      }
      
      public function get scrollH() : Number
      {
         return this.var_602;
      }
      
      override public function dispose() : void
      {
         this._container.removeEventListener(WindowEvent.const_44,this.containerEventHandler);
         this._container.removeEventListener(WindowEvent.const_471,this.containerEventHandler);
         this._container.removeEventListener(WindowEvent.const_274,this.containerEventHandler);
         this._container.removeEventListener(WindowEvent.const_445,this.containerEventHandler);
         super.dispose();
      }
      
      public function get maxScrollV() : int
      {
         var _loc1_:int = this.var_87 - height;
         return _loc1_ < 0 ? 0 : int(_loc1_);
      }
      
      public function get scrollV() : Number
      {
         return this.var_603;
      }
      
      public function set scrollH(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != this.var_602)
         {
            this.var_602 = param1;
            this._container.x = -this.var_602 * this.maxScrollH;
            var_17.invalidate(this._container,this.visibleRegion,WindowRedrawFlag.const_76);
            dispatchEvent(new WindowEvent(WindowEvent.const_528,this,null));
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         _loc1_.push(new PropertyStruct(const_1103,this._spacing,PropertyStruct.const_54,this._spacing != DEF_SPACING));
         _loc1_.push(new PropertyStruct(const_1101,this.var_913,PropertyStruct.const_48,this.var_913 != const_1491));
         _loc1_.push(new PropertyStruct(const_1102,this.var_497,PropertyStruct.const_48,this.var_497 != const_1492));
         _loc1_.push(new PropertyStruct(const_1100,this.var_1144,PropertyStruct.const_48,this.var_1144 != DEF_RESIZE_ON_ITEM_UPDATE));
         return _loc1_;
      }
      
      public function get scrollStepH() : Number
      {
         return !!this._horizontal ? Number(this._container.width / this.numListItems) : Number(0.1 * this._container.width);
      }
      
      public function setListItemIndex(param1:IWindow, param2:int) : void
      {
         this._container.setChildIndex(param1,param2);
      }
      
      public function get scrollStepV() : Number
      {
         return !!this._horizontal ? Number(0.1 * this._container.height) : Number(this._container.height / this.numListItems);
      }
      
      public function groupListItemsWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         return this._container.groupChildrenWithID(param1,param2,param3);
      }
      
      public function get spacing() : int
      {
         return this._spacing;
      }
      
      public function set scrollV(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 != this.var_603)
         {
            this.var_603 = param1;
            this._container.y = -this.var_603 * this.maxScrollV;
            var_17.invalidate(this._container,this.visibleRegion,WindowRedrawFlag.const_76);
            dispatchEvent(new WindowEvent(WindowEvent.const_528,this,null));
         }
      }
      
      public function set scrollStepH(param1:Number) : void
      {
         this.var_2624 = Math.max(param1,0);
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case const_1103:
                  this.spacing = _loc2_.value as int;
                  break;
               case const_1102:
                  this.scaleToFitItems = _loc2_.value as Boolean;
                  break;
               case const_1100:
                  this.resizeOnItemUpdate = _loc2_.value as Boolean;
                  break;
               case const_1101:
                  this.var_913 = _loc2_.value as Boolean;
                  break;
            }
         }
         super.properties = param1;
      }
      
      public function addListItemAt(param1:IWindow, param2:uint) : IWindow
      {
         param1 = this._container.addChildAt(param1,param2);
         this.updateScrollAreaRegion();
         return param1;
      }
      
      public function get iterator() : IIterator
      {
         return new Iterator(this);
      }
      
      public function groupListItemsWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         return this._container.groupChildrenWithTag(param1,param2,param3);
      }
      
      public function swapListItems(param1:IWindow, param2:IWindow) : void
      {
         this._container.swapChildren(param1,param2);
         this.updateScrollAreaRegion();
      }
      
      public function set scaleToFitItems(param1:Boolean) : void
      {
         this.var_497 = param1;
         this.updateScrollAreaRegion();
      }
      
      public function set scrollStepV(param1:Number) : void
      {
         this.var_2623 = Math.max(param1,0);
      }
      
      public function get scrollableRegion() : Rectangle
      {
         return this._container.rectangle.clone();
      }
      
      private function containerEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case WindowEvent.const_471:
               this.updateScrollAreaRegion();
               break;
            case WindowEvent.const_274:
               if(!this.var_1856)
               {
                  this.updateScrollAreaRegion();
               }
               break;
            case WindowEvent.const_445:
               this.updateScrollAreaRegion();
               break;
            case WindowEvent.const_44:
               dispatchEvent(new WindowEvent(WindowEvent.const_44,this,null));
               break;
            default:
               Logger.log("ItemListController::containerEventHandler(" + param1.type + ")");
         }
      }
      
      public function removeListItem(param1:IWindow) : IWindow
      {
         param1 = this._container.removeChild(param1);
         if(param1)
         {
            this.updateScrollAreaRegion();
         }
         return param1;
      }
      
      public function arrangeListItems() : void
      {
         this.updateScrollAreaRegion();
      }
      
      public function get lastListItem() : IWindow
      {
         return this.numListItems > 0 ? this.getListItemAt(this.numListItems - 1) : null;
      }
      
      public function removeListItemAt(param1:int) : IWindow
      {
         return this._container.removeChildAt(param1);
      }
      
      public function set spacing(param1:int) : void
      {
         if(param1 != this._spacing)
         {
            this._spacing = param1;
            this.updateScrollAreaRegion();
         }
      }
      
      public function addListItem(param1:IWindow) : IWindow
      {
         this.var_496 = true;
         if(this._horizontal)
         {
            param1.x = this.var_97 + (this.numListItems > 0 ? this._spacing : 0);
            this.var_97 = param1.rectangle.right;
            this._container.width = this.var_97;
         }
         else
         {
            if(this.autoArrangeItems)
            {
               param1.y = this.var_87 + (this.numListItems > 0 ? this._spacing : 0);
               this.var_87 = param1.rectangle.bottom;
            }
            else
            {
               this.var_87 = Math.max(this.var_87,param1.rectangle.bottom);
            }
            this._container.height = this.var_87;
         }
         param1 = this._container.addChild(param1);
         this.var_496 = false;
         return param1;
      }
      
      public function set autoArrangeItems(param1:Boolean) : void
      {
         this.var_913 = param1;
         this.updateScrollAreaRegion();
      }
      
      public function getListItemByID(param1:uint) : IWindow
      {
         return this._container.getChildByID(param1);
      }
      
      public function process(param1:WindowEvent) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 is WindowMouseEvent)
         {
            _loc3_ = WindowMouseEvent(param1).localX;
            _loc4_ = WindowMouseEvent(param1).localY;
            _loc5_ = WindowMouseEvent(param1).delta;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.const_269:
               if(this._horizontal)
               {
                  this.scrollH -= _loc5_ * 0.01;
               }
               else
               {
                  this.scrollV -= _loc5_ * 0.01;
               }
               _loc2_ = true;
               break;
            case WindowMouseEvent.const_40:
               this.var_1854 = _loc3_;
               this.var_1855 = _loc4_;
               this.var_1146 = 0;
               this.var_1145 = 0;
               this.var_1388 = true;
               _loc2_ = true;
               break;
            case WindowMouseEvent.const_182:
               if(this.var_1388)
               {
                  this.var_1146 = this.var_1854 - _loc3_;
                  this.var_1145 = this.var_1855 - _loc4_;
                  if(this._horizontal)
                  {
                     if(this.var_1146 != 0 && this.var_97 != 0)
                     {
                        this.scrollH += this.var_1146 / this.var_97;
                     }
                  }
                  else if(this.var_1145 != 0 && this.var_87 != 0)
                  {
                     this.scrollV += this.var_1145 / this.var_87;
                  }
                  this.var_1854 = _loc3_;
                  this.var_1855 = _loc4_;
                  _loc2_ = true;
               }
               break;
            case WindowMouseEvent.const_57:
            case WindowMouseEvent.const_171:
               if(this.var_1388)
               {
                  if(this._horizontal)
                  {
                     var_17.getWindowServices().getGestureAgentService().begin(this,this.scrollAnimationCallback,0,-this.var_1146,0);
                  }
                  else
                  {
                     var_17.getWindowServices().getGestureAgentService().begin(this,this.scrollAnimationCallback,0,0,-this.var_1145);
                  }
                  this.var_1388 = false;
                  _loc2_ = true;
               }
         }
         return _loc2_;
      }
      
      public function set resizeOnItemUpdate(param1:Boolean) : void
      {
         this.var_1144 = param1;
         if(this._container)
         {
            if(this._horizontal)
            {
               this._container.setParamFlag(WindowParam.WINDOW_PARAM_REFLECT_HORIZONTAL_RESIZE_TO_PARENT,param1);
            }
            else
            {
               this._container.setParamFlag(WindowParam.const_406,param1);
            }
         }
      }
      
      public function get firstListItem() : IWindow
      {
         return this.numListItems > 0 ? this.getListItemAt(0) : null;
      }
      
      private function scrollAnimationCallback(param1:int, param2:int) : void
      {
         this.scrollH -= param1 / this.var_97;
         this.scrollV -= param2 / this.var_87;
      }
      
      protected function updateScrollAreaRegion() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this.var_913 && !this.var_496 && this._container)
         {
            this.var_496 = true;
            _loc1_ = uint(this._container.numChildren);
            if(this._horizontal)
            {
               this.var_97 = 0;
               this.var_87 = var_11.height;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = this._container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.x = this.var_97;
                     this.var_97 += _loc2_.width + this._spacing;
                     if(this.var_497)
                     {
                        _loc3_ = _loc2_.height + _loc2_.y;
                        this.var_87 = _loc3_ > this.var_87 ? Number(_loc3_) : Number(this.var_87);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  this.var_97 -= this._spacing;
               }
            }
            else
            {
               this.var_97 = var_11.width;
               this.var_87 = 0;
               _loc4_ = 0;
               while(_loc4_ < _loc1_)
               {
                  _loc2_ = this._container.getChildAt(_loc4_);
                  if(_loc2_.visible)
                  {
                     _loc2_.y = this.var_87;
                     this.var_87 += _loc2_.height + this._spacing;
                     if(this.var_497)
                     {
                        _loc3_ = _loc2_.width + _loc2_.x;
                        this.var_97 = _loc3_ > this.var_97 ? Number(_loc3_) : Number(this.var_97);
                     }
                  }
                  _loc4_++;
               }
               if(_loc1_ > 0)
               {
                  this.var_87 -= this._spacing;
               }
            }
            if(this.var_602 > 0)
            {
               if(this.var_97 <= var_11.width)
               {
                  this.scrollH = 0;
               }
               else
               {
                  this._container.x = -(this.var_602 * this.maxScrollH);
               }
            }
            if(this.var_603 > 0)
            {
               if(this.var_87 <= var_11.height)
               {
                  this.scrollV = 0;
               }
               else
               {
                  this._container.y = -(this.var_603 * this.maxScrollV);
               }
            }
            this._container.height = this.var_87;
            this._container.width = this.var_97;
            this.var_496 = false;
         }
      }
      
      public function getListItemByName(param1:String) : IWindow
      {
         return this._container.getChildByName(param1);
      }
      
      public function removeListItems() : void
      {
         this.var_496 = true;
         while(this.numListItems > 0)
         {
            this._container.removeChildAt(0);
         }
         this.var_496 = false;
         this.updateScrollAreaRegion();
      }
      
      public function get scaleToFitItems() : Boolean
      {
         return this.var_497;
      }
      
      override protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.numListItems)
         {
            IItemListWindow(param1).addListItem(this.getListItemAt(_loc2_).clone());
            _loc2_++;
         }
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:Boolean = super.update(param1,param2);
         switch(param2.type)
         {
            case WindowNotifyEvent.const_447:
               break;
            case WindowNotifyEvent.const_645:
               this.var_1856 = true;
               break;
            case WindowNotifyEvent.const_165:
               if(!this.var_497)
               {
                  if(this._horizontal)
                  {
                     this._container.height = var_11.height;
                  }
                  else
                  {
                     this._container.width = var_11.width;
                  }
               }
               this.updateScrollAreaRegion();
               this.var_1856 = false;
               break;
            default:
               if(param2 is WindowEvent)
               {
                  _loc3_ = this.process(param2 as WindowEvent);
               }
         }
         return _loc3_;
      }
      
      public function get autoArrangeItems() : Boolean
      {
         return this.var_913;
      }
      
      public function getListItemIndex(param1:IWindow) : int
      {
         return this._container.getChildIndex(param1);
      }
      
      public function get resizeOnItemUpdate() : Boolean
      {
         return this.var_1144;
      }
      
      public function getListItemAt(param1:uint) : IWindow
      {
         return this._container.getChildAt(param1);
      }
      
      public function get numListItems() : int
      {
         return this._container != null ? int(this._container.numChildren) : 0;
      }
      
      public function destroyListItems() : void
      {
         this.var_496 = true;
         while(this.numListItems > 0)
         {
            this._container.removeChildAt(0).destroy();
         }
         this.var_496 = false;
         this.updateScrollAreaRegion();
      }
   }
}
