package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_229:String = "Rectangle";
      
      public static const const_48:String = "Boolean";
      
      public static const const_253:String = "Number";
      
      public static const const_54:String = "int";
      
      public static const const_91:String = "String";
      
      public static const const_193:String = "Point";
      
      public static const const_150:String = "Array";
      
      public static const const_297:String = "uint";
      
      public static const const_179:String = "hex";
      
      public static const const_196:String = "Map";
       
      
      private var var_511:String;
      
      private var var_150:Object;
      
      private var var_2588:Boolean;
      
      private var _type:String;
      
      private var var_2013:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         this.var_511 = param1;
         this.var_150 = param2;
         this._type = param3;
         this.var_2013 = param4;
         this.var_2588 = param3 == const_196 || param3 == const_150 || param3 == const_193 || param3 == const_229;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_179:
               return "0x" + uint(this.var_150).toString(16);
            case const_48:
               return Boolean(this.var_150) == true ? "true" : "HabboAvatarRenderLib_manifest";
            case const_193:
               return "Point(" + Point(this.var_150).x + ", " + Point(this.var_150).y + ")";
            case const_229:
               return "Rectangle(" + Rectangle(this.var_150).x + ", " + Rectangle(this.var_150).y + ", " + Rectangle(this.var_150).width + ", " + Rectangle(this.var_150).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_196:
               _loc3_ = this.var_150 as Map;
               _loc1_ = "<var key=\"" + this.var_511 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_150:
               _loc4_ = this.var_150 as Array;
               _loc1_ = "<var key=\"" + this.var_511 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_193:
               _loc5_ = this.var_150 as Point;
               _loc1_ = "<var key=\"" + this.var_511 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_229:
               _loc6_ = this.var_150 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_511 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_54 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_179:
               _loc1_ = "<var key=\"" + this.var_511 + "\" value=\"" + "0x" + uint(this.var_150).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_511 + "\" value=\"" + this.var_150 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return this.var_150;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2013;
      }
      
      public function get key() : String
      {
         return this.var_511;
      }
   }
}
