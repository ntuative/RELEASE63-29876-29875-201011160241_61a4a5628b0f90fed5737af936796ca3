package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_672:int = -1;
      
      public static const const_1090:int = -1;
       
      
      private var var_2522:int = 0;
      
      private var var_2523:int = -1;
      
      private var var_163:int = 0;
      
      private var var_2190:int = 1;
      
      private var var_1794:int = 1;
      
      private var var_895:int = 1;
      
      private var var_2521:Boolean = false;
      
      private var _x:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0)
      {
         super();
         this._id = param1;
         this._x = param2;
         this.var_163 = param3;
         this.var_2521 = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         this.var_2190 = param4;
         if(param5 < 0)
         {
            param5 = const_672;
         }
         this.var_895 = param5;
         this.var_1794 = param5;
         if(param7 >= 0)
         {
            this.var_2523 = param7;
            this.var_2522 = param8;
         }
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.var_895 > 0 && param1 > this.var_895)
         {
            param1 = this.var_895;
         }
         this.var_1794 = param1;
      }
      
      public function get y() : int
      {
         return this.var_163;
      }
      
      public function get frameRepeats() : int
      {
         return this.var_895;
      }
      
      public function get activeSequenceOffset() : int
      {
         return this.var_2522;
      }
      
      public function get id() : int
      {
         if(this._id >= 0)
         {
            return this._id;
         }
         return -this._id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(this.var_895 < 0)
         {
            return const_672;
         }
         return this.var_1794;
      }
      
      public function get activeSequence() : int
      {
         return this.var_2523;
      }
      
      public function get isLastFrame() : Boolean
      {
         return this.var_2521;
      }
      
      public function get repeats() : int
      {
         return this.var_2190;
      }
      
      public function get x() : int
      {
         return this._x;
      }
   }
}
