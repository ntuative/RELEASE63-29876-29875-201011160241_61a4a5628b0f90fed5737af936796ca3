package com.sulake.habbo.avatar.structure.figure
{
   import com.sulake.core.utils.Map;
   import flash.utils.Dictionary;
   
   public class SetType implements ISetType
   {
       
      
      private var _partSets:Map;
      
      private var var_513:Dictionary;
      
      private var var_2045:int;
      
      private var _type:String;
      
      public function SetType(param1:XML)
      {
         super();
         this._type = String(param1.@type);
         this.var_2045 = parseInt(param1.@paletteid);
         this.var_513 = new Dictionary();
         this.var_513["F"] = new Dictionary();
         this.var_513["M"] = new Dictionary();
         this.var_513["F"][0] = Boolean(parseInt(param1.@mand_f_0));
         this.var_513["F"][1] = Boolean(parseInt(param1.@mand_f_1));
         this.var_513["M"][0] = Boolean(parseInt(param1.@mand_m_0));
         this.var_513["M"][1] = Boolean(parseInt(param1.@mand_m_1));
         this._partSets = new Map();
         this.append(param1);
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function cleanUp(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         for each(_loc2_ in param1["GarbageTester"])
         {
            _loc3_ = String(_loc2_.@id);
            _loc4_ = this._partSets.getValue(_loc3_);
            if(_loc4_ != null)
            {
               _loc4_.dispose();
               this._partSets.remove(_loc3_);
            }
         }
      }
      
      public function getPartSet(param1:int) : IFigurePartSet
      {
         return this._partSets.getValue(String(param1));
      }
      
      public function getDefaultPartSet(param1:String) : IFigurePartSet
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:Array = this._partSets.getKeys();
         var _loc3_:int = _loc2_.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc5_ = this._partSets.getValue(_loc4_);
            if(_loc5_ && _loc5_.clubLevel == 0 && _loc5_.gender == param1)
            {
               return _loc5_;
            }
            _loc3_--;
         }
         return null;
      }
      
      public function isMandatory(param1:String, param2:int) : Boolean
      {
         return this.var_513[param1.toUpperCase()][Math.min(param2,1)];
      }
      
      public function get paletteID() : int
      {
         return this.var_2045;
      }
      
      public function append(param1:XML) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1["GarbageTester"])
         {
            this._partSets.add(String(_loc2_.@id),new FigurePartSet(_loc2_,this._type));
         }
      }
      
      public function get partSets() : Map
      {
         return this._partSets;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this._partSets.getValues())
         {
            _loc1_.dispose();
         }
         this._partSets.dispose();
         this._partSets = null;
      }
   }
}
