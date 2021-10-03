package com.sulake.habbo.ui
{
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPollUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPollMessage;
   import flash.events.Event;
   
   public class PollWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _disposed:Boolean = false;
      
      public function PollWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_329;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetPollMessage.ANSWER,RoomWidgetPollMessage.const_458,RoomWidgetPollMessage.const_659];
      }
      
      public function update() : void
      {
         this._container.events.dispatchEvent(new RoomWidgetFrameUpdateEvent());
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:* = null;
         if(this._container == null || this._container.events == null)
         {
            return;
         }
         var _loc2_:RoomSessionPollEvent = param1 as RoomSessionPollEvent;
         if(_loc2_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionPollEvent.const_134:
               _loc3_ = new RoomWidgetPollUpdateEvent(_loc2_.id,RoomWidgetPollUpdateEvent.const_134);
               _loc3_.summary = _loc2_.summary;
               break;
            case RoomSessionPollEvent.const_69:
               _loc3_ = new RoomWidgetPollUpdateEvent(_loc2_.id,RoomWidgetPollUpdateEvent.const_69);
               _loc3_.summary = _loc2_.summary;
               break;
            case RoomSessionPollEvent.const_127:
               _loc3_ = new RoomWidgetPollUpdateEvent(_loc2_.id,RoomWidgetPollUpdateEvent.const_127);
               _loc3_.startMessage = _loc2_.startMessage;
               _loc3_.endMessage = _loc2_.endMessage;
               _loc3_.numQuestions = _loc2_.numQuestions;
               _loc3_.questionArray = _loc2_.questionArray;
         }
         if(_loc3_ == null)
         {
            return;
         }
         this._container.events.dispatchEvent(_loc3_);
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:RoomWidgetPollMessage = param1 as RoomWidgetPollMessage;
         if(_loc2_ == null)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetPollMessage.const_659:
               this._container.roomSession.sendPollStartMessage(_loc2_.id);
               break;
            case RoomWidgetPollMessage.const_458:
               this._container.roomSession.sendPollRejectMessage(_loc2_.id);
               break;
            case RoomWidgetPollMessage.ANSWER:
               this._container.roomSession.sendPollAnswerMessage(_loc2_.id,_loc2_.questionId,_loc2_.answers);
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomSessionPollEvent.const_134);
         _loc1_.push(RoomSessionPollEvent.const_69);
         _loc1_.push(RoomSessionPollEvent.const_127);
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this._disposed = true;
         this._container = null;
      }
   }
}
