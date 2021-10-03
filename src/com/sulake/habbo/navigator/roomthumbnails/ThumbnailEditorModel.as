package com.sulake.habbo.navigator.roomthumbnails
{
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomThumbnailObjectData;
   import com.sulake.habbo.navigator.Util;
   import flash.utils.Dictionary;
   
   public class ThumbnailEditorModel
   {
      
      public static const const_56:int = 2;
      
      public static const const_34:int = 3;
      
      public static const const_36:int = 1;
       
      
      private var var_504:int = 1;
      
      private var _data:RoomThumbnailData;
      
      private var var_173:RoomThumbnailObjectData;
      
      public function ThumbnailEditorModel()
      {
         super();
      }
      
      private function addObject(param1:int) : void
      {
         Logger.log("New object pos: " + param1);
         var _loc2_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc2_.pos = param1;
         _loc2_.imgId = 0;
         this._data.objects.push(_loc2_);
         this.var_173 = _loc2_;
         Logger.log("Object count after insert: " + this._data.objects.length);
      }
      
      public function setImg(param1:int) : void
      {
         if(this.var_504 == const_36)
         {
            this._data.bgImgId = param1;
         }
         else if(this.var_504 == const_56)
         {
            this._data.frontImgId = param1;
         }
         if(this.var_504 == const_34)
         {
            if(this.var_173 == null)
            {
               return;
            }
            this.var_173.imgId = param1;
         }
      }
      
      public function set data(param1:RoomThumbnailData) : void
      {
         this._data = param1;
         this.var_504 = const_36;
         if(this._data.objects.length > 0)
         {
            this.var_173 = this._data.objects[0];
         }
         else
         {
            this.var_173 = null;
         }
      }
      
      public function set mode(param1:int) : void
      {
         this.var_504 = param1;
      }
      
      public function getImgId() : int
      {
         if(this.var_504 == const_36)
         {
            return this._data.bgImgId;
         }
         if(this.var_504 == const_56)
         {
            return this._data.frontImgId;
         }
         return this.var_173 == null ? -1 : int(this.var_173.imgId);
      }
      
      public function get mode() : int
      {
         return this.var_504;
      }
      
      public function findByPos(param1:int) : RoomThumbnailObjectData
      {
         var _loc2_:* = null;
         for each(_loc2_ in this._data.objects)
         {
            if(_loc2_.pos == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get data() : RoomThumbnailData
      {
         return this._data;
      }
      
      public function get selected() : RoomThumbnailObjectData
      {
         return this.var_173;
      }
      
      public function set selected(param1:RoomThumbnailObjectData) : void
      {
         this.var_173 = param1;
      }
      
      public function setPos(param1:int) : void
      {
         this.var_173 = this.findByPos(param1);
         if(this.var_173 == null)
         {
            this.addObject(param1);
         }
      }
      
      public function getBlockedPositions() : Dictionary
      {
         var _loc2_:* = null;
         var _loc1_:Dictionary = new Dictionary();
         for each(_loc2_ in this._data.objects)
         {
            if(_loc2_.imgId > 0)
            {
               _loc1_[_loc2_.pos] = "taken";
            }
         }
         return _loc1_;
      }
      
      private function removeSelected() : void
      {
         var _loc1_:Array = this._data.objects;
         if(this.var_173 == null)
         {
            return;
         }
         var _loc2_:int = Util.remove(_loc1_,this.var_173);
         this.var_173 = null;
         if(_loc1_.length > 0)
         {
            this.var_173 = _loc1_[Math.min(_loc2_,_loc1_.length - 1)];
         }
      }
   }
}
