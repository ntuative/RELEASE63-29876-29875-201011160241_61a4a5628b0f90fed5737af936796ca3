package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1427:int = 2;
      
      public static const const_1588:int = 1;
       
      
      private var var_1932:int;
      
      private var var_1926:int;
      
      private var var_1927:int;
      
      private var var_1930:Boolean;
      
      private var var_1925:int;
      
      private var var_847:String;
      
      private var var_1935:Boolean;
      
      private var var_1931:int;
      
      private var var_1934:int;
      
      private var var_1928:int;
      
      private var var_1933:Boolean;
      
      private var var_1929:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_847 = param1.readString();
         this.var_1926 = param1.readInteger();
         this.var_1925 = param1.readInteger();
         this.var_1928 = param1.readInteger();
         this.var_1932 = param1.readInteger();
         this.var_1935 = param1.readBoolean();
         this.var_1930 = param1.readBoolean();
         this.var_1929 = param1.readInteger();
         this.var_1931 = param1.readInteger();
         this.var_1933 = param1.readBoolean();
         this.var_1934 = param1.readInteger();
         this.var_1927 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_1926;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_1927;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_1930;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_1925;
      }
      
      public function get productName() : String
      {
         return this.var_847;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_1928;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_1935;
      }
      
      public function get responseType() : int
      {
         return this.var_1932;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_1931;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_1934;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_1929;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_1933;
      }
   }
}
