package com.sulake.habbo.room.events
{
   import com.sulake.room.events.RoomObjectEvent;
   
   public class RoomObjectFurnitureActionEvent extends RoomObjectEvent
   {
      
      public static const const_411:String = "ROFCAE_QUEST_VENDING";
      
      public static const const_496:String = "ROFCAE_SOUND_MACHINE_START";
      
      public static const ROOM_OBJECT_DICE_ACTIVATE:String = "ROFCAE_DICE_ACTIVATE";
      
      public static const const_475:String = "ROFCAE_STICKIE";
      
      public static const const_444:String = "ROFCAE_JUKEBOX_DISPOSE";
      
      public static const const_418:String = "ROFCAE_DICE_OFF";
      
      public static const const_494:String = "ROFCAE_JUKEBOX_INIT";
      
      public static const const_393:String = "ROFCAE_SOUND_MACHINE_STOP";
      
      public static const const_476:String = "ROFCAE_USE_HABBOWHEEL";
      
      public static const ROOM_OBJECT_ONE_WAY_DOOR:String = "ROFCAE_ENTER_ONEWAYDOOR";
      
      public static const const_403:String = "ROFCAE_SOUND_MACHINE_DISPOSE";
       
      
      public function RoomObjectFurnitureActionEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
