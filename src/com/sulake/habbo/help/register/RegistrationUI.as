package com.sulake.habbo.help.register
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.communication.messages.outgoing.help.SendRegistrationDataComposer;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class RegistrationUI
   {
       
      
      private var var_148:HabboHelp;
      
      private var var_894:RegistrationView;
      
      public function RegistrationUI(param1:HabboHelp)
      {
         super();
         this.var_148 = param1;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_148.assets;
      }
      
      public function sendRegistrationEmail(param1:String, param2:String, param3:Boolean) : void
      {
         this.var_148.sendMessage(new SendRegistrationDataComposer(param1,param2,param3));
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_148.localization;
      }
      
      public function showRegistrationView() : void
      {
         if(!this.var_894)
         {
            this.var_894 = new RegistrationView(this);
         }
         this.var_894.showMainView();
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this.var_148.windowManager;
      }
      
      public function get myName() : String
      {
         return this.var_148.ownUserName;
      }
      
      public function dispose() : void
      {
         this.var_148 = null;
         if(this.var_894)
         {
            this.var_894.dispose();
            this.var_894 = null;
         }
      }
   }
}
