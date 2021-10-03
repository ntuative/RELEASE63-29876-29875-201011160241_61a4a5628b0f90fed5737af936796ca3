package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetPetCommandMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class PetCommandTool
   {
       
      
      private var var_501:int;
      
      private var var_339:Timer;
      
      private var var_338:IFrameWindow;
      
      private var _widget:InfostandWidget;
      
      private var var_919:Map;
      
      private const const_1766:int = 1100;
      
      private var var_1866:String;
      
      private var var_40:IFrameWindow;
      
      public function PetCommandTool(param1:InfostandWidget)
      {
         super();
         this._widget = param1;
         this.var_919 = new Map();
         this.var_339 = new Timer(this.const_1766);
         this.var_339.addEventListener(TimerEvent.TIMER,this.onButtonDisableTimeout);
      }
      
      private function onWindowDesktopResized(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_40 && !this.var_40.disposed)
         {
            _loc2_ = param1.window;
            _loc3_ = new Rectangle();
            this.var_40.getGlobalRectangle(_loc3_);
            if(_loc3_.x > _loc2_.width)
            {
               this.var_40.x = _loc2_.width - this.var_40.width;
               this.var_40.getGlobalRectangle(_loc3_);
            }
            if(_loc3_.x + _loc3_.width <= 0)
            {
               this.var_40.x = 0;
               this.var_40.getGlobalRectangle(_loc3_);
            }
            if(_loc3_.y > _loc2_.height)
            {
               this.var_40.y = 0;
               this.var_40.getGlobalRectangle(_loc3_);
            }
            if(_loc3_.y + _loc3_.height <= 0)
            {
               this.var_40.y = 0;
               this.var_40.getGlobalRectangle(_loc3_);
            }
         }
      }
      
      public function showWindow(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.var_40 == null)
            {
               this.createCommandWindow();
            }
            this.var_40.visible = true;
         }
         else if(this.var_40 != null)
         {
            this.var_40.visible = false;
         }
         this.var_339.stop();
      }
      
      private function createCommandWindow() : void
      {
         var _loc1_:XmlAsset = this._widget.assets.getAssetByName("pet_commands") as XmlAsset;
         this.var_40 = (this._widget.windowManager as ICoreWindowManager).buildFromXML(_loc1_.content as XML) as IFrameWindow;
         if(this.var_40 == null)
         {
            throw new Error("Failed to construct command window from XML!");
         }
         this.var_40.setParamFlag(WindowParam.const_89,true);
         this.var_40.context.getDesktopWindow().addEventListener(WindowEvent.const_44,this.onWindowDesktopResized);
         this.var_40.procedure = this.onCommandWindowProcedure;
         this.var_40.x = 80;
      }
      
      private function requestEnabledCommands(param1:int) : void
      {
         var _loc2_:RoomWidgetPetCommandMessage = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.const_554,param1);
         this._widget.messageListener.processWidgetMessage(_loc2_);
      }
      
      public function dispose() : void
      {
         if(this.var_339)
         {
            this.var_339.stop();
            this.var_339 = null;
         }
         if(this._widget)
         {
            this._widget = null;
         }
         if(this.var_40)
         {
            this.var_40.dispose();
         }
         this.var_40 = null;
         if(this.var_338)
         {
            this.var_338.dispose();
         }
         this.var_338 = null;
      }
      
      public function getPetId() : int
      {
         return this.var_501;
      }
      
      private function updateCommandButtonsViewState(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         if(this.var_40 == null)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = new Array();
         }
         var _loc3_:int = 0;
         do
         {
            _loc4_ = "btn_cmd_" + _loc3_;
            _loc2_ = this.var_40.findChildByName(_loc4_) as IButtonWindow;
            if(_loc2_ == null)
            {
               break;
            }
            if(param1.indexOf(_loc3_) > -1)
            {
               _loc2_.enable();
            }
            else
            {
               _loc2_.disable();
            }
            _loc3_++;
         }
         while(_loc2_ != null);
         
         this.var_339.stop();
      }
      
      public function setEnabledCommands(param1:int, param2:Array) : void
      {
         this.var_919.remove(param1);
         this.var_919.add(param1,param2);
         if(param1 != this.var_501)
         {
            return;
         }
         this.updateCommandButtonsViewState(param2);
         this.var_339.stop();
      }
      
      public function isVisible() : Boolean
      {
         if(this.var_40 == null)
         {
            return false;
         }
         return this.var_40.visible;
      }
      
      private function onInfoWindowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ != null && _loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               this.var_338.visible = false;
            }
         }
      }
      
      private function openInfoWindow() : void
      {
         var _loc1_:* = null;
         if(this.var_338 == null)
         {
            _loc1_ = this._widget.assets.getAssetByName("pet_commands_info") as XmlAsset;
            this.var_338 = (this._widget.windowManager as ICoreWindowManager).buildFromXML(_loc1_.content as XML) as IFrameWindow;
            if(this.var_338 == null)
            {
               throw new Error("Failed to construct command info window from XML!");
            }
            this.var_338.x = 200;
            this.var_338.procedure = this.onInfoWindowProcedure;
         }
         else
         {
            this.var_338.visible = true;
         }
      }
      
      private function onButtonDisableTimeout(param1:TimerEvent) : void
      {
         var _loc2_:Array = this.var_919.getValue(this.var_501) as Array;
         this.updateCommandButtonsViewState(_loc2_);
         this.var_339.stop();
      }
      
      private function onCommandWindowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ != null && _loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               this.var_40.visible = false;
            }
            else if(param2.name == "description_link")
            {
               this.openInfoWindow();
            }
            else if(param2.name == "avatar_image")
            {
               this._widget.messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_334,this.var_501));
            }
            else if(param2.name.indexOf("btn_cmd_") > -1)
            {
               _loc4_ = int(param2.name.substring(8));
               _loc5_ = "pet.command." + _loc4_;
               _loc6_ = this._widget.localizations.getKey(_loc5_);
               _loc7_ = new RoomWidgetPetCommandMessage(RoomWidgetPetCommandMessage.const_795,this.var_501,this.var_1866 + " " + _loc6_);
               this._widget.messageListener.processWidgetMessage(_loc7_);
               this.updateCommandButtonsViewState(new Array());
               this.var_339.start();
            }
         }
      }
      
      public function showCommandToolForPet(param1:int, param2:String, param3:BitmapData = null) : void
      {
         if(this.var_501 == param1)
         {
            return;
         }
         this.var_501 = param1;
         this.var_1866 = param2;
         if(this.var_40 == null)
         {
            return;
         }
         var _loc4_:ITextWindow = this.var_40.findChildByName("pet_name") as ITextWindow;
         if(_loc4_ != null)
         {
            _loc4_.text = param2;
         }
         var _loc5_:IBitmapWrapperWindow = this.var_40.findChildByName("avatar_image") as IBitmapWrapperWindow;
         if(_loc5_ != null)
         {
            _loc5_.bitmap = param3;
            _loc5_.width = param3.width;
            _loc5_.height = param3.height;
            _loc5_.invalidate();
         }
         var _loc6_:Array = this.var_919.getValue(param1) as Array;
         if(_loc6_ == null)
         {
            this.updateCommandButtonsViewState(new Array());
            this.requestEnabledCommands(this.var_501);
         }
         else
         {
            this.updateCommandButtonsViewState(_loc6_);
         }
      }
   }
}
