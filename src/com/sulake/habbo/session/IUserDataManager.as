package com.sulake.habbo.session
{
   public interface IUserDataManager
   {
       
      
      function removeUserDataByIndex(param1:int) : void;
      
      function requestPetInfo(param1:int) : void;
      
      function updateNameByIndex(param1:int, param2:String) : void;
      
      function getUserData(param1:int) : IUserData;
      
      function updateAchievementScore(param1:int, param2:int) : void;
      
      function updateFigure(param1:int, param2:String, param3:String) : void;
      
      function getUserDataByIndex(param1:int) : IUserData;
      
      function getUserBadges(param1:int) : Array;
      
      function setUserData(param1:IUserData) : void;
      
      function updateCustom(param1:int, param2:String) : void;
      
      function getUserDataByType(param1:int, param2:int) : IUserData;
      
      function setUserBadges(param1:int, param2:Array) : void;
      
      function getPetUserData(param1:int) : IUserData;
   }
}
