package com.sulake.habbo.help.hotelmerge
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class HotelMergeUI implements INameChangeUI
   {
       
      
      private var var_148:HabboHelp;
      
      private var _view:HotelMergeNameChangeView;
      
      public function HotelMergeUI(param1:HabboHelp)
      {
         super();
         this.var_148 = param1;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_148.assets;
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!this.var_148)
         {
            return;
         }
         this.var_148.localization.registerParameter("help.tutorial.name.changed","name",name);
         this.var_148.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_487)
         {
            this._view.dispose();
         }
         else
         {
            this._view.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this.var_148.windowManager;
      }
      
      public function showView(param1:String) : void
      {
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_148.localization;
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(this.var_148 == null || this.var_148.assets == null)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(this.var_148.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || this.var_148.windowManager == null)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(this.var_148.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      public function get myName() : String
      {
         return this.var_148.ownUserName;
      }
      
      public function checkName(param1:String) : void
      {
         this.var_148.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function changeName(param1:String) : void
      {
         this.var_148.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_487)
         {
            this._view.checkedName = _loc2_.name;
         }
         else
         {
            this._view.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function startNameChange() : void
      {
         if(!this._view)
         {
            this._view = new HotelMergeNameChangeView(this);
         }
         this._view.showMainView();
      }
      
      public function dispose() : void
      {
         this.var_148 = null;
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
      }
   }
}
