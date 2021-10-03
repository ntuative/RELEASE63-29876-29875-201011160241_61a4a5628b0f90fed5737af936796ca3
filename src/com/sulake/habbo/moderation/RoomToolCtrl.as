package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomData;
   import com.sulake.habbo.communication.messages.incoming.moderation.RoomModerationData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetModeratorRoomInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.GetRoomChatlogMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModerateRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModeratorActionMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class RoomToolCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1261:ICheckBoxWindow;
      
      private var _data:RoomModerationData;
      
      private var var_323:int;
      
      private var var_45:ModerationManager;
      
      private var var_452:ITextFieldWindow;
      
      private var var_51:IItemListWindow;
      
      private var var_565:Boolean = true;
      
      private var var_960:IDropMenuWindow;
      
      private var var_824:ICheckBoxWindow;
      
      private var _frame:IFrameWindow;
      
      private var var_1262:ICheckBoxWindow;
      
      public function RoomToolCtrl(param1:ModerationManager, param2:int)
      {
         super();
         this.var_45 = param1;
         this.var_323 = param2;
      }
      
      public static function getLowestPoint(param1:IWindowContainer) : int
      {
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc4_ = param1.getChildAt(_loc3_);
            if(_loc4_.visible)
            {
               _loc2_ = Math.max(_loc2_,_loc4_.y + _loc4_.height);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function moveChildrenToColumn(param1:IWindowContainer, param2:int, param3:int) : void
      {
         var _loc5_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.numChildren)
         {
            _loc5_ = param1.getChildAt(_loc4_);
            if(_loc5_ != null && _loc5_.visible && _loc5_.height > 0)
            {
               _loc5_.y = param2;
               param2 += _loc5_.height + param3;
            }
            _loc4_++;
         }
      }
      
      private function onSendMessage(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         this.act(false);
      }
      
      private function onChatlog(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_45.windowTracker.show(new ChatlogCtrl(new GetRoomChatlogMessageComposer(0,this._data.flatId),this.var_45,WindowTracker.const_673,this._data.flatId),this._frame,false,false,true);
      }
      
      public function getId() : String
      {
         return "" + this.var_323;
      }
      
      private function setSendButtonState(param1:String) : void
      {
         var _loc2_:Boolean = this._data != null && this._data.flatId == this.var_45.currentFlatId;
         var _loc3_:IButtonWindow = IButtonWindow(this._frame.findChildByName(param1));
         if(_loc2_ && this.var_45.initMsg.roomAlertPermission)
         {
            _loc3_.enable();
         }
         else
         {
            _loc3_.disable();
         }
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + this.var_45.initMsg.roomMessageTemplates.length);
         param1.populate(this.var_45.initMsg.roomMessageTemplates);
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_270)
         {
            return;
         }
         if(!this.var_565)
         {
            return;
         }
         this.var_452.text = "";
         this.var_565 = false;
      }
      
      private function getTagsAsString(param1:Array) : String
      {
         var _loc3_:* = null;
         var _loc2_:String = "";
         for each(_loc3_ in param1)
         {
            if(_loc2_ == "")
            {
               _loc2_ = _loc3_;
            }
            else
            {
               _loc2_ = _loc2_ + ", " + _loc3_;
            }
         }
         return _loc2_;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_45.messageHandler.removeRoomEnterListener(this);
         if(this._frame != null)
         {
            this._frame.destroy();
            this._frame = null;
         }
         if(this._data != null)
         {
            this._data.dispose();
            this._data = null;
         }
         this.var_45 = null;
         this.var_51 = null;
         this.var_960 = null;
         this.var_452 = null;
         this.var_824 = null;
         this.var_1261 = null;
         this.var_1262 = null;
      }
      
      private function refreshRoomData(param1:RoomData, param2:String) : void
      {
         var _loc3_:IWindowContainer = IWindowContainer(this.var_51.getListItemByName(param2));
         var _loc4_:IWindowContainer = IWindowContainer(_loc3_.findChildByName("room_data"));
         if(_loc4_ == null)
         {
            _loc4_ = IWindowContainer(this.var_45.getXmlWindow("roomtool_roomdata"));
            _loc3_.addChild(_loc4_);
         }
         if(!param1.exists)
         {
            this.var_51.removeListItem(_loc3_);
            this.var_51.removeListItem(this.var_51.getListItemByName("event_spacing"));
            return;
         }
         var _loc5_:ITextWindow = ITextWindow(_loc4_.findChildByName("name"));
         _loc5_.text = param1.name;
         _loc5_.height = _loc5_.textHeight + 5;
         var _loc6_:ITextWindow = ITextWindow(_loc4_.findChildByName("desc"));
         _loc6_.text = param1.desc;
         _loc6_.height = _loc6_.textHeight + 5;
         var _loc7_:IWindowContainer = IWindowContainer(_loc4_.findChildByName("tags_cont"));
         var _loc8_:ITextWindow = ITextWindow(_loc7_.findChildByName("tags_txt"));
         _loc8_.text = this.getTagsAsString(param1.tags);
         _loc8_.height = _loc8_.textHeight + 5;
         _loc7_.height = _loc8_.height;
         if(param1.tags.length < 1)
         {
            _loc4_.removeChild(_loc7_);
         }
         moveChildrenToColumn(_loc4_,_loc5_.y,0);
         _loc4_.height = getLowestPoint(_loc4_);
         _loc3_.height = _loc4_.height + 2 * _loc4_.y;
         Logger.log("XXXX: " + _loc3_.height + ", " + _loc4_.height + ", " + _loc5_.height + ", " + _loc6_.height + ", " + _loc7_.height + ", " + _loc8_.height);
      }
      
      public function onRoomChange() : void
      {
         this.setSendButtonState("send_caution_but");
         this.setSendButtonState("send_message_but");
      }
      
      private function setTxt(param1:String, param2:String) : void
      {
         var _loc3_:ITextWindow = ITextWindow(this._frame.findChildByName(param1));
         _loc3_.text = param2;
      }
      
      public function onRoomInfo(param1:RoomModerationData) : void
      {
         Logger.log("GOT ROOM INFO: " + param1.flatId + ", " + this.var_323);
         if(param1.flatId != this.var_323)
         {
            Logger.log("NOT THE SAME FLAT: " + param1.flatId + ", " + this.var_323);
            return;
         }
         this._data = param1;
         this.populate();
         this.var_45.messageHandler.removeRoomInfoListener(this);
         this._frame.visible = true;
         this.var_45.messageHandler.addRoomEnterListener(this);
         Logger.log("TURNED VISIBLE: " + this._frame.rectangle + ", " + this._frame.visible);
      }
      
      private function onEditInHk(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Edit in hk clicked");
         this.var_45.openHkPage("roomadmin.url","" + this._data.flatId);
      }
      
      private function onEnterRoom(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Enter room clicked");
         this.var_45.goToRoom(this._data.flatId);
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      private function onOwnerName(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_45.windowTracker.show(new UserInfoFrameCtrl(this.var_45,this._data.ownerId),this._frame,false,false,true);
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
      
      private function act(param1:Boolean) : void
      {
         if(this.var_565 || this.var_452.text == "")
         {
            this.var_45.windowManager.alert("Alert","You must input a message to the user",0,this.onAlertClose);
            return;
         }
         var _loc2_:int = this.determineAction(param1,this.var_824.isSelected);
         this.var_45.connection.send(new ModeratorActionMessageComposer(ModeratorActionMessageComposer.const_1317,_loc2_,this.var_452.text,"",""));
         if(this.var_1261.isSelected || this.var_1262.isSelected || this.var_824.isSelected)
         {
            this.var_45.connection.send(new ModerateRoomMessageComposer(this._data.flatId,this.var_1261.isSelected,this.var_1262.isSelected,this.var_824.isSelected));
         }
         this.dispose();
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_59)
         {
            return;
         }
         var _loc3_:String = this.var_45.initMsg.roomMessageTemplates[this.var_960.selection];
         if(_loc3_ != null)
         {
            this.var_565 = false;
            this.var_452.text = _loc3_;
         }
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1344;
      }
      
      private function determineAction(param1:Boolean, param2:Boolean) : int
      {
         if(param2)
         {
            return !!param1 ? 0 : int(ModeratorActionMessageComposer.const_1387);
         }
         return !!param1 ? 0 : int(ModeratorActionMessageComposer.const_1414);
      }
      
      public function populate() : void
      {
         this.var_51 = IItemListWindow(this._frame.findChildByName("list_cont"));
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
         this.var_452 = ITextFieldWindow(this._frame.findChildByName("message_input"));
         this.var_452.procedure = this.onInputClick;
         this.var_960 = IDropMenuWindow(this._frame.findChildByName("msgTemplatesSelect"));
         this.prepareMsgSelect(this.var_960);
         this.var_960.procedure = this.onSelectTemplate;
         this.var_824 = ICheckBoxWindow(this._frame.findChildByName("kick_check"));
         this.var_1261 = ICheckBoxWindow(this._frame.findChildByName("lock_check"));
         this.var_1262 = ICheckBoxWindow(this._frame.findChildByName("changename_check"));
         this.refreshRoomData(this._data.room,"room_cont");
         this.refreshRoomData(this._data.event,"event_cont");
         this.setTxt("owner_name_txt",this._data.ownerName);
         this.setTxt("owner_in_room_txt",!!this._data.ownerInRoom ? "Yes" : "No");
         this.setTxt("user_count_txt","" + this._data.userCount);
         this.setTxt("has_event_txt",!!this._data.event.exists ? "Yes" : "No");
         this._frame.findChildByName("enter_room_but").procedure = this.onEnterRoom;
         this._frame.findChildByName("chatlog_but").procedure = this.onChatlog;
         this._frame.findChildByName("edit_in_hk_but").procedure = this.onEditInHk;
         this._frame.findChildByName("send_caution_but").procedure = this.onSendCaution;
         this._frame.findChildByName("send_message_but").procedure = this.onSendMessage;
         this.var_45.disableButton(this.var_45.initMsg.chatlogsPermission,this._frame,"chatlog_but");
         if(!this.var_45.initMsg.roomKickPermission)
         {
            this.var_824.disable();
         }
         this._frame.findChildByName("owner_name_txt").procedure = this.onOwnerName;
         this.onRoomChange();
      }
      
      private function onSendCaution(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending caution...");
         this.act(true);
      }
      
      public function show() : void
      {
         this._frame = IFrameWindow(this.var_45.getXmlWindow("roomtool_frame"));
         this.var_45.messageHandler.addRoomInfoListener(this);
         this.var_45.connection.send(new GetModeratorRoomInfoMessageComposer(this.var_323));
         Logger.log("BEGINNING TO SHOW: " + this.var_323);
      }
   }
}
