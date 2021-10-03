package com.sulake.habbo.messenger.domain
{
   import com.sulake.core.runtime.IDisposable;
   
   public class Conversation implements IDisposable
   {
       
      
      private var _id:int;
      
      private var var_564:String;
      
      private var _disposed:Boolean;
      
      private var var_1205:Boolean;
      
      private var _name:String;
      
      private var var_1322:Array;
      
      private var var_1703:Boolean;
      
      private var var_173:Boolean;
      
      public function Conversation(param1:int, param2:String, param3:String, param4:Boolean)
      {
         this.var_1322 = new Array();
         super();
         this._id = param1;
         this._name = param2;
         this.var_564 = param3;
         this.var_1703 = param4;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get messages() : Array
      {
         return this.var_1322;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1703;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_1205 = false;
         }
         this.var_173 = param1;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1322 = null;
      }
      
      public function get selected() : Boolean
      {
         return this.var_173;
      }
      
      public function setNewMessageArrived(param1:Boolean) : void
      {
         if(this.var_173)
         {
            this.var_1205 = false;
         }
         else
         {
            this.var_1205 = param1;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function addMessage(param1:Message) : void
      {
         this.var_1322.push(param1);
      }
      
      public function get newMessageArrived() : Boolean
      {
         return this.var_1205;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         this.var_1703 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_564;
      }
   }
}
