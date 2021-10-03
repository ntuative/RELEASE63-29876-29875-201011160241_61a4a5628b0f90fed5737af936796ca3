package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2292:XML;
      
      private var var_1619:ITextWindow;
      
      private var var_1265:Function;
      
      private var var_1620:ITextWindow;
      
      private var var_2293:XML;
      
      private var var_827:IWindowContainer;
      
      private var var_2607:ITextWindow;
      
      private var var_2291:String = "";
      
      private var var_2645:IButtonWindow;
      
      private var var_2290:XML;
      
      private var var_1621:ITextWindow;
      
      private var var_79:Offer;
      
      private var var_558:IButtonWindow;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_514:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2293) as IWindowContainer;
               break;
            case Offer.const_760:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2290) as IWindowContainer;
               break;
            case Offer.const_617:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2292) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_79.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_827 != null)
            {
               _window.removeChild(this.var_827);
               this.var_827.dispose();
            }
            this.var_827 = _loc2_;
            _window.addChild(_loc2_);
            this.var_827.x = 0;
            this.var_827.y = 0;
         }
         this.var_1621 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_1620 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_1619 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2607 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_558 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_558 != null)
         {
            if(this.var_1265 != null)
            {
               this.var_558.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1265);
            }
            else
            {
               this.var_558.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1265);
               this.var_558.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_558.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_79 != null)
         {
            Logger.log("Init Purchase: " + this.var_79.offerId + " " + this.var_79.localizationId);
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_79,page.pageId,this.var_2291);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2293 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2290 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2292 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_1042,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_2291 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_79 = param1.offer;
         this.attachStub(this.var_79.priceType);
         if(this.var_1621 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_79.priceInCredits));
            this.var_1621.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_79.activityPointType == Purse.const_434 ? "pixels" : "activitypoints";
         if(this.var_1620 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_79.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_79.priceInActivityPoints.toString());
            this.var_1620.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_1619 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_79.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_79.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_79.priceInActivityPoints));
            this.var_1619.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_558 != null)
         {
            this.var_558.enable();
         }
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1265 = param1.callback;
      }
   }
}
