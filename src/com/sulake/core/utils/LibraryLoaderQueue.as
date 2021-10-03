package com.sulake.core.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class LibraryLoaderQueue extends EventDispatcher implements IDisposable
   {
      
      protected static const const_1493:int = 4;
       
      
      private var var_247:Array;
      
      private var var_555:Array;
      
      private var _debug:Boolean = false;
      
      public function LibraryLoaderQueue(param1:Boolean = false)
      {
         this.var_555 = new Array();
         this.var_247 = new Array();
         this._debug = param1;
         super();
      }
      
      public function findLibraryLoaderByURL(param1:String, param2:Boolean = true) : LibraryLoader
      {
         var _loc3_:* = null;
         if(!disposed)
         {
            if(param2 && param1.indexOf("?") > -1)
            {
               param1 = param1.slice(0,param1.indexOf("?"));
            }
            for each(_loc3_ in this.var_247)
            {
               if(param2)
               {
                  if(_loc3_.url.indexOf(param1) == 0)
                  {
                     return _loc3_;
                  }
               }
               else if(_loc3_.url == param1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function get length() : int
      {
         return this.var_555.length + this.var_247.length;
      }
      
      private function isUrlInQueue(param1:String, param2:Boolean = true) : Boolean
      {
         var _loc3_:* = null;
         if(!disposed)
         {
            if(param2 && param1.indexOf("?") > -1)
            {
               param1 = param1.slice(0,param1.indexOf("?"));
            }
            for each(_loc3_ in this.var_555)
            {
               if(param2)
               {
                  if(_loc3_.url.indexOf(param1) == 0)
                  {
                     return true;
                  }
               }
               else if(_loc3_.url == param1)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function push(param1:LibraryLoader) : void
      {
         if(!disposed && !this.isUrlInQueue(param1.url) && !this.findLibraryLoaderByURL(param1.url))
         {
            if(param1.paused)
            {
               this.var_555.push(param1);
            }
            else
            {
               this.var_247.push(param1);
            }
            param1.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.libraryLoadedHandler);
            param1.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,this.loadProgressHandler);
            param1.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE,this.loaderDisposeHandler);
            param1.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.loadErrorHandler);
            this.next();
         }
      }
      
      private function libraryLoadedHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         if(_loc2_)
         {
            this.removeLoader(_loc2_);
         }
         this.next();
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            super.dispose();
         }
      }
      
      private function loadErrorHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         if(_loc2_)
         {
            Logger.log("Failed to download  specified file: " + _loc2_.url);
            this.removeLoader(_loc2_);
         }
         this.next();
      }
      
      private function loadProgressHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
      }
      
      private function removeLoader(param1:LibraryLoader) : void
      {
         var _loc2_:int = 0;
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.libraryLoadedHandler);
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,this.loadProgressHandler);
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DISPOSE,this.loaderDisposeHandler);
         param1.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,this.loadErrorHandler);
         _loc2_ = this.var_555.indexOf(param1);
         if(_loc2_ > -1)
         {
            this.var_555.splice(_loc2_,1);
         }
         _loc2_ = this.var_247.indexOf(param1);
         if(_loc2_ > -1)
         {
            this.var_247.splice(_loc2_,1);
         }
      }
      
      private function next() : void
      {
         var _loc1_:* = null;
         if(!disposed)
         {
            while(this.var_247.length < const_1493 && this.var_555.length > 0)
            {
               _loc1_ = this.var_555.shift();
               this.var_247.push(_loc1_);
               _loc1_.resume();
            }
         }
      }
      
      private function loaderDisposeHandler(param1:LibraryLoaderEvent) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         this.removeLoader(_loc2_);
         this.next();
      }
   }
}
