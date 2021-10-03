package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1505:int = 10;
       
      
      private var var_2062:Boolean;
      
      private var var_2066:int;
      
      private var var_1201:int;
      
      private var var_2064:Boolean;
      
      private var var_1169:Array;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1200:Array;
      
      private var var_2065:int;
      
      private var var_2067:int;
      
      private var var_1482:int;
      
      private var var_2063:int = 0;
      
      private var var_1943:int;
      
      private var var_2070:int;
      
      private var var_777:PublicRoomShortData;
      
      private var var_517:RoomEventData;
      
      private var var_176:MsgWithRequestId;
      
      private var var_2069:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2068:Boolean;
      
      private var var_214:GuestRoomData;
      
      private var var_955:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1169 = new Array();
         this.var_1200 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_176 != null && this.var_176 as PopularRoomTagsData != null;
      }
      
      public function get adIndex() : int
      {
         return this.var_2063;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2068;
      }
      
      public function startLoading() : void
      {
         this.var_955 = true;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2066;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2068 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_517 != null)
         {
            this.var_517.dispose();
         }
         this.var_517 = param1;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1482;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_955;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_176 != null && this.var_176 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_176 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_214;
      }
      
      public function get allCategories() : Array
      {
         return this.var_1169;
      }
      
      public function onRoomExit() : void
      {
         if(this.var_517 != null)
         {
            this.var_517.dispose();
            this.var_517 = null;
         }
         if(this.var_777 != null)
         {
            this.var_777.dispose();
            this.var_777 = null;
         }
         if(this.var_214 != null)
         {
            this.var_214.dispose();
            this.var_214 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_176 = param1;
         this.var_955 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_176 = param1;
         this.var_955 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_777 = null;
         this.var_214 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_777 = param1.publicSpace;
            this.var_517 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2065 = param1.limit;
         this.var_1201 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_176 as PopularRoomTagsData;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2062;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_777;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2064;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_176 = param1;
         this.var_955 = false;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_214 != null && this._currentRoomOwner;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1482 = param1;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1200;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1169 = param1;
         this.var_1200 = new Array();
         for each(_loc2_ in this.var_1169)
         {
            if(_loc2_.visible)
            {
               this.var_1200.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2067;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2070;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_176 == null)
         {
            return;
         }
         this.var_176.dispose();
         this.var_176 = null;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2062 = param1;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_517;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1201 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_176 as OfficialRoomsData;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_1943 = param1;
      }
      
      public function get avatarId() : int
      {
         return this.var_1943;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_214.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2064 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2063 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2067 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2069 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_214 != null)
         {
            this.var_214.dispose();
         }
         this.var_214 = param1;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_176 != null && this.var_176 as OfficialRoomsData != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_214 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_214.flatId;
         return this.var_1482 == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1201 >= this.var_2065;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2070 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2069;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_214 != null && !this._currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2066 = param1;
      }
   }
}
