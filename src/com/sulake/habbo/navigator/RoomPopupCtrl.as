package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailRenderer;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   
   public class RoomPopupCtrl extends PopupCtrl
   {
       
      
      private var var_1878:RoomThumbnailRenderer;
      
      private var var_945:TagRenderer;
      
      private var var_166:IWindowContainer;
      
      private var var_109:GuestRoomData;
      
      public function RoomPopupCtrl(param1:HabboNavigator, param2:int, param3:int)
      {
         super(param1,param2,param3,"grs_guest_room_details_long");
         this.var_1878 = new RoomThumbnailRenderer(param1);
         this.var_945 = new TagRenderer(param1,hideInstantly);
      }
      
      private function refreshOwnerName() : void
      {
         this.refreshTextWithCaption("roomowner",this.var_166,this.var_109.ownerName);
         var _loc1_:ITextWindow = ITextWindow(this.var_166.findChildByName("roomowner"));
         if(this.var_109.ownerName != "" && this.var_109.ownerName != "-")
         {
            _loc1_.procedure = this.onOwnerName;
            _loc1_.setParamFlag(HabboWindowParam.const_37,true);
            _loc1_.underline = true;
         }
         else
         {
            _loc1_.procedure = null;
            _loc1_.setParamFlag(HabboWindowParam.const_37,false);
            _loc1_.underline = false;
         }
      }
      
      private function refreshExtraCont() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(this.var_166.findChildByName("extra_cont"));
         Util.hideChildren(_loc1_);
         this.var_945.refreshTags(_loc1_,this.var_109.tags);
         this.refreshTextWithCaption("rating",_loc1_,"" + this.var_109.score);
         if(this.var_109.event)
         {
            this.refreshTextWithCaption("startedat",_loc1_,"" + this.var_109.eventCreationTime);
         }
         this.var_1878.refreshThumbnail(_loc1_,this.var_109.thumbnail,false);
         _loc1_.findChildByName("bitmap").visible = true;
         _loc1_.visible = true;
      }
      
      private function refreshRoomName(param1:IWindowContainer, param2:GuestRoomData) : void
      {
         var _loc3_:ITextWindow = ITextWindow(param1.getChildByName("roomname"));
         _loc3_.visible = true;
         _loc3_.text = param2.roomName;
         _loc3_.height = _loc3_.textHeight + 3;
      }
      
      private function refreshInfo(param1:IWindowContainer, param2:String, param3:Boolean) : void
      {
         if(!param3)
         {
            return;
         }
         var _loc4_:IWindowContainer = IWindowContainer(param1.findChildByName(param2));
         _loc4_.visible = true;
         navigator.refreshButton(_loc4_,param2,true,null,0);
      }
      
      private function getRoomCtg(param1:int) : String
      {
         var _loc2_:* = null;
         for each(_loc2_ in navigator.data.allCategories)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_.nodeName;
            }
         }
         return "";
      }
      
      private function refreshRoomDesc(param1:IWindowContainer, param2:GuestRoomData) : void
      {
         if(param2.description == "")
         {
            return;
         }
         var _loc4_:ITextWindow = ITextWindow(param1.getChildByName("roomdesc"));
         _loc4_.text = param2.description;
         _loc4_.height = _loc4_.textHeight + 10;
         _loc4_.y = Util.getLowestPoint(param1);
         _loc4_.visible = true;
      }
      
      private function getEventCtg(param1:int) : String
      {
         var _loc2_:String = "roomevent_type_" + param1;
         var _loc3_:String = navigator.getText(_loc2_);
         return _loc3_ == null ? "" : _loc3_;
      }
      
      public function set room(param1:GuestRoomData) : void
      {
         this.var_109 = param1;
      }
      
      private function refreshTextWithCaption(param1:String, param2:IWindowContainer, param3:String) : void
      {
         var _loc4_:IWindowContainer = IWindowContainer(param2.findChildByName(param1 + "_cont"));
         _loc4_.visible = true;
         var _loc5_:ITextWindow = ITextWindow(_loc4_.getChildByName(param1));
         var _loc6_:ITextWindow = ITextWindow(_loc4_.getChildByName(param1 + ".caption"));
         _loc5_.text = param3;
         Util.moveChildrenToRow(_loc4_,[param1 + ".caption",param1],_loc6_.x,0,2);
      }
      
      override public function refreshContent(param1:IWindowContainer) : void
      {
         if(this.var_166 == null)
         {
            this.var_166 = IWindowContainer(param1.findChildByName("details_container"));
         }
         this.var_166.visible = true;
         Util.hideChildren(this.var_166);
         this.refreshRoomName(this.var_166,this.var_109);
         if(this.var_109.ownerName != "" && this.var_109.ownerName != "-")
         {
         }
         this.refreshOwnerName();
         this.refreshTextWithCaption("roomctg",this.var_166,!!this.var_109.event ? this.getEventCtg(this.var_109.categoryId) : this.getRoomCtg(this.var_109.categoryId));
         this.refreshRoomDesc(this.var_166,this.var_109);
         this.refreshExtraCont();
         this.refreshInfo(this.var_166,"trading_allowed",this.var_109.allowTrading);
         this.refreshInfo(this.var_166,"doormode_doorbell",this.var_109.doorMode == 1);
         this.refreshInfo(this.var_166,"doormode_password",this.var_109.doorMode == 2);
         Util.moveChildrenToColumn(this.var_166,["roomname","roomctg_cont","roomowner_cont","roomdesc","extra_cont","doormode_doorbell","doormode_password","trading_allowed"],0,0);
         this.var_166.height = Util.getLowestPoint(this.var_166);
      }
      
      private function onOwnerName(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:ITextWindow = ITextWindow(param2);
         if(_loc3_ != null)
         {
            navigator.mainViewCtrl.startSearch(Tabs.const_211,Tabs.const_199,_loc3_.text);
            this.hideInstantly();
         }
      }
   }
}
