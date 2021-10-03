package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1648:int = 5;
      
      public static const const_1673:int = 113;
      
      public static const const_1669:int = 29;
      
      public static const const_1583:int = 0;
      
      public static const const_1560:int = 102;
      
      public static const const_1681:int = 25;
      
      public static const const_1704:int = 20;
      
      public static const const_1655:int = 116;
      
      public static const const_1661:int = 114;
      
      public static const const_1618:int = 101;
      
      public static const const_1539:int = 108;
      
      public static const const_1649:int = 112;
      
      public static const const_1577:int = 100;
      
      public static const const_1582:int = 24;
      
      public static const const_1343:int = 10;
      
      public static const const_1563:int = 111;
      
      public static const const_1584:int = 23;
      
      public static const const_1569:int = 26;
      
      public static const const_1290:int = 2;
      
      public static const const_1634:int = 22;
      
      public static const const_1564:int = 17;
      
      public static const const_1668:int = 18;
      
      public static const const_1559:int = 3;
      
      public static const const_1576:int = 109;
      
      public static const const_1278:int = 1;
      
      public static const const_1639:int = 103;
      
      public static const const_1593:int = 11;
      
      public static const const_1692:int = 28;
      
      public static const const_1674:int = 104;
      
      public static const const_1680:int = 13;
      
      public static const const_1687:int = 107;
      
      public static const const_1578:int = 27;
      
      public static const const_1656:int = 118;
      
      public static const const_1715:int = 115;
      
      public static const const_1580:int = 16;
      
      public static const const_1659:int = 19;
      
      public static const const_1612:int = 4;
      
      public static const const_1682:int = 105;
      
      public static const const_1753:int = 117;
      
      public static const const_1546:int = 119;
      
      public static const const_1538:int = 106;
      
      public static const const_1602:int = 12;
      
      public static const const_1731:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get method_2() : int
      {
         return (this.var_10 as DisconnectReasonParser).method_2;
      }
      
      public function get reasonString() : String
      {
         switch(this.method_2)
         {
            case const_1278:
            case const_1343:
               return "banned";
            case const_1290:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
