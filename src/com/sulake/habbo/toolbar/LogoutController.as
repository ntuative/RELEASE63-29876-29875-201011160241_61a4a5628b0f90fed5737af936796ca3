package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   
   public class LogoutController
   {
       
      
      private var _assets:IAssetLibrary;
      
      private var _view:IWindowContainer;
      
      private const const_1512:int = 10;
      
      private var _events:IEventDispatcher;
      
      private var _windowManager:IHabboWindowManager;
      
      public function LogoutController(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IEventDispatcher)
      {
         super();
         this._windowManager = param1;
         this._assets = param2;
         this._events = param3;
         var _loc4_:XmlAsset = this._assets.getAssetByName("logout_xml") as XmlAsset;
         this._view = this._windowManager.buildFromXML(_loc4_.content as XML) as IWindowContainer;
         this._view.findChildByName("log_out_button").addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
         var _loc5_:IWindowContainer = this._view.desktop;
         this._view.x = _loc5_.width - this._view.width - this.const_1512;
         this._view.y = this.const_1512;
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         if(false)
         {
            ExternalInterface.call("FlashExternalInterface.logout");
         }
      }
      
      public function dispose() : void
      {
         this._windowManager = null;
         this._assets = null;
         this._events = null;
         this._view.dispose();
         this._view = null;
      }
   }
}
