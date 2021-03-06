package com.sulake.habbo.sound.trax
{
   public class TraxChannel
   {
       
      
      private var _items:Array;
      
      private var _id:int;
      
      public function TraxChannel(param1:int)
      {
         super();
         this._id = param1;
         this._items = [];
      }
      
      public function addChannelItem(param1:TraxChannelItem) : void
      {
         this._items.push(param1);
      }
      
      public function getItem(param1:int) : TraxChannelItem
      {
         return this._items[param1] as TraxChannelItem;
      }
      
      public function get itemCount() : int
      {
         return this._items.length;
      }
   }
}
