package com.sulake.habbo.help.help
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.action.CallGuideBotMessageComposer;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.cfh.CallForHelpPendingItemView;
   import com.sulake.habbo.help.cfh.CallForHelpReportUserSelection;
   import com.sulake.habbo.help.cfh.CallForHelpSentView;
   import com.sulake.habbo.help.cfh.CallForHelpTextInput;
   import com.sulake.habbo.help.cfh.CallForHelpTopicSelection;
   import com.sulake.habbo.help.enum.CallForHelpResultEnum;
   import com.sulake.habbo.help.enum.HabboHelpTrackingEvent;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class HelpUI
   {
      
      private static const const_1503:int = 0;
      
      private static const const_1504:int = 0;
       
      
      private var var_1471:int = 0;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _window:IWindowContainer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_2055:Boolean = false;
      
      private var var_413:IWindowContainer;
      
      private var var_514:Array;
      
      private var var_90:Map;
      
      private var var_132:IHabboToolbar;
      
      private var _defaultViewId:String = "HHVE_HELP_FRONTPAGE";
      
      private var var_1472:int = 0;
      
      private var var_2054:String = "";
      
      private var var_625:Array;
      
      private var var_289:String;
      
      private var _component:HabboHelp;
      
      public function HelpUI(param1:HabboHelp, param2:IAssetLibrary, param3:IHabboWindowManager, param4:IHabboLocalizationManager, param5:IHabboToolbar)
      {
         this.var_289 = this._defaultViewId;
         this.var_625 = new Array();
         this.var_514 = new Array();
         super();
         this._component = param1;
         this._assetLibrary = param2;
         this._windowManager = param3;
         this._windowManager.registerLocalizationParameter("info.client.version","version",new String(201011160236));
         this.var_132 = param5;
         this.var_90 = new Map();
         this.var_90.add(HabboHelpViewEnum.const_1464,IHelpViewController(new PlaceholderView(this,this._windowManager,this._assetLibrary)));
         this.var_90.add(HabboHelpViewEnum.const_145,IHelpViewController(new HelpMainView(this,this._windowManager,this._assetLibrary)));
         this.var_90.add(HabboHelpViewEnum.const_413,IHelpViewController(new FaqBrowseTopView(this,this._windowManager,this._assetLibrary)));
         this.var_90.add(HabboHelpViewEnum.const_284,IHelpViewController(new FaqBrowseCategoryView(this,this._windowManager,this._assetLibrary)));
         this.var_90.add(HabboHelpViewEnum.const_234,IHelpViewController(new FaqBrowseEntry(this,this._windowManager,this._assetLibrary)));
         this.var_90.add(HabboHelpViewEnum.const_725,IHelpViewController(new FaqBrowseSearchResults(this,this._windowManager,this._assetLibrary)));
         this.var_90.add(HabboHelpViewEnum.const_360,IHelpViewController(new CallForHelpTopicSelection(this,this._windowManager,this._assetLibrary)));
         this.var_90.add(HabboHelpViewEnum.const_799,IHelpViewController(new CallForHelpTextInput(this,this._windowManager,this._assetLibrary)));
         this.var_90.add(HabboHelpViewEnum.const_246,IHelpViewController(new CallForHelpSentView(this,this._windowManager,this._assetLibrary,"help_cfh_thanks")));
         this.var_90.add(HabboHelpViewEnum.const_982,IHelpViewController(new CallForHelpSentView(this,this._windowManager,this._assetLibrary,"help_cfh_abusive")));
         this.var_90.add(HabboHelpViewEnum.const_962,IHelpViewController(new CallForHelpPendingItemView(this,this._windowManager,this._assetLibrary)));
         this.var_90.add(HabboHelpViewEnum.const_770,IHelpViewController(new CallForHelpReportUserSelection(this,this._windowManager,this._assetLibrary)));
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_289 != param1)
         {
            return;
         }
         var _loc3_:IHelpViewController = this.getViewController();
         if(_loc3_ != null)
         {
            _loc3_.update(param2);
         }
      }
      
      private function createWindow() : void
      {
         var _loc1_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         var _loc2_:XmlAsset = XmlAsset(this._assetLibrary.getAssetByName("help_frame_xml"));
         if(_loc2_ == null)
         {
            return;
         }
         this._window = _loc1_.buildFromXML(XML(_loc2_.content)) as IWindowContainer;
         if(this._window == null)
         {
            return;
         }
         this._window.procedure = this.windowProcedure;
         var _loc3_:IItemListWindow = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc3_ == null)
         {
            return;
         }
         this.var_1471 = this._window.width - _loc3_.width;
         this.var_1472 = this._window.height;
      }
      
      private function addBackButtonWindow() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_289 == HabboHelpViewEnum.const_145 || this.var_625.length == 0)
         {
            return;
         }
         if(this.var_413 == null)
         {
            _loc2_ = ICoreWindowManager(this._windowManager);
            _loc3_ = XmlAsset(this._assetLibrary.getAssetByName("help_back_button_xml"));
            if(_loc3_ == null)
            {
               return;
            }
            this.var_413 = _loc2_.buildFromXML(XML(_loc3_.content)) as IWindowContainer;
         }
         var _loc1_:IItemListWindow = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc1_ == null || this.var_413 == null)
         {
            return;
         }
         if(_loc1_.getListItemIndex(this.var_413 as IWindow) > -1)
         {
            return;
         }
         _loc1_.addListItem(this.var_413 as IWindow);
         this.setBackButtonActiveState(false);
      }
      
      public function get lastSearchString() : String
      {
         return this.var_2054;
      }
      
      private function getViewController() : IHelpViewController
      {
         return this.var_90.getValue(this.var_289);
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this._component.localization;
      }
      
      private function removeCurrentView() : void
      {
         var _loc2_:* = null;
         if(this._window != null)
         {
            _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ != null)
            {
               while(_loc2_.numListItems > 1)
               {
                  _loc2_.getListItemAt(0).dispose();
                  _loc2_.removeListItemAt(0);
               }
            }
         }
         var _loc1_:IHelpViewController = this.getViewController();
         if(_loc1_ != null)
         {
            _loc1_.dispose();
         }
      }
      
      public function dispose() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:Array = this.var_90.getKeys();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            _loc4_ = this.var_90.getValue(_loc3_) as IHelpViewController;
            if(_loc4_ != null)
            {
               _loc4_.dispose();
            }
            _loc2_++;
         }
         this.var_90.dispose();
         if(this.var_413 != null)
         {
            this.var_413.dispose();
            this.var_413 = null;
         }
      }
      
      public function updateCallForGuideBotUI(param1:Boolean) : void
      {
         this.var_2055 = param1;
         var _loc2_:IHelpViewController = this.var_90.getValue(HabboHelpViewEnum.const_145) as IHelpViewController;
         if(_loc2_ != null && !_loc2_.disposed)
         {
            _loc2_.update();
         }
      }
      
      public function getText(param1:String, param2:String = null) : String
      {
         if(param2 == null)
         {
            param2 = param1;
         }
         return this.localization.getKey(param1,param2);
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         switch(param1)
         {
            case CallForHelpResultEnum.const_246:
               this.showUI(HabboHelpViewEnum.const_246);
               break;
            case CallForHelpResultEnum.const_914:
               this.showUI(HabboHelpViewEnum.const_962);
               break;
            case CallForHelpResultEnum.const_984:
               this.showUI(HabboHelpViewEnum.const_982);
         }
      }
      
      public function set lastSearchString(param1:String) : void
      {
         this.var_2054 = param1;
      }
      
      private function setBackButtonActiveState(param1:Boolean = false) : void
      {
         var _loc3_:* = null;
         if(this.var_289 == HabboHelpViewEnum.const_145)
         {
            return;
         }
         if(this.var_514.length < 2)
         {
            _loc3_ = this._assetLibrary.getAssetByName("back_png") as BitmapDataAsset;
            this.var_514.push(_loc3_.content as BitmapData);
            _loc3_ = this._assetLibrary.getAssetByName("back_hi_png") as BitmapDataAsset;
            this.var_514.push(_loc3_.content as BitmapData);
         }
         var _loc2_:IBitmapWrapperWindow = this.var_413.findChildByName("back_image") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true);
         if(param1)
         {
            _loc2_.bitmap.copyPixels(this.var_514[1],this.var_514[1].rect,new Point(0,0));
         }
         else
         {
            _loc2_.bitmap.copyPixels(this.var_514[0],this.var_514[0].rect,new Point(0,0));
         }
      }
      
      public function get marginWidth() : int
      {
         return this.var_1471;
      }
      
      public function updateWindowDimensions() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemListWindow = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         this._window.height = _loc1_.height + this.var_1472;
         this._window.width = _loc1_.width + this.var_1471;
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.tags.indexOf("close") > -1)
               {
                  this.hideUI();
                  return;
               }
               if(param2.tags.indexOf("back") > -1)
               {
                  if(this.var_625.length > 0)
                  {
                     this.showUI(this.var_625.pop(),false);
                  }
                  return;
               }
               break;
            case WindowMouseEvent.const_25:
               if(param2.tags.indexOf("back_image") > -1)
               {
                  this.setBackButtonActiveState(false);
                  return;
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(param2.tags.indexOf("back_image") > -1)
               {
                  this.setBackButtonActiveState(true);
                  return;
               }
               break;
         }
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_90.length)
         {
            _loc3_ = this.var_90.getWithIndex(_loc2_) as IHelpViewController;
            if(_loc3_ != null)
            {
               _loc3_.roomSessionActive = param1;
               if(!_loc3_.disposed)
               {
                  _loc3_.update();
               }
            }
            _loc2_++;
         }
      }
      
      public function showUI(param1:String = null, param2:Boolean = true) : void
      {
         if(param1 == null)
         {
            param1 = this.var_289;
         }
         var _loc3_:* = !this.visible;
         if(this._window == null)
         {
            this.createWindow();
            if(this._window == null)
            {
               return;
            }
            this._window.visible = true;
         }
         else
         {
            this.removeCurrentView();
         }
         if(param1 == this._defaultViewId)
         {
            this.var_625 = new Array();
         }
         else if(param2)
         {
            if(this.var_625.length == 0 || param1 != this.var_289)
            {
               this.var_625.push(this.var_289);
            }
         }
         this.var_289 = param1;
         var _loc4_:IHelpViewController = this.getViewController();
         if(_loc4_ == null)
         {
            Logger.log("* No view controller found for " + this.var_289);
            return;
         }
         var _loc5_:IWindowContainer = this._window.findChildByName("content_area") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:IItemListWindow = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc6_ == null)
         {
            return;
         }
         _loc6_.height = 0;
         _loc4_.render();
         var _loc7_:IWindow = _loc4_.getWindowContainer() as IWindow;
         if(_loc7_ != null)
         {
            _loc6_.addListItemAt(_loc7_,0);
         }
         this.addBackButtonWindow();
         this.updateWindowDimensions();
         if(_loc3_)
         {
            if(this.var_132 != null)
            {
               this.var_132.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_50,HabboToolbarIconEnum.HELP,this._window));
            }
         }
         this._component.events.dispatchEvent(new Event(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_DEFAULT));
      }
      
      public function isCallForGuideBotEnabled() : Boolean
      {
         return this.var_2055;
      }
      
      public function hideUI() : void
      {
         if(this._window != null)
         {
            this.removeCurrentView();
            this._window.dispose();
            this._window = null;
         }
         this.var_289 = this._defaultViewId;
         this._component.events.dispatchEvent(new Event(HabboHelpTrackingEvent.HABBO_HELP_TRACKING_EVENT_CLOSED));
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         this._component.sendMessage(param1);
      }
      
      public function getFaq() : FaqIndex
      {
         return this._component.getFaq();
      }
      
      public function toggleUI() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.hideUI();
         }
         else
         {
            this.showUI();
         }
      }
      
      public function handleCallGuideBot() : void
      {
         this.sendMessage(new CallGuideBotMessageComposer());
         this.hideUI();
         this._component.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_464));
      }
      
      public function get visible() : Boolean
      {
         if(this._window == null)
         {
            return false;
         }
         return this._window.visible;
      }
      
      public function get marginHeight() : int
      {
         return this.var_1472;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         var message:String = param1;
         this._windowManager.alert("${help.cfh.reply.title}",message,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function get component() : HabboHelp
      {
         return this._component;
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         return this._component.getConfigurationKey(param1,param2,param3);
      }
   }
}
