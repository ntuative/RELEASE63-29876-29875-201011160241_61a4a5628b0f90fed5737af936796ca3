package com.sulake.habbo.help.help.data
{
   import com.sulake.core.utils.Map;
   
   public class FaqCategory
   {
       
      
      private var var_1896:int = 0;
      
      private var var_146:Map;
      
      private var var_1331:int;
      
      private var var_1729:Date;
      
      private var var_2514:String;
      
      private var var_1504:String;
      
      public function FaqCategory(param1:int, param2:String)
      {
         super();
         this.var_146 = new Map();
         this.var_1331 = param1;
         this.var_2514 = param2;
      }
      
      public function get categoryId() : int
      {
         return this.var_1331;
      }
      
      public function get categoryTitle() : String
      {
         return this.var_2514;
      }
      
      public function get description() : String
      {
         return this.var_1504;
      }
      
      public function getAgeSeconds() : Number
      {
         if(this.var_1729 == null)
         {
            return new Date().valueOf();
         }
         return (new Date().valueOf() - this.var_1729.valueOf()) / 1000;
      }
      
      public function hasContent() : Boolean
      {
         return this.var_146.length > 0 || this.hasUpdatedWithinHour();
      }
      
      public function hasItem(param1:int) : Boolean
      {
         return this.var_146.getValue(param1) != null;
      }
      
      public function reset() : void
      {
         if(this.var_146 != null)
         {
            this.var_146.reset();
         }
      }
      
      public function getItem(param1:int) : FaqItem
      {
         return this.var_146.getValue(param1);
      }
      
      public function storeItem(param1:int, param2:String, param3:String = null) : void
      {
         var _loc4_:FaqItem = this.getItem(param1);
         if(_loc4_ == null)
         {
            _loc4_ = new FaqItem(param1,param2,this.var_146.length,this);
            this.var_146.add(param1,_loc4_);
         }
      }
      
      public function getItemIdByIndex(param1:int) : int
      {
         var _loc2_:FaqItem = this.getItemByIndex(param1);
         if(_loc2_ == null)
         {
            return -1;
         }
         return _loc2_.questionId;
      }
      
      public function getQuestionTitleArray() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this.var_146.length)
         {
            _loc2_ = this.var_146.getWithIndex(_loc3_);
            _loc1_.push(_loc2_.questionText);
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
         if(this.var_146 != null)
         {
            this.var_146.dispose();
            this.var_146 = null;
         }
      }
      
      public function getItemIndex(param1:int) : int
      {
         var _loc2_:FaqItem = this.getItem(param1);
         if(_loc2_ == null)
         {
            return -1;
         }
         return _loc2_.index;
      }
      
      private function hasUpdatedWithinHour() : Boolean
      {
         return this.getAgeSeconds() < 3600;
      }
      
      public function getItemByIndex(param1:int) : FaqItem
      {
         if(param1 >= this.var_146.length)
         {
            return null;
         }
         return this.var_146.getWithIndex(param1);
      }
      
      public function setTimeStamp() : void
      {
         this.var_1729 = new Date();
      }
      
      public function set itemCount(param1:int) : void
      {
         this.var_1896 = param1;
      }
      
      public function storeItemAnswer(param1:int, param2:String) : void
      {
         var _loc3_:FaqItem = this.getItem(param1);
         if(_loc3_ != null)
         {
            _loc3_.answerText = param2;
         }
      }
      
      public function get itemCount() : int
      {
         if(this.var_146.length == 0)
         {
            return this.var_1896;
         }
         return this.var_146.length;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1504 = param1;
      }
   }
}
