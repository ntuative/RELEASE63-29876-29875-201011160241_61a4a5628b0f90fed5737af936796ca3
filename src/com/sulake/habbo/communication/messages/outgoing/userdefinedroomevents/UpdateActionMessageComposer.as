package com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class UpdateActionMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_30:Array;
      
      public function UpdateActionMessageComposer(param1:int, param2:Array, param3:String, param4:Array, param5:int)
      {
         var _loc6_:int = 0;
         this.var_30 = new Array();
         super();
         this.var_30.push(param1);
         this.var_30.push(param2.length);
         for each(_loc6_ in param2)
         {
            this.var_30.push(_loc6_);
         }
         this.var_30.push(param3);
         this.var_30.push(param4.length);
         for each(param1 in param4)
         {
            this.var_30.push(param1);
         }
         this.var_30.push(param5);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_30;
      }
      
      public function dispose() : void
      {
         this.var_30 = null;
      }
   }
}
