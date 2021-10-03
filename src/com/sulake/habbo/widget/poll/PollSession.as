package com.sulake.habbo.widget.poll
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class PollSession implements IDisposable
   {
       
      
      private var var_1028:PollWidget;
      
      private var _disposed:Boolean = false;
      
      private var var_1274:int = 0;
      
      private var var_227:IPollDialog;
      
      private var var_1647:String = "";
      
      private var var_1275:Array;
      
      private var _id:int = -1;
      
      public function PollSession(param1:int, param2:PollWidget)
      {
         super();
         this._id = param1;
         this.var_1028 = param2;
      }
      
      public function hideOffer() : void
      {
         if(this.var_227 is PollOfferDialog)
         {
            if(!this.var_227.disposed)
            {
               this.var_227.dispose();
            }
            this.var_227 = null;
         }
      }
      
      public function set numQuestions(param1:int) : void
      {
         this.var_1274 = param1;
      }
      
      public function get questionArray() : Array
      {
         return this.var_1275;
      }
      
      public function hideContent() : void
      {
         if(this.var_227 is PollContentDialog)
         {
            if(!this.var_227.disposed)
            {
               this.var_227.dispose();
            }
            this.var_227 = null;
         }
      }
      
      public function showOffer(param1:String) : void
      {
         this.hideOffer();
         this.var_227 = new PollOfferDialog(this._id,param1,this.var_1028);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function set questionArray(param1:Array) : void
      {
         this.var_1275 = param1;
      }
      
      public function get numQuestions() : int
      {
         return this.var_1274;
      }
      
      public function showThanks() : void
      {
         this.var_1028.windowManager.alert("${poll_thanks_title}",this.var_1647,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_227)
            {
               this.var_227.dispose();
               this.var_227 = null;
            }
            this.var_1028 = null;
            this._disposed = true;
         }
      }
      
      public function showContent(param1:String, param2:String, param3:Array) : void
      {
         this.hideOffer();
         this.hideContent();
         this.var_1647 = param2;
         this.var_227 = new PollContentDialog(this._id,param1,param3,this.var_1028);
      }
   }
}
