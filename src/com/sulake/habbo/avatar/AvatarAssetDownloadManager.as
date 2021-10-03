package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.FigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AvatarAssetDownloadManager extends EventDispatcher
   {
       
      
      private var var_795:Dictionary;
      
      private const const_1796:int = 100;
      
      private const const_1493:int = 2;
      
      private var var_386:AssetLoaderStruct;
      
      private var var_702:Array;
      
      private var var_877:Dictionary;
      
      private var var_2462:String;
      
      private var var_1095:Dictionary;
      
      private var _assets:IAssetLibrary;
      
      private var var_1755:Boolean;
      
      private var var_701:Array;
      
      private var _structure:AvatarStructure;
      
      private var var_1096:Array;
      
      private var var_1341:String;
      
      private var var_876:Timer;
      
      private var var_878:int = 3;
      
      public function AvatarAssetDownloadManager(param1:IAssetLibrary, param2:String, param3:String, param4:AvatarStructure)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         super();
         this.var_1095 = new Dictionary();
         this._assets = param1;
         this._structure = param4;
         this.var_877 = new Dictionary();
         this.var_2462 = param3;
         this.var_1341 = param2;
         this.var_795 = new Dictionary();
         this.var_1096 = [];
         this.var_701 = [];
         this.var_702 = [];
         var _loc5_:URLRequest = new URLRequest(param2);
         var _loc6_:IAsset = this._assets.getAssetByName("figuremap");
         if(_loc6_ == null)
         {
            this.var_386 = this._assets.loadAssetFromFile("figuremap",_loc5_,"text/xml");
            this.addMapLoaderEventListeners();
         }
         else
         {
            _loc7_ = this._assets.getAssetByName("figuremap") as XmlAsset;
            _loc8_ = (_loc7_.content as XML).copy();
            this.loadFigureMapData(_loc8_);
         }
         this.var_876 = new Timer(this.const_1796,1);
         this.var_876.addEventListener(TimerEvent.TIMER_COMPLETE,this.onNextDownloadTimeout);
      }
      
      private function libraryComplete(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc2_:* = [];
         for(_loc3_ in this.var_877)
         {
            _loc7_ = true;
            _loc4_ = this.var_877[_loc3_];
            for each(_loc8_ in _loc4_)
            {
               if(!_loc8_.isReady)
               {
                  _loc7_ = false;
                  break;
               }
            }
            if(_loc7_)
            {
               _loc2_.push(_loc3_);
               _loc9_ = this.var_795[_loc3_];
               for each(_loc10_ in _loc9_)
               {
                  if(_loc10_ != null && !_loc10_.disposed)
                  {
                     _loc10_.avatarImageReady(_loc3_);
                  }
               }
               delete this.var_795[_loc3_];
            }
         }
         for each(_loc3_ in _loc2_)
         {
            delete this.var_877[_loc3_];
         }
         while(_loc6_ < this.var_702.length)
         {
            _loc5_ = this.var_702[_loc6_];
            if(_loc5_.libraryName == (param1.target as AvatarAssetDownloadLibrary).libraryName)
            {
               this.var_702.splice(_loc6_,1);
            }
            _loc6_++;
         }
         this.var_876.start();
      }
      
      public function loadFigureSetData(param1:AvatarFigureContainer, param2:IAvatarImageListener) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(!this.var_1755)
         {
            this.var_1096.push([param1,param2]);
            return;
         }
         var _loc3_:String = param1.getFigureString();
         var _loc4_:Array = this.getLibsToDownload(param1);
         if(_loc4_.length > 0)
         {
            if(param2 && !param2.disposed)
            {
               _loc6_ = this.var_795[_loc3_];
               if(_loc6_ == null)
               {
                  _loc6_ = [];
               }
               _loc6_.push(param2);
               this.var_795[_loc3_] = _loc6_;
            }
            this.var_877[_loc3_] = _loc4_;
            for each(_loc5_ in _loc4_)
            {
               this.addToQueue(_loc5_);
            }
         }
         else if(param2 != null && !param2.disposed)
         {
            param2.avatarImageReady(_loc3_);
         }
      }
      
      public function isReady(param1:AvatarFigureContainer) : Boolean
      {
         if(!this.var_1755)
         {
            return false;
         }
         var _loc2_:Array = this.getLibsToDownload(param1);
         return _loc2_.length == 0;
      }
      
      private function onConfigurationError(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         --this.var_878;
         if(this.var_878 <= 0)
         {
            Logger.log("AVATAR ASSET ERROR: Could not download figuremap.xml.");
         }
         else
         {
            Logger.log("Could not download figuremap.xml. Retries left: " + this.var_878);
            if(this.var_1341.indexOf("?") > 0)
            {
               _loc2_ = this.var_1341 + "&retry=" + this.var_878;
            }
            else
            {
               _loc2_ = this.var_1341 + "?retry=" + this.var_878;
            }
            this.removeMapLoaderEventListeners();
            _loc3_ = new URLRequest(_loc2_);
            this.var_386 = this._assets.loadAssetFromFile("figuremap",_loc3_,"text/xml");
            this.addMapLoaderEventListeners();
         }
      }
      
      private function getLibsToDownload(param1:AvatarFigureContainer) : Array
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc2_:* = [];
         var _loc3_:IFigureData = this._structure.figureData;
         for each(_loc4_ in param1.getPartTypeIds())
         {
            _loc5_ = _loc3_.getSetType(_loc4_);
            _loc6_ = param1.getPartSetId(_loc4_);
            _loc7_ = _loc5_.getPartSet(_loc6_);
            if(_loc7_)
            {
               for each(_loc8_ in _loc7_.parts)
               {
                  _loc9_ = _loc8_.type + ":" + _loc8_.id;
                  _loc10_ = this.var_1095[_loc9_];
                  if(_loc10_ != null)
                  {
                     for each(_loc11_ in _loc10_)
                     {
                        if(_loc11_ != null)
                        {
                           if(!_loc11_.isReady)
                           {
                              if(_loc2_.indexOf(_loc11_) == -1)
                              {
                                 _loc2_.push(_loc11_);
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         return _loc2_;
      }
      
      private function addMapLoaderEventListeners() : void
      {
         if(this.var_386)
         {
            this.var_386.addEventListener(AssetLoaderEvent.const_30,this.onConfigurationComplete);
            this.var_386.addEventListener(AssetLoaderEvent.const_45,this.onConfigurationError);
         }
      }
      
      private function removeMapLoaderEventListeners() : void
      {
         if(this.var_386)
         {
            this.var_386.removeEventListener(AssetLoaderEvent.const_30,this.onConfigurationComplete);
            this.var_386.removeEventListener(AssetLoaderEvent.const_45,this.onConfigurationError);
         }
      }
      
      private function loadFigureMapData(param1:XML) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            Logger.log("[AvatarAssetDownloadManager] XML error: " + param1 + " not valid XML");
            return;
         }
         if(param1.toString() == "")
         {
            Logger.log("[AvatarAssetDownloadManager] XML error: " + param1 + " is EMPTY!");
            return;
         }
         this.generateMap(param1);
         this.var_1755 = true;
         for each(_loc2_ in this.var_1096)
         {
            this.loadFigureSetData(_loc2_[0],_loc2_[1]);
         }
         this.var_1096 = [];
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_1095 = null;
         this._assets = null;
         this.var_877 = null;
         this.var_795 = null;
         this._structure = null;
         this.var_701 = null;
         this.var_1096 = null;
         if(this.var_876)
         {
            this.var_876.stop();
            this.var_876 = null;
         }
         if(this.var_386)
         {
            this.removeMapLoaderEventListeners();
            this.var_386 = null;
         }
      }
      
      private function generateMap(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         for each(_loc2_ in param1.lib)
         {
            _loc3_ = new AvatarAssetDownloadLibrary(_loc2_.@id,_loc2_.@revision,this.var_2462,this._assets);
            _loc3_.addEventListener(Event.COMPLETE,this.libraryComplete);
            for each(_loc4_ in _loc2_.part)
            {
               _loc5_ = _loc4_.@type + ":" + _loc4_.@id;
               _loc6_ = this.var_1095[_loc5_];
               if(_loc6_ == null)
               {
                  _loc6_ = [];
               }
               _loc6_.push(_loc3_);
               this.var_1095[_loc5_] = _loc6_;
            }
         }
      }
      
      private function onNextDownloadTimeout(param1:Event = null) : void
      {
         this.processPending();
      }
      
      private function processPending() : void
      {
         var _loc1_:* = null;
         while(this.var_701.length > 0 && this.var_702.length < this.const_1493)
         {
            _loc1_ = this.var_701[0];
            _loc1_.startDownloading();
            this.var_702.push(this.var_701.shift());
         }
      }
      
      private function addToQueue(param1:AvatarAssetDownloadLibrary) : void
      {
         if(!param1.isReady && this.var_701.indexOf(param1) == -1 && this.var_702.indexOf(param1) == -1)
         {
            this.var_701.push(param1);
            this.processPending();
         }
      }
      
      private function onConfigurationComplete(param1:Event) : void
      {
         var data:XML = null;
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         try
         {
            data = new XML(loaderStruct.assetLoader.content as String);
         }
         catch(e:Error)
         {
            Logger.log("[AvatarAssetDownloadManager] Error: " + e.message);
            return;
         }
         this.loadFigureMapData(data);
      }
   }
}
