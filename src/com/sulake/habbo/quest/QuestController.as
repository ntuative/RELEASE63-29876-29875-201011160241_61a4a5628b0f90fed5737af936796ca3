package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.ActivateQuestMessageComposer;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import com.sulake.habbo.quest.enum.QuestTypeEnum;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.net.URLRequest;
   
   public class QuestController implements IGetImageListener
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_234:Quest;
      
      private var _window:IFrameWindow;
      
      private var var_2614:IItemListWindow;
      
      private var var_473:QuestCampaign;
      
      private var var_379:Array;
      
      private var var_1732:int;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         this.var_379 = [];
         super();
         this._questEngine = param1;
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
      }
      
      public function get questEngine() : HabboQuestEngine
      {
         return this._questEngine;
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      public function updateListView() : void
      {
         var _loc1_:IItemListWindow = this._window.findChildByName("quests") as IItemListWindow;
         _loc1_.invalidate();
      }
      
      private function setImageFromAsset(param1:String) : void
      {
         if(!param1 || !this._questEngine || !this._questEngine.assets)
         {
            return;
         }
         var _loc2_:BitmapDataAsset = this._questEngine.assets.getAssetByName(param1) as BitmapDataAsset;
         if(_loc2_ == null)
         {
            this.retrievePreviewAsset(param1);
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this.find("quest.image") as IBitmapWrapperWindow;
         if(_loc3_)
         {
            this.setElementImage(_loc3_,_loc2_.content as BitmapData);
         }
      }
      
      private function onActivateQuest(param1:Event, param2:IWindow = null) : void
      {
         if(this.var_234)
         {
            this._questEngine.communication.getHabboMainConnection(null).send(new ActivateQuestMessageComposer(this.var_234.id));
         }
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            this.setImageFromAsset(_loc2_.assetName);
         }
      }
      
      private function reset() : void
      {
         var _loc1_:* = null;
         if(this.var_379)
         {
            for each(_loc1_ in this.var_379)
            {
               _loc1_.dispose();
            }
            this.var_379 = null;
         }
         if(this.var_473)
         {
            this.var_473.dispose();
            this.var_473 = null;
         }
         this.var_234 = null;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            this._window.visible = true;
            return;
         }
         this._window = IFrameWindow(this._questEngine.getXmlWindow("QuestEngine"));
         this._window.findChildByTag("close").procedure = this.onWindowClose;
         this._window.center();
         this.var_2614 = this.find("quest.container") as IItemListWindow;
         var _loc1_:IWindow = this.find("quest.button.accept");
         if(_loc1_)
         {
            _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onActivateQuest);
         }
      }
      
      public function questCompleted(param1:String, param2:QuestMessageData) : void
      {
         this._questEngine.windowManager.confirm("Quest Completed","Campaign: " + param1 + "\n" + "Quest: " + param2.id,0,this.onConfirm);
      }
      
      private function onConfirm(param1:IConfirmDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function activateListItem(param1:Quest) : void
      {
         var _loc22_:* = null;
         if(this.var_234 != null)
         {
            this.var_234.selected = false;
         }
         this.var_234 = param1;
         this.var_234.selected = true;
         if(this.var_234.type == QuestTypeEnum.FIND_STUFF)
         {
            _loc22_ = this._questEngine.roomEngine.getFurnitureImage(this.var_234.stuffId,new Vector3d(90,0,0),64,this,"");
            this.var_1732 = _loc22_.id;
         }
         else
         {
            this.var_1732 = -1;
            this.setElementImage(this.find("quest.image") as IBitmapWrapperWindow,new BitmapData(1,1,true));
         }
         var _loc2_:String = ["quest",this.var_473.id,this.var_234.localizationCode].join("_");
         var _loc3_:String = ["quest_" + this.var_473.id,"type_" + this.var_234.type].join(".");
         var _loc4_:String = "quest_" + this.var_473.id;
         var _loc5_:* = _loc2_ + ".title";
         var _loc6_:* = _loc2_ + ".short";
         var _loc7_:* = _loc2_ + ".desc";
         this.setText("quest.header.title",_loc5_);
         this.setText("quest.header.short",_loc6_);
         this.setText("quest.description",_loc7_);
         var _loc8_:* = _loc3_ + ".requirement";
         var _loc9_:* = _loc3_ + ".success";
         var _loc10_:* = _loc3_ + ".available";
         var _loc11_:* = _loc3_ + ".accepted";
         var _loc12_:* = _loc3_ + ".expired";
         var _loc13_:* = _loc3_ + ".completed";
         var _loc14_:IWindow = this.find("quest.button.accept");
         var _loc15_:IWindow = this.find("quest.status");
         _loc14_.visible = false;
         _loc15_.visible = false;
         switch(this.var_234.status)
         {
            case QuestStatusEnum.const_889:
               _loc14_.visible = true;
               break;
            case QuestStatusEnum.const_46:
               this.setText("quest.status",_loc11_);
               _loc15_.visible = true;
               break;
            case QuestStatusEnum.const_198:
               this.setText("quest.status",_loc12_);
               _loc15_.visible = true;
               break;
            case QuestStatusEnum.const_897:
               this.setText("quest.status",_loc13_);
               _loc15_.visible = true;
         }
         this.setText("quest.requirement",_loc8_);
         var _loc16_:* = _loc4_ + ".reward.title";
         var _loc17_:* = _loc4_ + ".reward.desc";
         var _loc18_:* = _loc4_ + ".currency";
         this.setText("quest.reward.title",_loc16_);
         this.setText("quest.reward.desc",_loc17_);
         this.setText("currency.amount",_loc18_);
         this.setText("quest.available","quest.available");
         var _loc19_:IBitmapWrapperWindow = this.find("quest.header.img") as IBitmapWrapperWindow;
         var _loc20_:IBitmapWrapperWindow = this.find("quest.image") as IBitmapWrapperWindow;
         var _loc21_:IBitmapWrapperWindow = this.find("quest.reward.icon") as IBitmapWrapperWindow;
      }
      
      public function isVisible() : Boolean
      {
         return this._window != null && this._window.visible;
      }
      
      public function questAccepted(param1:String, param2:QuestMessageData) : void
      {
         var _loc3_:* = null;
         this._questEngine.windowManager.confirm("Quest Accepted","Campaign: " + param1 + "\n" + "Quest: " + param2.id,0,this.onConfirm);
         for each(_loc3_ in this.var_379)
         {
            if(_loc3_.id == param2.id)
            {
               _loc3_.update(param2);
               if(this.var_234 == _loc3_)
               {
                  this.activateListItem(_loc3_);
               }
            }
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         if(this.var_1732 == param1)
         {
            _loc3_ = this.find("quest.image") as IBitmapWrapperWindow;
            if(_loc3_)
            {
               this.setElementImage(_loc3_,param2);
            }
         }
      }
      
      private function retrievePreviewAsset(param1:String) : void
      {
         if(!param1 || !this._questEngine || !this._questEngine.assets)
         {
            return;
         }
         var _loc2_:String = this._questEngine.configuration.getKey("image.library.questing.url");
         var _loc3_:* = _loc2_ + param1 + ".png";
         Logger.log("[Quest] Retrieve Product Preview Asset: " + _loc3_);
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         var _loc5_:AssetLoaderStruct = this._questEngine.assets.loadAssetFromFile(param1,_loc4_,"image/png");
         if(!_loc5_)
         {
            return;
         }
         _loc5_.addEventListener(AssetLoaderEvent.const_30,this.onPreviewImageReady);
      }
      
      private function setText(param1:String, param2:String) : void
      {
         var _loc3_:IWindow = this.find(param1);
         if(_loc3_)
         {
            _loc3_.caption = param2;
         }
      }
      
      public function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:* = null;
         _loc2_ = IWindowContainer(this._window).findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function openCampaign(param1:String, param2:Array) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.prepareWindow();
         this.reset();
         this.var_473 = new QuestCampaign(param1);
         this.var_379 = [];
         for each(_loc3_ in param2)
         {
            this.var_379.push(new Quest(_loc3_,this,this.var_473));
         }
         _loc4_ = this._window.findChildByName("quests") as IItemListWindow;
         for each(_loc5_ in this.var_379)
         {
            _loc4_.addListItem(_loc5_.view);
         }
         if(this.var_379.length > 0)
         {
            this.activateListItem(this.var_379[0]);
         }
         var _loc6_:String = "quest_" + this.var_473.id;
         var _loc7_:* = _loc6_ + ".title";
         this._window.caption = _loc7_;
      }
   }
}
