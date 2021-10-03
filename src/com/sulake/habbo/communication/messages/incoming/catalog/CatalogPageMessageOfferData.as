package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1098:int;
      
      private var var_923:Array;
      
      private var var_1097:int;
      
      private var var_1757:String;
      
      private var _offerId:int;
      
      private var var_1758:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1757 = param1.readString();
         this.var_1097 = param1.readInteger();
         this.var_1098 = param1.readInteger();
         this.var_1758 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_923 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_923.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1098;
      }
      
      public function get products() : Array
      {
         return this.var_923;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1097;
      }
      
      public function get localizationId() : String
      {
         return this.var_1757;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1758;
      }
   }
}
