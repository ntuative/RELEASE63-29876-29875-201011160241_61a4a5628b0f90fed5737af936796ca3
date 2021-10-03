package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerFinishedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.recycler.RecyclerStatusMessageEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class RecyclerLogic implements IRecycler
   {
      
      private static const const_836:int = 0;
      
      public static const const_181:int = 5;
      
      private static const const_384:int = 1;
      
      private static const const_835:int = 2;
       
      
      private var _view:IRecyclerVisualization;
      
      private var var_705:Array;
      
      private var _catalog:IHabboCatalog;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1591:int;
      
      private var var_103:Array;
      
      private var var_553:int = 0;
      
      public function RecyclerLogic(param1:IHabboCatalog, param2:IHabboWindowManager)
      {
         this.var_103 = new Array();
         super();
         this._catalog = param1;
         this._windowManager = param2;
      }
      
      public function get active() : Boolean
      {
         return this.statusActive && this.systemActive;
      }
      
      private function updateRecyclerButton() : void
      {
         if(this._view == null || !this.statusActive)
         {
            return;
         }
         this._view.updateRecycleButton(this.isReadyToRecycle());
      }
      
      public function setSystemStatus(param1:int, param2:int) : void
      {
         this.var_1591 = param1;
         if(!this.systemActive)
         {
            return;
         }
         switch(this.var_1591)
         {
            case RecyclerStatusMessageEvent.const_1366:
               this.var_553 = const_384;
               if(this._view == null)
               {
                  return;
               }
               this._view.displayNormalView();
               this._catalog.setupInventoryForRecycler(true);
               this.verifyRoomSessionStatus();
               this.updateRecyclerSlots();
               this.updateRecyclerButton();
               break;
            case RecyclerStatusMessageEvent.const_893:
               if(this._view == null)
               {
                  return;
               }
               this._view.displayDisabledView();
               this._catalog.setupInventoryForRecycler(false);
               break;
            case RecyclerStatusMessageEvent.const_1358:
               if(this._view == null)
               {
                  return;
               }
               this._view.displayTimeOutView(param2);
               this._catalog.setupInventoryForRecycler(false);
               break;
         }
      }
      
      public function setRoomSessionActive(param1:Boolean) : void
      {
         if(param1 == false)
         {
            this.empty();
            this.verifyRoomSessionStatus();
         }
         this.updateRecyclerButton();
      }
      
      public function empty() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < const_181)
         {
            this.releaseSlot(_loc1_);
            _loc1_++;
         }
         this.updateRecyclerSlots();
         this.updateRecyclerButton();
      }
      
      public function init(param1:IRecyclerVisualization = null) : void
      {
         this.var_553 = const_835;
         this.var_103 = new Array(const_181);
         if(param1 == null)
         {
            return;
         }
         this._view = param1;
         this._catalog.getRecyclerStatus();
      }
      
      public function executeRecycler() : void
      {
         var _loc3_:* = null;
         if(!this.isReadyToRecycle())
         {
            return;
         }
         this.var_553 = const_835;
         this.updateRecyclerButton();
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < this.var_103.length)
         {
            _loc3_ = this.var_103[_loc2_];
            if(_loc3_ == null)
            {
               return;
            }
            _loc1_.push(_loc3_.id);
            _loc2_++;
         }
         this._catalog.sendRecycleItems(_loc1_);
         this._view.displayProcessingView();
      }
      
      private function get systemActive() : Boolean
      {
         return this.var_1591 != RecyclerStatusMessageEvent.const_893;
      }
      
      private function get statusActive() : Boolean
      {
         return this.var_553 != const_836;
      }
      
      public function getPrizeTable() : Array
      {
         if(this.var_705 == null)
         {
            this._catalog.getRecyclerPrizes();
            return null;
         }
         return this.var_705;
      }
      
      private function isPoolFull() : Boolean
      {
         if(this.var_103 == null)
         {
            return false;
         }
         if(this.var_103.length < const_181)
         {
            return false;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.var_103.length)
         {
            if(this.var_103[_loc1_] == null)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      public function storePrizeTable(param1:Array) : void
      {
         var _loc3_:* = null;
         this.var_705 = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new PrizeLevelContainer(param1[_loc2_],this._catalog);
            this.var_705.push(_loc3_);
            _loc2_++;
         }
      }
      
      public function dispose() : void
      {
         this.var_103 = null;
         this._catalog = null;
      }
      
      private function get ready() : Boolean
      {
         return this.active && this.var_553 == const_384;
      }
      
      public function getSlotContent(param1:int) : FurniSlotItem
      {
         if(this.var_103 == null)
         {
            return null;
         }
         if(param1 >= this.var_103.length)
         {
            return null;
         }
         return this.var_103[param1];
      }
      
      public function placeObjectAtSlot(param1:int, param2:int, param3:int, param4:int, param5:String) : void
      {
         var oldObjectData:FurniSlotItem = null;
         var newSlotId:int = 0;
         var slotId:int = param1;
         var id:int = param2;
         var category:int = param3;
         var typeId:int = param4;
         var xxxExtra:String = param5;
         if(!this.ready)
         {
            return;
         }
         if(this.var_103.length > 0)
         {
            oldObjectData = this.var_103[0];
            newSlotId = 0;
            while(oldObjectData != null && newSlotId < const_181)
            {
               oldObjectData = this.var_103[newSlotId];
               if(oldObjectData != null)
               {
                  newSlotId++;
               }
            }
            if(oldObjectData != null)
            {
               return;
            }
            slotId = newSlotId;
         }
         var itemId:int = this._catalog.requestInventoryFurniToRecycler();
         if(itemId == 0)
         {
            this._windowManager.alert("${generic.alert.title}","${recycler.alert.non.recyclable}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return;
         }
         this.var_103[slotId] = new FurniSlotItem(itemId,category,typeId,xxxExtra);
         this.updateRecyclerSlots();
         this.updateRecyclerButton();
      }
      
      private function isTradingActive() : Boolean
      {
         return this._catalog.tradingActive;
      }
      
      private function updateRecyclerSlots() : void
      {
         if(this._view == null || !this.statusActive)
         {
            return;
         }
         this._view.updateSlots();
      }
      
      public function activate() : void
      {
         if(this.systemActive)
         {
            this.var_553 = const_384;
         }
      }
      
      private function verifyRoomSessionStatus() : void
      {
         if(!this._catalog.privateRoomSessionActive && this.ready)
         {
            this._windowManager.alert("${generic.alert.title}","${recycler.alert.privateroom}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
         }
      }
      
      public function cancel() : void
      {
         this._catalog.setupInventoryForRecycler(false);
         var _loc1_:int = 0;
         while(_loc1_ < const_181)
         {
            this.releaseSlot(_loc1_);
            _loc1_++;
         }
         this.var_553 = const_836;
      }
      
      public function setFinished(param1:int, param2:int) : void
      {
         var status:int = param1;
         var prizeId:int = param2;
         if(!this.statusActive)
         {
            return;
         }
         this.var_553 = const_384;
         if(!this.systemActive)
         {
            return;
         }
         switch(status)
         {
            case RecyclerFinishedMessageEvent.const_997:
               if(this._view != null)
               {
                  this._view.displayFinishedView();
               }
               break;
            case RecyclerFinishedMessageEvent.const_1330:
               Logger.log("* Recycler finished with FAILURE");
               this._windowManager.alert("${generic.alert.title}","${recycler.info.closed}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               if(this._view != null)
               {
                  this._view.displayDisabledView();
               }
         }
         this._catalog.setupInventoryForRecycler(false);
      }
      
      public function releaseSlot(param1:int) : void
      {
         if(!this.ready)
         {
            return;
         }
         if(this.var_103[param1] == null)
         {
            return;
         }
         if(!this._catalog.returnInventoryFurniFromRecycler(this.var_103[param1].id))
         {
            return;
         }
         this.var_103[param1] = null;
         this.updateRecyclerSlots();
         this.updateRecyclerButton();
      }
      
      public function isReadyToRecycle() : Boolean
      {
         if(!this.ready || !this._catalog.privateRoomSessionActive)
         {
            return false;
         }
         if(this.isTradingActive())
         {
            this._windowManager.alert("${generic.alert.title}","${recycler.alert.trading}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return false;
         }
         return this.isPoolFull();
      }
   }
}
