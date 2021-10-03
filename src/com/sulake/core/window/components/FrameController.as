package com.sulake.core.window.components
{
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.IMargins;
   import com.sulake.core.window.utils.Iterator;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.TextMargins;
   import flash.geom.Rectangle;
   
   public class FrameController extends ContainerController implements IFrameWindow
   {
      
      private static const const_827:String = "margin_top";
      
      private static const const_1153:String = "_SCALER";
      
      private static const const_828:String = "margin_right";
      
      private static const const_1155:String = "_HEADER";
      
      private static const const_1154:String = "_TITLE";
      
      private static const const_1152:String = "_CONTENT";
      
      private static const const_829:String = "margin_left";
      
      private static const const_826:String = "margin_bottom";
       
      
      private var _title:ITextWindow;
      
      private var var_77:IMargins;
      
      private var var_1138:Boolean = false;
      
      private var var_1229:IHeaderWindow;
      
      private var var_158:IWindowContainer;
      
      public function FrameController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 |= 0;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         this.var_1138 = true;
         activate();
         this.setupScaling();
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         var _loc2_:* = this.var_77 != null;
         var _loc3_:Rectangle = this.content.rectangle;
         _loc1_.push(new PropertyStruct(const_829,_loc3_.left,PropertyStruct.const_54,_loc2_));
         _loc1_.push(new PropertyStruct(const_827,_loc3_.top,PropertyStruct.const_54,_loc2_));
         _loc1_.push(new PropertyStruct(const_828,0 - _loc3_.right,PropertyStruct.const_54,_loc2_));
         _loc1_.push(new PropertyStruct(const_826,0 - _loc3_.bottom,PropertyStruct.const_54,_loc2_));
         return _loc1_;
      }
      
      public function resizeToFitContent() : void
      {
         var _loc1_:WindowController = WindowController(this.content);
         var _loc2_:int = _loc1_.width;
         var _loc3_:int = _loc1_.height;
         var _loc4_:uint = _loc1_.numChildren;
         resizeToAccommodateChildren(_loc1_);
      }
      
      public function get margins() : IMargins
      {
         var _loc1_:* = null;
         if(!this.var_77)
         {
            _loc1_ = this.content.rectangle;
            this.var_77 = new TextMargins(_loc1_.left,_loc1_.top,_loc1_.right,_loc1_.bottom,this.marginsCallback);
         }
         return this.var_77;
      }
      
      override public function set color(param1:uint) : void
      {
         var _loc3_:* = null;
         super.color = param1;
         var _loc2_:Array = new Array();
         groupChildrenWithTag(const_1105,_loc2_,false);
         for each(_loc3_ in _loc2_)
         {
            _loc3_.color = param1;
         }
      }
      
      private function setupScaling() : void
      {
         var _loc1_:IWindow = this.scaler;
         var _loc2_:Boolean = testParamFlag(WindowParam.const_295);
         var _loc3_:Boolean = testParamFlag(WindowParam.const_203);
         var _loc4_:Boolean = testParamFlag(WindowParam.const_224);
         if(_loc1_)
         {
            if(_loc3_ || _loc2_)
            {
               _loc1_.setParamFlag(WindowParam.const_203,true);
            }
            else
            {
               _loc1_.setParamFlag(WindowParam.const_203,false);
            }
            if(_loc4_ || _loc2_)
            {
               _loc1_.setParamFlag(WindowParam.const_224,true);
            }
            else
            {
               _loc1_.setParamFlag(WindowParam.const_224,false);
            }
            _loc1_.visible = _loc3_ || _loc4_ || _loc2_;
         }
      }
      
      public function get header() : IHeaderWindow
      {
         if(this.var_1229 == null)
         {
            this.var_1229 = findChildByTag(const_1155) as IHeaderWindow;
            if(!this.var_1229)
            {
               throw new Error("Frame window\'s header element not available!");
            }
         }
         return this.var_1229;
      }
      
      override public function set caption(param1:String) : void
      {
         var value:String = param1;
         super.caption = value;
         try
         {
            this.title.text = value;
         }
         catch(e:Error)
         {
         }
      }
      
      override public function setParamFlag(param1:uint, param2:Boolean = true) : void
      {
         super.setParamFlag(param1,param2);
         this.setupScaling();
      }
      
      public function get title() : ITextWindow
      {
         if(this._title == null)
         {
            this._title = findChildByTag(const_1154) as ITextWindow;
            if(!this._title)
            {
               throw new Error("Frame window\'s title element not available!");
            }
         }
         return this._title;
      }
      
      public function get scaler() : IScalerWindow
      {
         return findChildByTag(const_1153) as IScalerWindow;
      }
      
      private function marginsCallback(param1:IMargins) : void
      {
         var _loc2_:IWindow = this.content;
         var _loc3_:uint = _loc2_.param;
         var _loc4_:uint = _loc2_.param & (0 | 0);
         if(_loc4_)
         {
            _loc2_.setParamFlag(0 | 0,false);
         }
         var _loc5_:uint = _loc2_.param & 0;
         if(_loc5_)
         {
            _loc2_.setParamFlag(WindowParam.const_275,false);
         }
         _loc2_.rectangle = new Rectangle(param1.left,param1.top,param1.right - param1.left,param1.bottom - param1.top);
         if(_loc4_ || _loc5_)
         {
            _loc2_.setParamFlag(4294967295,false);
            _loc2_.setParamFlag(_loc3_,true);
         }
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case const_829:
                  this.margins.left = _loc2_.value as int;
                  break;
               case const_827:
                  this.margins.top = _loc2_.value as int;
                  break;
               case const_828:
                  this.margins.right = 0 - (_loc2_.value as int);
                  break;
               case const_826:
                  this.margins.bottom = 0 - (_loc2_.value as int);
                  break;
            }
         }
         super.properties = param1;
      }
      
      override public function get iterator() : IIterator
      {
         return this.content != null && this.var_1138 ? this.content.iterator : new Iterator(this);
      }
      
      public function get content() : IWindowContainer
      {
         if(this.var_158 == null)
         {
            this.var_158 = findChildByTag(const_1152) as IWindowContainer;
            if(!this.var_158)
            {
               throw new Error("Frame window\'s content element not available!");
            }
         }
         return this.var_158;
      }
      
      override public function buildFromXML(param1:XML, param2:Map = null) : Boolean
      {
         return context.getWindowParser().parseAndConstruct(param1,this.content,param2) != null;
      }
   }
}
