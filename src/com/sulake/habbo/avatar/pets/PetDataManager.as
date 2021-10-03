package com.sulake.habbo.avatar.pets
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.AvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class PetDataManager implements IPetDataManager
   {
       
      
      private var var_795:Array;
      
      private var var_247:Array;
      
      private var var_1372:Array;
      
      private var var_1373:Array;
      
      private var _assets:AssetLibraryCollection;
      
      private var var_144:AvatarRenderManager;
      
      private var var_485:Map;
      
      public function PetDataManager(param1:AvatarRenderManager, param2:AssetLibraryCollection)
      {
         super();
         this.var_485 = new Map();
         this.var_795 = [];
         this.var_144 = param1;
         this.var_247 = [];
         this._assets = param2;
         this.var_1373 = [];
         this.var_1372 = [];
      }
      
      public function get species() : Map
      {
         return this.var_485;
      }
      
      public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc1_:Array = this._assets.getAssetsByName("petData");
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.content as XML;
               _loc4_ = int(_loc3_.@species);
               if(this.var_485.getValue(_loc4_) == null)
               {
                  this.var_485.add(_loc4_,new PetData(_loc3_));
               }
            }
         }
      }
      
      public function reset() : void
      {
         this.init();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         this._assets = null;
         this.var_144 = null;
         this.var_795 = null;
         this.var_485 = null;
         if(this.var_247 != null)
         {
            for each(_loc1_ in this.var_247)
            {
               _loc1_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.onLoaderComplete);
               _loc1_ = null;
            }
         }
         this.var_247 = null;
         this.var_1373 = null;
         this.var_1372 = null;
      }
      
      public function assetsReady(param1:int, param2:String, param3:IPetDataListener = null) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc4_:* = [];
         switch(param1)
         {
            case 0:
               _loc4_.push("h_dog.swf");
               break;
            case 1:
               _loc4_.push("h_dog.swf");
               _loc4_.push("h_cat.swf");
               break;
            case 2:
               _loc4_.push("h_dog.swf");
               _loc4_.push("h_croco.swf");
               break;
            case 3:
               _loc4_.push("h_terrier.swf");
               break;
            case 4:
               _loc4_.push("h_bear.swf");
               break;
            case 5:
               _loc4_.push("h_pig.swf");
               break;
            case 6:
               _loc4_.push("h_lion.swf");
               break;
            case 7:
               _loc4_.push("h_rhino.swf");
         }
         if(param2 == AvatarScaleType.SMALL)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc4_[_loc5_] = "s" + _loc4_[_loc5_];
               _loc5_++;
            }
         }
         _loc4_.push("pets_palettes.swf");
         var _loc7_:Boolean = true;
         for each(_loc6_ in _loc4_)
         {
            if(this.var_1372.indexOf(_loc6_) == -1)
            {
               _loc7_ = false;
               if(this.var_1373.indexOf(_loc6_) == -1)
               {
                  _loc8_ = new LibraryLoader();
                  this._assets.loadFromFile(_loc8_);
                  _loc8_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.onLoaderComplete);
                  _loc8_.load(new URLRequest(_loc6_));
                  this.var_247.push(_loc8_);
                  this.var_1373.push(_loc6_);
                  if(param3 != null && this.var_795.indexOf(param3) == -1)
                  {
                     this.var_795.push(param3);
                  }
               }
            }
         }
         return _loc7_;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LibraryLoader = param1.target as LibraryLoader;
         _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,this.onLoaderComplete);
         this.var_1372.push(_loc2_.url);
         var _loc3_:int = this.var_247.indexOf(_loc2_);
         if(_loc3_ >= 0)
         {
            this.var_247.splice(_loc3_,1);
         }
         if(this.var_247.length == 0)
         {
            this.var_144.resetPetData();
            this.notifyListeners();
         }
      }
      
      public function getPetData(param1:int, param2:IPetDataListener = null) : IPetData
      {
         var _loc3_:IPetData = this.var_485.getValue(param1) as IPetData;
         if(_loc3_ == null)
         {
            this.assetsReady(param1,AvatarScaleType.const_51,param2);
         }
         return _loc3_;
      }
      
      private function notifyListeners() : void
      {
         var _loc1_:* = null;
         while(this.var_795.length > 0)
         {
            _loc1_ = this.var_795.pop() as IPetDataListener;
            if(_loc1_ != null)
            {
               _loc1_.petDataReady();
            }
         }
      }
      
      public function populateFigureData(param1:XML) : void
      {
         var targetSets:Array = null;
         var targetPalette:XML = null;
         var speciesKeys:Array = null;
         var key:int = 0;
         var petData:PetData = null;
         var petColorData:PetColor = null;
         var breed:Breed = null;
         var colorValue:String = null;
         var color:XML = null;
         var colorId:int = 0;
         var avatarFigureString:String = null;
         var targetSetName:String = null;
         var figureTargetSet:XML = null;
         var figurePart:XML = null;
         var setId:int = 0;
         var figureSet:XML = null;
         var figureData:XML = param1;
         targetSets = ["pbd","phd","ptl"];
         targetPalette = figureData.colors.palette.(@id == "1")[0];
         speciesKeys = this.var_485.getKeys();
         for each(key in speciesKeys)
         {
            petData = this.var_485.getValue(key);
            if(petData != null)
            {
               for each(petColorData in petData.colors)
               {
                  colorValue = petColorData.rgb.toString(16);
                  color = targetPalette.color.(text() == colorValue)[0];
                  if(color == null)
                  {
                     colorId = targetPalette.children().length() + 1;
                     color = <color id="{colorId}" index="{colorId}" club="0" selectable="1">{colorValue}</color>;
                     targetPalette.appendChild(color);
                  }
                  petColorData.figurePartPaletteColorId = parseInt(color.@id);
               }
               for each(breed in petData.breeds)
               {
                  avatarFigureString = "";
                  for each(targetSetName in targetSets)
                  {
                     figureTargetSet = figureData.sets.settype.(@type == targetSetName)[0];
                     if(figureTargetSet == null)
                     {
                        Logger.log("Could not find Figure Target Set for populating Pet Data: " + targetSetName);
                     }
                     else
                     {
                        figurePart = figureTargetSet.GarbageTester.part.(@id == petData.species).(hasOwnProperty("palettemapid") && @palettemapid == breed.patternId)[0];
                        if(figurePart == null)
                        {
                        }
                        setId = figureTargetSet.children().length() + 1;
                        figureSet = <set id="{setId}" gender="U" club="0" colorable="1" selectable="1"/>;
                        figurePart = <part id="{petData.species}" breed="{breed.id}" type="{targetSetName}" colorable="1" colorindex="1" index="1"/>;
                        if(breed.patternId >= 0)
                        {
                           figurePart.@palettemapid = breed.patternId;
                        }
                        figureSet.appendChild(figurePart);
                        figureTargetSet.appendChild(figureSet);
                        avatarFigureString += targetSetName + "-" + setId + "-" + ".";
                     }
                  }
                  breed.avatarFigureString = avatarFigureString;
               }
            }
         }
      }
      
      public function createPetFigureString(param1:int, param2:int, param3:uint) : String
      {
         var _loc4_:PetData = this.var_485.getValue(param1);
         if(_loc4_ == null)
         {
            Logger.log("Could not find Pet Data: " + param1);
            return "";
         }
         var _loc5_:Breed = _loc4_.findBreed(param2);
         var _loc6_:PetColor = _loc4_.findColor(param3);
         if(_loc5_ == null)
         {
            return "";
         }
         if(_loc6_ == null)
         {
            return _loc5_.avatarFigureString;
         }
         var _loc7_:Array = _loc5_.avatarFigureString.split(".");
         return _loc7_.join(_loc6_.figurePartPaletteColorId + ".");
      }
   }
}
