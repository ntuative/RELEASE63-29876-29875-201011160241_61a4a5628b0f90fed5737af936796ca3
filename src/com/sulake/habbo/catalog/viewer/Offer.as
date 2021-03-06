package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_760:String = "price_type_activitypoints";
      
      public static const const_617:String = "price_type_credits_and_activitypoints";
      
      public static const const_985:String = "price_type_none";
      
      public static const const_486:String = "pricing_model_multi";
      
      public static const const_514:String = "price_type_credits";
      
      public static const const_454:String = "pricing_model_bundle";
      
      public static const const_501:String = "pricing_model_single";
      
      public static const const_1362:String = "pricing_model_unknown";
       
      
      private var var_1098:int;
      
      private var var_1097:int;
      
      private var _offerId:int;
      
      private var var_1758:int;
      
      private var var_704:String;
      
      private var var_1099:String;
      
      private var var_392:ICatalogPage;
      
      private var var_2465:int;
      
      private var var_703:IProductContainer;
      
      private var var_1757:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1757 = param1.localizationId;
         this.var_1097 = param1.priceInCredits;
         this.var_1098 = param1.priceInActivityPoints;
         this.var_1758 = param1.activityPointType;
         this.var_392 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1098;
      }
      
      public function get pricingModel() : String
      {
         return this.var_704;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_392;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2465 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_703;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1757;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1757 = "";
         this.var_1097 = 0;
         this.var_1098 = 0;
         this.var_1758 = 0;
         this.var_392 = null;
         if(this.var_703 != null)
         {
            this.var_703.dispose();
            this.var_703 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2465;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1758;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1097;
      }
      
      public function get priceType() : String
      {
         return this.var_1099;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_704)
         {
            case const_501:
               this.var_703 = new SingleProductContainer(this,param1);
               break;
            case const_486:
               this.var_703 = new MultiProductContainer(this,param1);
               break;
            case const_454:
               this.var_703 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_704);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_704 = const_501;
            }
            else
            {
               this.var_704 = const_486;
            }
         }
         else if(param1.length > 1)
         {
            this.var_704 = const_454;
         }
         else
         {
            this.var_704 = const_1362;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1097 > 0 && this.var_1098 > 0)
         {
            this.var_1099 = const_617;
         }
         else if(this.var_1097 > 0)
         {
            this.var_1099 = const_514;
         }
         else if(this.var_1098 > 0)
         {
            this.var_1099 = const_760;
         }
         else
         {
            this.var_1099 = const_985;
         }
      }
   }
}
