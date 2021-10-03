package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1253:BigInteger;
      
      private var var_853:BigInteger;
      
      private var var_1600:BigInteger;
      
      private var var_1599:BigInteger;
      
      private var var_2276:BigInteger;
      
      private var var_1912:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1253 = param1;
         this.var_1600 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2276.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1599 = new BigInteger();
         this.var_1599.fromRadix(param1,param2);
         this.var_2276 = this.var_1599.modPow(this.var_853,this.var_1253);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_1912.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1253.toString() + ",generator: " + this.var_1600.toString() + ",secret: " + param1);
         this.var_853 = new BigInteger();
         this.var_853.fromRadix(param1,param2);
         this.var_1912 = this.var_1600.modPow(this.var_853,this.var_1253);
         return true;
      }
   }
}
