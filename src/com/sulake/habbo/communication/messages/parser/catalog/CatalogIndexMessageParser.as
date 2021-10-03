package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
   
   public class CatalogIndexMessageParser implements IMessageParser
   {
       
      
      private var var_126:NodeData;
      
      public function CatalogIndexMessageParser()
      {
         super();
      }
      
      public function get root() : NodeData
      {
         return this.var_126;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_126 = new NodeData(param1);
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_126 = null;
         return true;
      }
   }
}
