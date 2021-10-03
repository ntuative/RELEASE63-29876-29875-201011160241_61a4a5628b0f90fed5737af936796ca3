package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_1939:Boolean;
      
      private var var_1937:int;
      
      private var var_1942:Boolean;
      
      private var var_1513:String;
      
      private var var_1512:String;
      
      private var var_1943:int;
      
      private var var_1941:String;
      
      private var var_1938:String;
      
      private var var_1940:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1943 = param1.readInteger();
         this.var_1513 = param1.readString();
         this.var_1941 = param1.readString();
         this.var_1939 = param1.readBoolean();
         this.var_1942 = param1.readBoolean();
         param1.readString();
         this.var_1937 = param1.readInteger();
         this.var_1940 = param1.readString();
         this.var_1938 = param1.readString();
         this.var_1512 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1512;
      }
      
      public function get avatarName() : String
      {
         return this.var_1513;
      }
      
      public function get avatarId() : int
      {
         return this.var_1943;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_1939;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_1938;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1940;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_1942;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1941;
      }
      
      public function get avatarGender() : int
      {
         return this.var_1937;
      }
   }
}
