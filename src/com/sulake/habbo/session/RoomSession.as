package com.sulake.habbo.session
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.outgoing.poll.PollAnswerComposer;
   import com.sulake.habbo.communication.messages.outgoing.poll.PollRejectComposer;
   import com.sulake.habbo.communication.messages.outgoing.poll.PollStartComposer;
   import com.sulake.habbo.communication.messages.outgoing.poll.VoteAnswerMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.register.UpdateFigureDataMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.AssignRightsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.BanUserMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.KickBotMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.KickUserMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.LetUserInMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.action.RemoveRightsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.avatar.DanceMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.avatar.SignMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.avatar.WaveMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.CancelTypingMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ShoutMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.StartTypingMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.WhisperMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.GetPetCommandsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.RemovePetFromFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.engine.SetClothingChangeDataMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.CreditFurniRedeemMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.PresentOpenMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerChangeStateMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerGetPresetsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.furniture.RoomDimmerSavePresetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.ChangeQueueMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.OpenConnectionMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.OpenFlatConnectionMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.tracking.IHabboTracking;
   import flash.utils.getTimer;
   
   public class RoomSession implements IRoomSession
   {
       
      
      private var var_1668:Boolean = false;
      
      private var var_1665:Boolean = false;
      
      private var var_1287:Map;
      
      private var _habboTracking:IHabboTracking;
      
      private var _roomId:int = 0;
      
      private var var_2357:String = "";
      
      private var _connection:IConnection;
      
      private var _state:String = "RSE_CREATED";
      
      private var var_1042:UserDataManager;
      
      private var var_1286:int;
      
      private var var_1667:Boolean = false;
      
      private var _roomCategory:int = 0;
      
      private const const_1781:int = 2500;
      
      private var var_1666:Boolean = false;
      
      private var _password:String = "";
      
      private var var_2358:Boolean = false;
      
      public function RoomSession(param1:int, param2:int, param3:IHabboTracking, param4:String = "", param5:String = "")
      {
         this.var_1287 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this._habboTracking = param3;
         this._password = param4;
         this.var_2357 = param5;
         this.var_1042 = new UserDataManager();
      }
      
      private function sendOpenFlatConnectionMessage() : Boolean
      {
         if(this._connection == null)
         {
            return false;
         }
         this._connection.send(new OpenFlatConnectionMessageComposer(this._roomId,this._password));
         return true;
      }
      
      public function sendUpdateFigureData(param1:String, param2:String) : void
      {
         if(this._connection == null)
         {
            return;
         }
         var _loc3_:* = new UpdateFigureDataMessageComposer(param1,param2);
         this._connection.send(_loc3_);
         _loc3_.dispose();
         _loc3_ = null;
      }
      
      public function get isTradingRoom() : Boolean
      {
         return this.var_1665;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1667 = param1;
      }
      
      public function dispose() : void
      {
         this._connection = null;
         this.var_1042.dispose();
         this.var_1287.dispose();
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1666;
      }
      
      public function set isTradingRoom(param1:Boolean) : void
      {
         this.var_1665 = param1;
      }
      
      public function sendWaveMessage() : void
      {
         this._connection.send(new WaveMessageComposer());
      }
      
      public function kickUser(param1:int) : void
      {
         this._connection.send(new KickUserMessageComposer(param1,this.roomId,this.roomCategory));
      }
      
      public function sendPollRejectMessage(param1:int) : void
      {
         this._connection.send(new PollRejectComposer(param1));
      }
      
      public function sendPollAnswerMessage(param1:int, param2:int, param3:Array) : void
      {
         this._connection.send(new PollAnswerComposer(param1,param2,param3));
      }
      
      public function changeQueue(param1:int) : void
      {
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new ChangeQueueMessageComposer(param1));
      }
      
      public function sendPresentOpenMessage(param1:int) : void
      {
         this._connection.send(new PresentOpenMessageComposer(param1));
      }
      
      public function letUserIn(param1:String, param2:Boolean) : void
      {
         this._connection.send(new LetUserInMessageComposer(param1,param2));
      }
      
      public function sendPollStartMessage(param1:int) : void
      {
         this._connection.send(new PollStartComposer(param1));
      }
      
      public function quit() : void
      {
         if(this._connection != null)
         {
            this._connection.send(new QuitMessageComposer());
         }
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1666 = param1;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_1668 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function reset(param1:int, param2:int) : void
      {
         if(param1 != this._roomId || param2 != this._roomCategory)
         {
            this._roomId = param1;
            this._roomCategory = param2;
            this.var_1667 = false;
            this.var_1668 = false;
            this.var_1665 = false;
            this.var_1666 = false;
         }
      }
      
      public function start() : Boolean
      {
         if(this._state == RoomSessionEvent.const_240 && this._connection != null)
         {
            this._state = RoomSessionEvent.const_87;
            if(this.isPrivateRoom)
            {
               return this.sendOpenFlatConnectionMessage();
            }
            return this.sendOpenConnectionMessage(this._roomId,0,true);
         }
         return false;
      }
      
      public function sendCreditFurniRedeemMessage(param1:int) : void
      {
         this._connection.send(new CreditFurniRedeemMessageComposer(param1));
      }
      
      public function get isPrivateRoom() : Boolean
      {
         return this._roomCategory == 0;
      }
      
      public function sendChatTypingMessage(param1:Boolean) : void
      {
         if(param1)
         {
            this._connection.send(new StartTypingMessageComposer(this._roomId,this._roomCategory));
         }
         else
         {
            this._connection.send(new CancelTypingMessageComposer(this._roomId,this._roomCategory));
         }
      }
      
      public function banUser(param1:int) : void
      {
         this._connection.send(new BanUserMessageComposer(param1,this.roomId,this.roomCategory));
      }
      
      public function sendDanceMessage(param1:int) : void
      {
         this._connection.send(new DanceMessageComposer(param1));
      }
      
      private function sendOpenConnectionMessage(param1:int, param2:int, param3:Boolean) : Boolean
      {
         if(this._connection == null)
         {
            return false;
         }
         this._connection.send(new OpenConnectionMessageComposer(param3,param1,param2));
         return true;
      }
      
      public function removeRights(param1:int) : void
      {
         var _loc2_:Array = new Array();
         _loc2_.push(param1);
         var _loc3_:RemoveRightsMessageComposer = new RemoveRightsMessageComposer(_loc2_);
         this._connection.send(_loc3_);
      }
      
      public function sendRoomDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean) : void
      {
         var _loc6_:String = "000000" + param3.toString(16).toUpperCase();
         var _loc7_:String = "#" + _loc6_.substr(_loc6_.length - 6);
         this._connection.send(new RoomDimmerSavePresetMessageComposer(param1,param2,_loc7_,param4,param5,this._roomId,this._roomCategory));
      }
      
      public function get roomResources() : String
      {
         return this.var_2357;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1667;
      }
      
      public function sendShoutMessage(param1:String) : void
      {
         this._connection.send(new ShoutMessageComposer(param1));
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      public function sendRoomDimmerChangeStateMessage() : void
      {
         this._connection.send(new RoomDimmerChangeStateMessageComposer(this._roomId,this._roomCategory));
      }
      
      public function assignRights(param1:int) : void
      {
         this._connection.send(new AssignRightsMessageComposer(param1));
      }
      
      public function kickBot(param1:int) : void
      {
         this._connection.send(new KickBotMessageComposer(param1));
      }
      
      public function sendRoomDimmerGetPresetsMessage() : void
      {
         this._connection.send(new RoomDimmerGetPresetsMessageComposer(this._roomId,this._roomCategory));
      }
      
      public function requestPetCommands(param1:int) : void
      {
         this._connection.send(new GetPetCommandsMessageComposer(param1));
      }
      
      public function set connection(param1:IConnection) : void
      {
         if(param1 == null)
         {
            return;
         }
         this._connection = param1;
         if(this.var_1042 != null)
         {
            this.var_1042.connection = param1;
         }
      }
      
      public function sendVote(param1:int) : void
      {
         this._connection.send(new VoteAnswerMessageComposer(param1));
      }
      
      public function set arePetsAllowed(param1:Boolean) : void
      {
         this.var_2358 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_1668;
      }
      
      public function sendWhisperMessage(param1:String, param2:String) : void
      {
         this._connection.send(new WhisperMessageComposer(param1,param2));
      }
      
      public function sendUpdateClothingChangeFurniture(param1:int, param2:String, param3:String) : void
      {
         if(this._connection == null)
         {
            return;
         }
         var _loc4_:* = new SetClothingChangeDataMessageComposer(param1,param2,param3);
         this._connection.send(_loc4_);
         _loc4_.dispose();
         _loc4_ = null;
      }
      
      public function receivedChatWithTrackingId(param1:int) : void
      {
         var _loc2_:Object = this.var_1287.remove(param1);
         if(_loc2_ != null)
         {
            if(getTimer() - int(_loc2_) > this.const_1781)
            {
               if(this._habboTracking != null)
               {
                  this._habboTracking.chatLagDetected();
               }
            }
         }
      }
      
      public function get userDataManager() : IUserDataManager
      {
         return this.var_1042 as IUserDataManager;
      }
      
      public function sendSignMessage(param1:int) : void
      {
         if(param1 >= 0 && param1 <= 14)
         {
            this._connection.send(new SignMessageComposer(param1));
         }
      }
      
      public function sendChatMessage(param1:String) : void
      {
         this._connection.send(new ChatMessageComposer(param1,this.var_1286));
         this.var_1287.add(this.var_1286,getTimer());
         ++this.var_1286;
      }
      
      public function get arePetsAllowed() : Boolean
      {
         return this.var_2358;
      }
      
      public function pickUpPet(param1:int) : void
      {
         this._connection.send(new RemovePetFromFlatMessageComposer(param1));
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
   }
}
