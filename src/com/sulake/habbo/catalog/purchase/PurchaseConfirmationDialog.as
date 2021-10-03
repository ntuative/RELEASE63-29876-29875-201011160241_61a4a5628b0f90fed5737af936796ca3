package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.club.ClubBuyOfferData;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.communication.messages.parser.catalog.IsOfferGiftableMessageParser;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.ui.Keyboard;
   
   public class PurchaseConfirmationDialog implements IGetImageListener
   {
       
      
      private var var_2356:String = "";
      
      private var var_1604:Array;
      
      private var var_681:Array;
      
      private var _window:IFrameWindow;
      
      private const const_1518:uint = 4.294967295E9;
      
      private const const_1519:uint = 4.293848814E9;
      
      private var var_1285:int;
      
      private const const_1779:uint = 4.291613146E9;
      
      private var var_316:int = -1;
      
      private var var_228:IWindowContainer;
      
      private var var_1284:String;
      
      private var var_569:IWindowContainer;
      
      private var var_317:int;
      
      private var var_1041:int;
      
      private var _pageId:int;
      
      private var var_2610:Boolean = false;
      
      private var var_2609:int = 0;
      
      private var var_682:Array;
      
      private const const_1780:int = 10;
      
      private var var_207:Array;
      
      private var _catalog:HabboCatalog;
      
      private var var_79:IPurchasableOffer;
      
      private var var_1663:Boolean;
      
      private var var_315:int;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_1664:Boolean;
      
      public function PurchaseConfirmationDialog(param1:ICoreLocalizationManager)
      {
         this.var_681 = [];
         this.var_682 = [];
         super();
         this._localization = param1;
      }
      
      public function receiverNotFound() : void
      {
         this.enableGiftButton(true);
         if(!this._catalog || !this._catalog.windowManager)
         {
            return;
         }
         this._catalog.windowManager.alert("${catalog.gift_wrapping.receiver_not_found.title}","${catalog.gift_wrapping.receiver_not_found.info}",0,this.alertHandler);
      }
      
      public function notEnoughCredits() : void
      {
         if(this._window == null)
         {
            return;
         }
         this.enableGiftButton(true);
         var _loc1_:ICheckBoxWindow = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ != null)
         {
            _loc1_.select();
         }
      }
      
      private function checkboxHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowEvent.const_421:
               this.showSelectors(false);
               break;
            case WindowEvent.const_707:
               this.showSelectors(true);
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(this._catalog.windowManager == null || this._catalog.assets == null)
         {
            return null;
         }
         var _loc2_:XmlAsset = this._catalog.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return null;
         }
         return this._catalog.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function alertHandler(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
         this.enableGiftButton(true);
      }
      
      private function setImage(param1:BitmapData, param2:Boolean) : void
      {
         if(this._window == null || param1 == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.bitmap != null)
         {
            _loc3_.bitmap.dispose();
            _loc3_.bitmap = null;
         }
         if(_loc3_.bitmap == null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         }
         var _loc4_:int = (_loc3_.width - param1.width) * 0.5;
         var _loc5_:int = (_loc3_.height - param1.height) * 0.5;
         _loc3_.bitmap.draw(param1,new Matrix(1,0,0,1,_loc4_,_loc5_));
         if(param2)
         {
            param1.dispose();
         }
      }
      
      private function suggestionsEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         _loc3_ = param2 as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               _loc4_ = _loc3_.findChildByName("name_text") as ITextWindow;
               if(_loc4_ == null)
               {
                  return;
               }
               this.setReceiverName(_loc4_.text);
               this.showSuggestions(false);
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc5_ = this.var_228.findChildByName("suggestion_list") as IItemListWindow;
               if(_loc5_ == null)
               {
                  return;
               }
               this.highlightSuggestion(_loc5_.getListItemIndex(_loc3_));
               break;
         }
      }
      
      private function updateColorGrid() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = this._window.findChildByName("color_grid") as IItemGridWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.numGridItems)
         {
            _loc2_ = _loc1_.getGridItemAt(_loc4_) as IWindowContainer;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.findChildByName("selection") as IBitmapWrapperWindow;
               if(_loc3_ != null)
               {
                  _loc3_.visible = _loc2_.id == this.var_1041;
               }
            }
            _loc4_++;
         }
      }
      
      private function setReceiverName(param1:String) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = this._window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         this.focusMessageField();
      }
      
      public function onIsOfferGiftable(param1:IsOfferGiftableMessageParser) : void
      {
         if(this.var_79 == null || this.var_79.offerId != param1.offerId)
         {
            return;
         }
         this.setGiftButtonState(param1.isGiftable);
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(param1 == this.var_1285)
         {
            this.var_1285 = 0;
            this.setImage(param2,true);
         }
      }
      
      private function focusMessageField() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         _loc1_.focus();
      }
      
      private function showMessageInput(param1:Boolean) : void
      {
         var _loc2_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      private function updateLocalizations() : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:IProductData = this._catalog.getProductData(this.var_79.localizationId);
         var _loc2_:String = _loc1_ == null ? "" : _loc1_.name;
         this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","offer_name",_loc2_);
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc7_:String = this._catalog.getPurse().credits.toString();
         var _loc8_:String = this.var_79.activityPointType == Purse.const_434 ? "pixels" : "activitypoints";
         switch(this.var_79.priceType)
         {
            case Offer.const_514:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.credits";
               _loc5_ = this._localization.getLocalization(_loc6_);
               this._localization.registerParameter(_loc6_,"credits",this.var_79.priceInCredits.toString());
               _loc3_ = _loc5_.value;
               this._localization.registerParameter(_loc6_,"credits",_loc7_);
               _loc4_ = _loc5_.value;
               break;
            case Offer.const_617:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.credits+activitypoints." + this.var_79.activityPointType;
               _loc5_ = this._localization.getLocalization(_loc6_);
               this._localization.registerParameter(_loc6_,"credits",this.var_79.priceInCredits.toString());
               this._localization.registerParameter(_loc6_,_loc8_,this.var_79.priceInActivityPoints.toString());
               _loc3_ = _loc5_.value;
               this._localization.registerParameter(_loc6_,"credits",_loc7_);
               this._localization.registerParameter(_loc6_,_loc8_,this._catalog.getPurse().getActivityPointsForType(this.var_79.activityPointType).toString());
               _loc4_ = _loc5_.value;
               break;
            case Offer.const_760:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.activitypoints." + this.var_79.activityPointType;
               _loc5_ = this._localization.getLocalization(_loc6_);
               this._localization.registerParameter(_loc6_,_loc8_,this.var_79.priceInActivityPoints.toString());
               _loc3_ = _loc5_.value;
               this._localization.registerParameter(_loc6_,_loc8_,this._catalog.getPurse().getActivityPointsForType(this.var_79.activityPointType).toString());
               _loc4_ = _loc5_.value;
               break;
            case Offer.const_985:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.nothing";
               _loc5_ = this._localization.getLocalization(_loc6_);
               _loc3_ = _loc5_.value;
               this._localization.registerParameter(_loc6_,"credits",_loc7_);
               _loc4_ = _loc5_.value;
         }
         this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","price",_loc3_);
         this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.amount","amount",_loc4_);
      }
      
      private function showSuggestions(param1:Boolean) : void
      {
         if(this.var_228 == null)
         {
            return;
         }
         this.var_228.visible = param1;
         if(!param1)
         {
            this.showMessageInput(true);
         }
      }
      
      private function toggleCheckbox() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ICheckBoxWindow = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.isSelected)
         {
            _loc1_.unselect();
         }
         else
         {
            _loc1_.select();
         }
      }
      
      private function getColor(param1:int) : uint
      {
         return param1 % 2 == 0 ? uint(this.const_1519) : uint(this.const_1518);
      }
      
      private function updatePreview() : void
      {
         var _loc3_:* = null;
         if(this.var_315 < 0)
         {
            this.var_315 = this.var_681.length - 1;
         }
         if(this.var_315 > this.var_681.length - 1)
         {
            this.var_315 = 0;
         }
         if(this.var_317 < 0)
         {
            this.var_317 = this.var_682.length - 1;
         }
         if(this.var_317 > this.var_682.length - 1)
         {
            this.var_317 = 0;
         }
         var _loc1_:int = this.var_682[this.var_317] * 1000 + this.var_681[this.var_315];
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IRoomEngine = this.var_79.page.viewer.roomEngine;
         _loc3_ = _loc2_.getFurnitureImage(this.var_1041,new Vector3d(180),64,this,_loc1_.toString());
         if(_loc3_ == null)
         {
            return;
         }
         this.var_1285 = _loc3_.id;
         this.setImage(_loc3_.data,true);
         this.showSuggestions(false);
      }
      
      private function messageInputHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.const_40:
               if(this.var_1663)
               {
                  _loc3_ = param2 as ITextFieldWindow;
                  if(_loc3_)
                  {
                     _loc3_.text = "";
                     this.var_1663 = false;
                  }
               }
               break;
            case WindowEvent.const_270:
               this.showSuggestions(false);
         }
      }
      
      private function reset() : void
      {
         this.var_79 = null;
         this._pageId = -1;
         this.var_1284 = "";
         this.var_2609 = 0;
         this.var_2610 = false;
         this.var_207 = null;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_228 = null;
         if(this.var_569 != null)
         {
            this.var_569.dispose();
            this.var_569 = null;
         }
      }
      
      private function confirmationHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "gift_button":
               this.showGiftDialog();
               break;
            case "buy_button":
               this._catalog.purchaseProduct(this._pageId,this.var_79.offerId,this.var_1284);
               this.dispose();
               break;
            case "cancel_button":
            case "header_button_close":
               this.dispose();
         }
      }
      
      public function dispose() : void
      {
         this.reset();
      }
      
      private function showConfirmationDialog() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(this._catalog == null)
         {
            return;
         }
         if(this._window != null)
         {
            this._window.dispose();
         }
         this.updateLocalizations();
         this._window = this.createWindow("purchase_confirmation") as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.procedure = this.confirmationHandler;
         this.setGiftButtonState(false);
         this._window.center();
         var _loc1_:ITextWindow = this._window.findChildByName("product_name") as ITextWindow;
         if(_loc1_ != null)
         {
            _loc3_ = this._catalog.getProductData(this.var_79.localizationId);
            _loc1_.text = _loc3_ == null ? "" : _loc3_.name;
         }
         var _loc2_:IBitmapWrapperWindow = this._window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc4_ = this.var_79.page.viewer.roomEngine;
            _loc7_ = 0;
            _loc8_ = "";
            _loc9_ = "";
            if(this.var_79 is Offer)
            {
               _loc10_ = this.var_79.productContainer.firstProduct;
               _loc9_ = _loc10_.productType;
               _loc7_ = _loc10_.productClassId;
               _loc8_ = _loc10_.extraParam;
            }
            else if(this.var_79 is ClubBuyOfferData)
            {
               _loc9_ = "null";
            }
            switch(_loc9_)
            {
               case ProductTypeEnum.const_86:
                  _loc5_ = _loc4_.getFurnitureIcon(_loc7_,this);
                  break;
               case ProductTypeEnum.const_77:
                  _loc5_ = _loc4_.getWallItemIcon(_loc7_,this,_loc8_);
                  break;
               case ProductTypeEnum.const_210:
                  _loc6_ = this._catalog.getPixelEffectIcon(_loc7_);
                  break;
               case ProductTypeEnum.const_368:
                  _loc6_ = this._catalog.getSubscriptionProductIcon(_loc7_);
            }
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.data;
               this.var_1285 = _loc5_.id;
            }
            this.setImage(_loc6_,true);
         }
      }
      
      public function showOffer(param1:IHabboCatalog, param2:IPurchasableOffer, param3:int, param4:String = "", param5:Array = null) : void
      {
         this.var_79 = param2;
         this._pageId = param3;
         this._catalog = param1 as HabboCatalog;
         this.var_1284 = param4;
         this.var_207 = param5;
         this.showConfirmationDialog();
      }
      
      private function giveGift() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:String = _loc1_.text;
         var _loc3_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         var _loc4_:String = _loc3_ == null ? "" : _loc3_.text;
         var _loc5_:ICheckBoxWindow = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         var _loc6_:Boolean = _loc5_ == null ? false : Boolean(_loc5_.isSelected);
         var _loc7_:int = !!_loc6_ ? 0 : int(this.var_1041);
         var _loc8_:int = !!_loc6_ ? 0 : int(this.var_682[this.var_317]);
         var _loc9_:int = !!_loc6_ ? 0 : int(this.var_681[this.var_315]);
         this._catalog.purchaseProductAsGift(this._pageId,this.var_79,this.var_1284,_loc2_,_loc4_,_loc7_,_loc8_,_loc9_);
      }
      
      private function nameInputHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowEvent.const_110:
               _loc3_ = param1.window as ITextFieldWindow;
               if(_loc3_ == null)
               {
                  return;
               }
               if(this.var_2356 == _loc3_.text)
               {
                  return;
               }
               _loc4_ = _loc3_.text.toLowerCase();
               _loc5_ = [];
               for each(_loc7_ in this.var_207)
               {
                  if(_loc7_.toLowerCase().search(_loc4_) != -1)
                  {
                     _loc5_.push(_loc7_);
                  }
                  if(_loc5_.length >= this.const_1780)
                  {
                     break;
                  }
               }
               this.updateSuggestions(_loc5_);
               this.var_2356 = _loc3_.text;
               break;
            case WindowMouseEvent.const_40:
               this.showSuggestions(false);
               if(this.var_1664)
               {
                  _loc3_ = param2 as ITextFieldWindow;
                  if(_loc3_)
                  {
                     _loc3_.text = "";
                     this.var_1664 = false;
                  }
               }
               break;
            case WindowKeyboardEvent.const_612:
               _loc6_ = param1 as WindowKeyboardEvent;
               switch(_loc6_.keyCode)
               {
                  case Keyboard.UP:
                     this.highlightSuggestion(this.var_316 - 1);
                     break;
                  case Keyboard.DOWN:
                     this.highlightSuggestion(this.var_316 + 1);
                     break;
                  case Keyboard.ENTER:
                     this.selectHighlighted();
                     break;
                  case Keyboard.TAB:
                     this.focusMessageField();
               }
         }
      }
      
      private function enableGiftButton(param1:Boolean) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = this._window.findChildByName("give_gift_button") as IButtonWindow;
         if(_loc2_ != null)
         {
            if(param1)
            {
               _loc2_.enable();
            }
            else
            {
               _loc2_.disable();
            }
         }
      }
      
      private function highlightSuggestion(param1:int) : void
      {
         var _loc3_:* = null;
         if(this.var_228 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = this.var_228.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc3_ = _loc2_.getListItemAt(this.var_316) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = this.getColor(this.var_316);
         }
         this.var_316 = param1;
         if(this.var_316 < 0)
         {
            this.var_316 = _loc2_.numListItems - 1;
         }
         if(this.var_316 >= _loc2_.numListItems)
         {
            this.var_316 = 0;
         }
         _loc3_ = _loc2_.getListItemAt(this.var_316) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = this.const_1779;
         }
      }
      
      private function setGiftButtonState(param1:Boolean) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = IButtonWindow(this._window.findChildByName("gift_button"));
         if(param1)
         {
            _loc2_.enable();
         }
         else
         {
            _loc2_.disable();
         }
      }
      
      private function wrappingHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "give_gift_button":
               this.giveGift();
               this.enableGiftButton(false);
               break;
            case "cancel_gifting_button":
            case "header_button_close":
               this.dispose();
               break;
            case "ribbon_prev":
               --this.var_315;
               this.updatePreview();
               break;
            case "ribbon_next":
               ++this.var_315;
               this.updatePreview();
               break;
            case "box_prev":
               --this.var_317;
               this.updatePreview();
               break;
            case "box_next":
               ++this.var_317;
               this.updatePreview();
               break;
            case "use_free_text":
               this.toggleCheckbox();
         }
      }
      
      private function showGiftDialog() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this._window != null)
         {
            this._window.dispose();
         }
         var _loc1_:GiftWrappingConfiguration = this._catalog.giftWrappingConfiguration;
         var _loc2_:String = !!_loc1_.isEnabled ? "gift_wrapping" : "gift_no_wrapping";
         this._window = this.createWindow(_loc2_) as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.center();
         this._window.procedure = this.wrappingHandler;
         _loc3_ = this._window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc3_ != null)
         {
            _loc3_.procedure = this.nameInputHandler;
         }
         _loc3_ = this._window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc3_ != null)
         {
            _loc3_.procedure = this.messageInputHandler;
         }
         this.var_1664 = true;
         this.var_1663 = true;
         if(_loc1_.isEnabled)
         {
            _loc4_ = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
            if(_loc4_ != null)
            {
               _loc4_.procedure = this.checkboxHandler;
            }
            this._localization.registerParameter("catalog.gift_wrapping.price","price",_loc1_.price.toString());
            this.var_1604 = _loc1_.stuffTypes;
            this.var_682 = _loc1_.boxTypes;
            this.var_681 = _loc1_.ribbonTypes;
            this.var_1041 = this.var_1604[0];
            this.var_317 = this.var_682[0];
            this.var_315 = this.var_681[0];
            this.initColorGrid();
            this.updateColorGrid();
            this.updatePreview();
         }
      }
      
      private function colorHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1041 = param2.id;
         this.updateColorGrid();
         this.updatePreview();
      }
      
      private function showSelectors(param1:Boolean) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = this._window.findChildByName("mask") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = !param1;
      }
      
      private function setBitmapData(param1:IWindowContainer, param2:String, param3:String, param4:ColorTransform = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc5_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:BitmapDataAsset = this._catalog.assets.getAssetByName(param3) as BitmapDataAsset;
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:BitmapData = _loc6_.content as BitmapData;
         if(_loc7_ == null)
         {
            return;
         }
         if(_loc5_.bitmap == null)
         {
            _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         }
         _loc5_.bitmap.draw(_loc7_,null,param4);
      }
      
      private function initColorGrid() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = this._window.findChildByName("color_grid") as IItemGridWindow;
         _loc1_.destroyGridItems();
         var _loc2_:IWindowContainer = this.createWindow("gift_palette_item") as IWindowContainer;
         _loc2_.procedure = this.colorHandler;
         var _loc3_:Array = this.var_1604;
         for each(_loc6_ in _loc3_)
         {
            _loc4_ = this._catalog.getFurnitureData(_loc6_,ProductTypeEnum.const_86);
            _loc5_ = _loc2_.clone() as IWindowContainer;
            if(!(!_loc4_ || !_loc5_))
            {
               _loc7_ = uint(_loc4_.colours[0]);
               _loc8_ = (_loc7_ >> 16 & 255) / 255;
               _loc9_ = (_loc7_ >> 8 & 255) / 255;
               _loc10_ = (_loc7_ & 255) / 255;
               _loc11_ = new ColorTransform(_loc8_,_loc9_,_loc10_);
               this.setBitmapData(_loc5_,"border","ctlg_clr_27x22_1");
               this.setBitmapData(_loc5_,"color","ctlg_clr_27x22_2",_loc11_);
               this.setBitmapData(_loc5_,"selection","ctlg_clr_27x22_3");
               _loc5_.id = _loc6_;
               _loc1_.addGridItem(_loc5_);
            }
         }
      }
      
      private function selectHighlighted() : void
      {
         if(this.var_228 == null || !this.var_228.visible)
         {
            return;
         }
         var _loc1_:IItemListWindow = this.var_228.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = _loc1_.getListItemAt(this.var_316) as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _loc2_.findChildByName("name_text") as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         this.setReceiverName(_loc3_.text);
         this.showSuggestions(false);
      }
      
      private function updateSuggestions(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_228 == null)
         {
            this.var_228 = this._window.findChildByName("suggestion_container") as IWindowContainer;
         }
         if(this.var_569 == null)
         {
            this.var_569 = this.createWindow("suggestion_list_item") as IWindowContainer;
            this.var_569.procedure = this.suggestionsEventHandler;
         }
         if(this.var_228 == null || this.var_569 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = this.var_228.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeListItems();
         if(param1.length == 0)
         {
            this.showSuggestions(false);
            return;
         }
         this.showSuggestions(true);
         var _loc3_:int = 0;
         for each(_loc4_ in param1)
         {
            _loc5_ = this.var_569.clone() as IWindowContainer;
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.findChildByName("name_text") as ITextWindow;
               if(_loc6_ != null)
               {
                  _loc6_.text = _loc4_;
                  _loc2_.addListItem(_loc5_);
               }
               _loc5_.color = this.getColor(_loc3_);
               _loc3_++;
            }
         }
         this.showMessageInput(param1.length < 2);
         this.highlightSuggestion(0);
      }
   }
}
