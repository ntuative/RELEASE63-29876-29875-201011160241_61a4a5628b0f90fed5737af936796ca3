package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.net.URLRequest;
   
   public class Quest
   {
       
      
      private var _id:int;
      
      private var _controller:QuestController;
      
      private var _view:IWindowContainer;
      
      private var var_1597:String;
      
      private var var_769:IWindow;
      
      private var var_335:int;
      
      private var var_1251:uint = 4.292927712E9;
      
      private var _type:String;
      
      private var var_1596:Date;
      
      private var var_473:QuestCampaign;
      
      private var var_1414:int;
      
      private var var_1413:int;
      
      private var var_173:Boolean = false;
      
      private var var_1252:uint = 4.2939804E9;
      
      public function Quest(param1:QuestMessageData, param2:QuestController, param3:QuestCampaign)
      {
         super();
         this._controller = param2;
         this.var_473 = param3;
         this._id = param1.id;
         this.update(param1);
      }
      
      private function find(param1:IWindowContainer, param2:String) : IWindow
      {
         var _loc3_:IWindow = param1.findChildByName(param2);
         if(_loc3_ == null)
         {
            throw new Error("Window element with name: " + param2 + " cannot be found!");
         }
         return _loc3_;
      }
      
      private function setText(param1:String, param2:String) : void
      {
         var _loc3_:IWindow = this._view.findChildByName(param1);
         if(_loc3_)
         {
            _loc3_.caption = param2;
         }
      }
      
      public function update(param1:QuestMessageData) : void
      {
         this.var_335 = param1.status;
         this._type = param1.type;
         this.var_1414 = param1.stuffId;
         this.var_1413 = param1.rewardCurrencyAmount;
         this.var_1596 = new Date();
         this.var_1596.setTime(param1.endDateTimeStamp);
         this.var_1597 = param1.localizationCode;
         this.updateView();
      }
      
      private function updateView() : void
      {
         switch(this.var_335)
         {
            case QuestStatusEnum.const_46:
               this._view = this._controller.questEngine.getXmlWindow("QuestEntityAccepted") as IWindowContainer;
               this.setIconFromAsset(["icon",this.var_473.id,"active"].join("_"));
               this.var_1251 = 4285836051;
               this.var_1252 = 4287941427;
               break;
            case QuestStatusEnum.const_889:
               this._view = this._controller.questEngine.getXmlWindow("QuestEntityAvailable") as IWindowContainer;
               this.var_1251 = 4285836051;
               this.var_1252 = 4287941427;
               break;
            case QuestStatusEnum.const_198:
               this._view = this._controller.questEngine.getXmlWindow("QuestEntityExpired") as IWindowContainer;
               break;
            case QuestStatusEnum.const_897:
               this._view = this._controller.questEngine.getXmlWindow("QuestEntityCompleted") as IWindowContainer;
               this.setIconFromAsset("icon_complete");
         }
         var _loc1_:String = ["quest",this.var_473.id,this.var_1597].join("_");
         var _loc2_:* = _loc1_ + ".title";
         var _loc3_:* = _loc1_ + ".short";
         this.setText("quest.title",_loc2_);
         this.setText("quest.short",_loc3_);
         var _loc4_:IWindow = this._view.findChildByTag("SELECTION_COLOR");
         if(_loc4_ != null)
         {
            this.var_769 = _loc4_;
         }
         else
         {
            this.var_769 = this._view;
         }
         this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.itemGridEventProc);
         this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.itemGridEventProc);
         this._view.addEventListener(WindowMouseEvent.const_25,this.itemGridEventProc);
      }
      
      private function setElementImage(param1:IBitmapWrapperWindow, param2:BitmapData) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param1.disposed)
         {
            return;
         }
         var _loc3_:int = (param1.width - param2.width) / 2;
         var _loc4_:int = (param1.height - param2.height) / 2;
         if(param1.bitmap == null)
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,16777215);
         }
         param1.bitmap.fillRect(param1.bitmap.rect,16777215);
         param1.bitmap.copyPixels(param2,param2.rect,new Point(_loc3_,_loc4_),null,null,false);
         param1.invalidate();
         this._controller.updateListView();
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      private function itemGridEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this._controller.activateListItem(this);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            if(!this.var_173)
            {
               this.var_769.color = this.var_1252;
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(!this.var_173)
            {
               this.var_769.color = this.var_1251;
            }
         }
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            this.setIconFromAsset(_loc2_.assetName);
         }
      }
      
      public function get selected() : Boolean
      {
         return this.var_173;
      }
      
      public function get stuffId() : int
      {
         return this.var_1414;
      }
      
      public function dispose() : void
      {
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      private function retrievePreviewAsset(param1:String) : void
      {
         if(!param1 || !this._controller.questEngine || !this._controller.questEngine.assets)
         {
            return;
         }
         var _loc2_:String = this._controller.questEngine.configuration.getKey("image.library.questing.url");
         var _loc3_:* = _loc2_ + param1 + ".png";
         Logger.log("[Quest] Retrieve Product Preview Asset: " + _loc3_);
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         var _loc5_:AssetLoaderStruct = this._controller.questEngine.assets.loadAssetFromFile(param1,_loc4_,"image/png");
         if(!_loc5_)
         {
            return;
         }
         _loc5_.addEventListener(AssetLoaderEvent.const_30,this.onPreviewImageReady);
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function get localizationCode() : String
      {
         return this.var_1597;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1413;
      }
      
      public function get endDate() : Date
      {
         return this.var_1596;
      }
      
      private function setIconFromAsset(param1:String) : void
      {
         if(!param1 || !this._controller.questEngine || !this._controller.questEngine.assets)
         {
            return;
         }
         var _loc2_:BitmapDataAsset = this._controller.questEngine.assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ == null)
         {
            this.retrievePreviewAsset(param1);
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this.find(this._view,"icon") as IBitmapWrapperWindow;
         if(_loc3_)
         {
            this.setElementImage(_loc3_,_loc2_.content as BitmapData);
         }
      }
      
      public function get status() : int
      {
         return this.var_335;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.var_173 = param1;
         if(this.var_173)
         {
            this.var_769.color = this.var_1252;
         }
         else
         {
            this.var_769.color = this.var_1251;
         }
      }
      
      private function setVisible(param1:String, param2:Boolean) : void
      {
         var _loc3_:IWindow = this._view.findChildByName(param1);
         if(_loc3_)
         {
            _loc3_.visible = param2;
         }
      }
   }
}
