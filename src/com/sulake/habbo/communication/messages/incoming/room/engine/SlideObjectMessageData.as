package com.sulake.habbo.communication.messages.incoming.room.engine
{
   import com.sulake.room.utils.Vector3d;
   
   public class SlideObjectMessageData
   {
      
      public static const const_917:String = "mv";
      
      public static const const_963:String = "sld";
       
      
      private var var_71:Vector3d;
      
      private var var_1571:String;
      
      private var var_164:Boolean = false;
      
      private var _target:Vector3d;
      
      private var _id:int = 0;
      
      public function SlideObjectMessageData(param1:int, param2:Vector3d, param3:Vector3d, param4:String = null)
      {
         super();
         this._id = param1;
         this.var_71 = param2;
         this._target = param3;
         this.var_1571 = param4;
      }
      
      public function setReadOnly() : void
      {
         this.var_164 = true;
      }
      
      public function set moveType(param1:String) : void
      {
         if(!this.var_164)
         {
            this.var_1571 = param1;
         }
      }
      
      public function get loc() : Vector3d
      {
         return this.var_71;
      }
      
      public function set target(param1:Vector3d) : void
      {
         if(!this.var_164)
         {
            this._target = param1;
         }
      }
      
      public function set loc(param1:Vector3d) : void
      {
         if(!this.var_164)
         {
            this.var_71 = param1;
         }
      }
      
      public function get target() : Vector3d
      {
         return this._target;
      }
      
      public function get moveType() : String
      {
         return this.var_1571;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}
