package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class AvatarLogic extends MovingObjectLogic
   {
      
      private static const const_832:int = 500;
      
      private static const const_1175:int = 999999999;
      
      private static const const_833:Number = 1.5;
      
      private static const const_831:int = 28;
      
      private static const const_834:int = 29;
       
      
      private var var_812:int = 0;
      
      private var var_1158:int = 0;
      
      private var var_920:int = 0;
      
      private var var_1588:int = 0;
      
      private var var_657:int = 0;
      
      private var var_813:int = 0;
      
      private var var_1245:int = 0;
      
      private var var_1246:int = 0;
      
      private var var_402:Vector3d = null;
      
      private var var_1159:int = 0;
      
      private var var_814:int = 0;
      
      private var var_1587:int = 0;
      
      private var var_173:Boolean = false;
      
      private var var_1586:Boolean = false;
      
      public function AvatarLogic()
      {
         super();
         this.var_1587 = getTimer() + this.getBlinkInterval();
      }
      
      private function updateActions(param1:int, param2:IRoomObjectModelController) : void
      {
         if(this.var_1159 > 0)
         {
            if(param1 > this.var_1159)
            {
               param2.setNumber(RoomObjectVariableEnum.const_251,0);
               this.var_1159 = 0;
               this.var_657 = 0;
               this.var_812 = 0;
            }
            else if(this.var_812 == 0 && this.var_657 == 0)
            {
               this.var_657 = param1 + this.getTalkingPauseInterval();
               this.var_812 = this.var_657 + this.getTalkingPauseLength();
            }
            else if(this.var_657 > 0 && param1 > this.var_657)
            {
               param2.setNumber(RoomObjectVariableEnum.const_251,0);
               this.var_657 = 0;
            }
            else if(this.var_812 > 0 && param1 > this.var_812)
            {
               param2.setNumber(RoomObjectVariableEnum.const_251,1);
               this.var_812 = 0;
            }
         }
         if(this.var_920 > 0 && param1 > this.var_920)
         {
            param2.setNumber(RoomObjectVariableEnum.const_222,0);
            this.var_920 = 0;
         }
         if(this.var_1158 > 0 && param1 > this.var_1158)
         {
            param2.setNumber(RoomObjectVariableEnum.const_291,0);
            this.var_1158 = 0;
         }
         if(this.var_1245 > 0 && param1 > this.var_1245)
         {
            param2.setNumber(RoomObjectVariableEnum.const_1069,0);
            this.var_1245 = 0;
         }
         if(this.var_814 > 0)
         {
            if(param1 > this.var_814)
            {
               param2.setNumber(RoomObjectVariableEnum.const_448,0);
               this.var_814 = 0;
            }
            else if((this.var_814 - param1) % 10000 < 1000 && this.var_1586)
            {
               param2.setNumber(RoomObjectVariableEnum.const_372,1);
            }
            else
            {
               param2.setNumber(RoomObjectVariableEnum.const_372,0);
            }
         }
         if(param1 > this.var_1587)
         {
            param2.setNumber(RoomObjectVariableEnum.const_577,1);
            this.var_1587 = param1 + this.getBlinkInterval();
            this.var_1246 = param1 + this.getBlinkLength();
         }
         if(this.var_1246 > 0 && param1 > this.var_1246)
         {
            param2.setNumber(RoomObjectVariableEnum.const_577,0);
            this.var_1246 = 0;
         }
         if(this.var_813 > 0 && param1 > this.var_813)
         {
            param2.setNumber(RoomObjectVariableEnum.const_488,this.var_1588);
            this.var_813 = 0;
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc3_ = object.getId();
               _loc4_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc5_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_197,param1.eventId,_loc3_,_loc4_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc5_);
               }
         }
      }
      
      private function updateEffect(param1:int, param2:IRoomObjectModelController) : void
      {
         if(param1 == const_831)
         {
            this.var_813 = getTimer() + const_832;
            this.var_1588 = const_834;
         }
         else if(param2.getNumber(RoomObjectVariableEnum.const_488) == const_834)
         {
            this.var_813 = getTimer() + const_832;
            this.var_1588 = param1;
            param1 = const_831;
         }
         else
         {
            this.var_813 = 0;
         }
         param2.setNumber(RoomObjectVariableEnum.const_488,param1);
      }
      
      private function getBlinkInterval() : int
      {
         return 4500 + Math.random() * 1000;
      }
      
      private function getBlinkLength() : int
      {
         return 50 + Math.random() * 200;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(param1 is RoomObjectAvatarPostureUpdateMessage)
         {
            _loc3_ = param1 as RoomObjectAvatarPostureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_442,_loc3_.postureType);
            _loc2_.setString(RoomObjectVariableEnum.const_592,_loc3_.parameter);
            return;
         }
         if(param1 is RoomObjectAvatarChatUpdateMessage)
         {
            _loc4_ = param1 as RoomObjectAvatarChatUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_251,1);
            this.var_1159 = getTimer() + _loc4_.numberOfWords * 1000;
            return;
         }
         if(param1 is RoomObjectAvatarTypingUpdateMessage)
         {
            _loc5_ = param1 as RoomObjectAvatarTypingUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_942,Number(_loc5_.isTyping));
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc6_ = param1 as RoomObjectAvatarUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_341,_loc6_.dirHead);
            return;
         }
         if(param1 is RoomObjectAvatarGestureUpdateMessage)
         {
            _loc7_ = param1 as RoomObjectAvatarGestureUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_291,_loc7_.gesture);
            this.var_1158 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarWaveUpdateMessage)
         {
            _loc8_ = param1 as RoomObjectAvatarWaveUpdateMessage;
            if(_loc8_.isWaving)
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_222,1);
               this.var_920 = getTimer() + 0;
            }
            else
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_222,0);
               this.var_920 = 0;
            }
            return;
         }
         if(param1 is RoomObjectAvatarDanceUpdateMessage)
         {
            _loc9_ = param1 as RoomObjectAvatarDanceUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_927,_loc9_.danceStyle);
            return;
         }
         if(param1 is RoomObjectAvatarSleepUpdateMessage)
         {
            _loc10_ = param1 as RoomObjectAvatarSleepUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_510,Number(_loc10_.isSleeping));
            return;
         }
         if(param1 is RoomObjectAvatarEffectUpdateMessage)
         {
            _loc11_ = param1 as RoomObjectAvatarEffectUpdateMessage;
            _loc12_ = _loc11_.effect;
            this.updateEffect(_loc12_,_loc2_);
            return;
         }
         if(param1 is RoomObjectAvatarCarryObjectUpdateMessage)
         {
            _loc13_ = param1 as RoomObjectAvatarCarryObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_448,_loc13_.itemType);
            if(_loc13_.itemType < const_1175)
            {
               this.var_814 = getTimer() + 100000;
               this.var_1586 = true;
            }
            else
            {
               this.var_814 = getTimer() + 1500;
               this.var_1586 = false;
            }
            return;
         }
         if(param1 is RoomObjectAvatarUseObjectUpdateMessage)
         {
            _loc14_ = param1 as RoomObjectAvatarUseObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_372,_loc14_.itemType);
            return;
         }
         if(param1 is RoomObjectAvatarSignUpdateMessage)
         {
            _loc15_ = param1 as RoomObjectAvatarSignUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1069,_loc15_.signType);
            this.var_1245 = getTimer() + 5000;
            return;
         }
         if(param1 is RoomObjectAvatarFlatControlUpdateMessage)
         {
            _loc16_ = param1 as RoomObjectAvatarFlatControlUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_769,_loc16_.rawData);
            _loc2_.setNumber(RoomObjectVariableEnum.const_1365,Number(_loc16_.isAdmin));
            return;
         }
         if(param1 is RoomObjectAvatarFigureUpdateMessage)
         {
            _loc17_ = param1 as RoomObjectAvatarFigureUpdateMessage;
            _loc18_ = _loc2_.getString(RoomObjectVariableEnum.const_170);
            _loc19_ = _loc17_.figure;
            _loc20_ = _loc17_.gender;
            if(_loc18_ != null && _loc18_.indexOf(".bds-") != -1)
            {
               _loc19_ += _loc18_.substr(_loc18_.indexOf(".bds-"));
            }
            _loc2_.setString(RoomObjectVariableEnum.const_170,_loc19_);
            _loc2_.setString(RoomObjectVariableEnum.const_923,_loc20_);
            return;
         }
         if(param1 is RoomObjectAvatarSelectedMessage)
         {
            _loc21_ = param1 as RoomObjectAvatarSelectedMessage;
            this.var_173 = _loc21_.selected;
            this.var_402 = null;
            return;
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(this.var_173 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(this.var_402 == null || this.var_402.x != _loc2_.x || this.var_402.y != _loc2_.y || this.var_402.z != _loc2_.z)
               {
                  if(this.var_402 == null)
                  {
                     this.var_402 = new Vector3d();
                  }
                  this.var_402.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_518,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
         if(object != null && object.getModelController() != null)
         {
            this.updateActions(param1,object.getModelController());
         }
      }
      
      private function getTalkingPauseInterval() : int
      {
         return 100 + Math.random() * 200;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_173 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_504,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         this.var_402 = null;
      }
      
      private function getTalkingPauseLength() : int
      {
         return 75 + Math.random() * 75;
      }
      
      private function targetIsWarping(param1:IVector3d) : Boolean
      {
         var _loc2_:IVector3d = object.getLocation();
         if(param1 == null)
         {
            return false;
         }
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return false;
         }
         if(Math.abs(_loc2_.x - param1.x) > const_833 || Math.abs(_loc2_.y - param1.y) > const_833)
         {
            return true;
         }
         return false;
      }
   }
}
