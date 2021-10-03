package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_626:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_316:
               switch(_loc3_)
               {
                  case AvatarAction.const_581:
                  case AvatarAction.const_498:
                  case AvatarAction.const_364:
                  case AvatarAction.const_721:
                  case AvatarAction.const_328:
                  case AvatarAction.const_756:
                     super.appendAction(param1,[_loc3_]);
               }
               break;
            case AvatarAction.const_267:
            case AvatarAction.const_609:
            case AvatarAction.const_236:
            case AvatarAction.const_717:
            case AvatarAction.const_715:
            case AvatarAction.const_634:
               super.addActionData(param1,_loc3_);
         }
         return true;
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_626[param1];
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_626[param1] = param2;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_910)
         {
            _structure = null;
            _assets = null;
            var_224 = null;
            var_244 = null;
            var_564 = null;
            var_492 = null;
            var_276 = null;
            if(!var_1135 && var_37)
            {
               var_37.dispose();
            }
            var_37 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_607 = null;
            var_910 = true;
         }
      }
   }
}
