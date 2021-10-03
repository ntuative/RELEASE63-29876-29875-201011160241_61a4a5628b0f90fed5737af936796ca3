package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1179:int = 0;
      
      private var var_1722:int = 0;
      
      private var var_1988:String = "";
      
      private var var_1176:int = 0;
      
      private var var_2410:String = "";
      
      private var var_2407:int = 0;
      
      private var var_1440:String = "";
      
      private var var_2198:int = 0;
      
      private var var_2409:int = 0;
      
      private var var_1178:String = "";
      
      private var var_2408:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2198 = param1;
         this.var_1178 = param2;
         this.var_1440 = param3;
         this.var_1988 = param4;
         this.var_2410 = param5;
         if(param6)
         {
            this.var_1722 = 1;
         }
         else
         {
            this.var_1722 = 0;
         }
         this.var_2407 = param7;
         this.var_2409 = param8;
         this.var_1176 = param9;
         this.var_2408 = param10;
         this.var_1179 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2198,this.var_1178,this.var_1440,this.var_1988,this.var_2410,this.var_1722,this.var_2407,this.var_2409,this.var_1176,this.var_2408,this.var_1179];
      }
      
      public function dispose() : void
      {
      }
   }
}
