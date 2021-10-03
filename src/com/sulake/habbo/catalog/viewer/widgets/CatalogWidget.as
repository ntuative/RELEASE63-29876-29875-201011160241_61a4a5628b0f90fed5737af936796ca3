package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import flash.events.IEventDispatcher;
   
   public class CatalogWidget
   {
       
      
      private var var_910:Boolean;
      
      protected var _window:IWindowContainer;
      
      private var var_392:ICatalogPage;
      
      private var _events:IEventDispatcher;
      
      public function CatalogWidget(param1:IWindowContainer)
      {
         super();
         this._window = param1;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_392 = param1;
      }
      
      public function init() : void
      {
      }
      
      public function get disposed() : Boolean
      {
         return this.var_910;
      }
      
      public function set events(param1:IEventDispatcher) : void
      {
         this._events = param1;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_392;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function get events() : IEventDispatcher
      {
         return this._events;
      }
      
      public function dispose() : void
      {
         this._events = null;
         this.var_910 = true;
      }
   }
}
