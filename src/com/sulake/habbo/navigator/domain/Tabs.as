package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_680:int = 6;
      
      public static const const_250:int = 5;
      
      public static const const_596:int = 2;
      
      public static const const_361:int = 9;
      
      public static const const_323:int = 4;
      
      public static const const_215:int = 2;
      
      public static const const_771:int = 4;
      
      public static const const_199:int = 8;
      
      public static const const_668:int = 7;
      
      public static const const_256:int = 3;
      
      public static const const_335:int = 1;
      
      public static const const_211:int = 5;
      
      public static const const_388:int = 12;
      
      public static const const_325:int = 1;
      
      public static const const_789:int = 11;
      
      public static const const_556:int = 3;
      
      public static const const_1635:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_340:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_340 = new Array();
         this.var_340.push(new Tab(this._navigator,const_335,const_388,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_432));
         this.var_340.push(new Tab(this._navigator,const_215,const_325,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_432));
         this.var_340.push(new Tab(this._navigator,const_323,const_789,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_959));
         this.var_340.push(new Tab(this._navigator,const_256,const_250,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_432));
         this.var_340.push(new Tab(this._navigator,const_211,const_199,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_701));
         this.setSelectedTab(const_335);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_340)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_340)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_340)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_323;
      }
      
      public function get tabs() : Array
      {
         return this.var_340;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
   }
}
