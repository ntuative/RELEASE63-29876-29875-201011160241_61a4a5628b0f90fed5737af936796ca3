package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl extends Sprite implements IMouseCursor, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _type:uint;
      
      private var var_1561:Dictionary;
      
      private var var_333:Boolean;
      
      private var var_1562:DisplayObject;
      
      private var var_191:Stage;
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         this._type = MouseCursorType.const_35;
         this.var_191 = param1.stage;
         this.var_333 = true;
         this.var_1561 = new Dictionary();
         this.var_191.addChild(this);
         this.var_191.addEventListener(Event.MOUSE_LEAVE,this.onStageMouseLeave);
         this.var_191.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this.var_191.addEventListener(MouseEvent.MOUSE_OVER,this.onStageMouseMove);
         this.var_191.addEventListener(MouseEvent.MOUSE_OUT,this.onStageMouseMove);
      }
      
      override public function get visible() : Boolean
      {
         return this.var_333;
      }
      
      private function onStageMouseLeave(param1:Event) : void
      {
         if(this._type != MouseCursorType.const_35)
         {
            Mouse.hide();
            this.var_333 = false;
         }
      }
      
      public function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         this.var_1561[param1] = param2;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_191.removeEventListener(Event.MOUSE_LEAVE,this.onStageMouseLeave);
            this.var_191.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            this.var_191.removeEventListener(MouseEvent.MOUSE_OVER,this.onStageMouseMove);
            this.var_191.removeEventListener(MouseEvent.MOUSE_OUT,this.onStageMouseMove);
            this._disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         this.var_333 = param1;
         if(this.var_333)
         {
            Mouse.show();
         }
         else
         {
            Mouse.hide();
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         x = param1.stageX - 2;
         y = param1.stageY;
         if(this._type == MouseCursorType.const_35)
         {
            this.var_333 = false;
            Mouse.show();
         }
         else
         {
            this.var_333 = true;
            Mouse.hide();
         }
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function set type(param1:uint) : void
      {
         this._type = param1;
         this.var_1562 = this.var_1561[this._type];
         if(numChildren > 0)
         {
            removeChildAt(0);
         }
         if(this.var_1562)
         {
            addChild(this.var_1562);
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
      }
   }
}
