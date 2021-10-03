package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
   public class AvatarEffect
   {
       
      
      private var var_2502:int;
      
      private var var_1394:int;
      
      private var _type:int;
      
      private var var_2503:int;
      
      public function AvatarEffect()
      {
         super();
      }
      
      public function get inactiveEffectsInInventory() : int
      {
         return this.var_2503;
      }
      
      public function set secondsLeftIfActive(param1:int) : void
      {
         this.var_2502 = param1;
      }
      
      public function get duration() : int
      {
         return this.var_1394;
      }
      
      public function set inactiveEffectsInInventory(param1:int) : void
      {
         this.var_2503 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         this.var_1394 = param1;
      }
      
      public function get secondsLeftIfActive() : int
      {
         return this.var_2502;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
   }
}
