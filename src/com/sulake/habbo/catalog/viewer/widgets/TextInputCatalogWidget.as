package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.TextInputEvent;
   
   public class TextInputCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1035:ITextFieldWindow;
      
      public function TextInputCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function init() : void
      {
         super.init();
         this.var_1035 = _window.findChildByName("input_text") as ITextFieldWindow;
         if(this.var_1035 != null)
         {
            this.var_1035.addEventListener(WindowKeyboardEvent.const_612,this.onKey);
         }
      }
      
      private function onKey(param1:WindowKeyboardEvent) : void
      {
         if(this.var_1035 == null)
         {
            return;
         }
         events.dispatchEvent(new TextInputEvent(this.var_1035.text));
      }
   }
}
