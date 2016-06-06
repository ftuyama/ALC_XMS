library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY pe_rcv_ifc_SYNC_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(10 DOWNTO 0)
  );
END pe_rcv_ifc_SYNC_Block;

ARCHITECTURE version OF pe_rcv_ifc_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "00----00000") then OUTPUT <= "1~~~~~~~~~~";
     elsif std_match(INPUT, "-00-000-000") then OUTPUT <= "~~~1~~~~11~";
     elsif std_match(INPUT, "00-000--000") then OUTPUT <= "~~~1~~~~11~";
     elsif std_match(INPUT, "1-1-0--000-") then OUTPUT <= "~1~~~~~~~~~";
     elsif std_match(INPUT, "0-1----0000") then OUTPUT <= "~~~~~~~~~11";
     elsif std_match(INPUT, "1---00-0000") then OUTPUT <= "~~1~~~~11~~";
     elsif std_match(INPUT, "---100--0-0") then OUTPUT <= "~~1~~~~11~~";
     elsif std_match(INPUT, "0--1--0---0") then OUTPUT <= "1~~~~~~~~11";
     elsif std_match(INPUT, "--10----1--") then OUTPUT <= "~~~~1~~~~~~";
     elsif std_match(INPUT, "1-1----1---") then OUTPUT <= "~~~~1~~~~~~";
     elsif std_match(INPUT, "000-----1--") then OUTPUT <= "~~~1~~~~11~";
     elsif std_match(INPUT, "1-0--1-----") then OUTPUT <= "~1~~~~~1~~~";
     elsif std_match(INPUT, "--00------1") then OUTPUT <= "~~~~~~1~1~~";
     elsif std_match(INPUT, "0-0------1-") then OUTPUT <= "~~~~~~1~1~~";
     elsif std_match(INPUT, "1-0-1------") then OUTPUT <= "1~~~~~~~1~~";
     elsif std_match(INPUT, "1-------1--") then OUTPUT <= "~~~~1~~~~~~";
     elsif std_match(INPUT, "1-1-1------") then OUTPUT <= "~~~~~1~11~~";
     elsif std_match(INPUT, "1--1----0--") then OUTPUT <= "~~1~~~~11~~";
     elsif std_match(INPUT, "0---------1") then OUTPUT <= "~~~~~~1~1~~";
     elsif std_match(INPUT, "--1------1-") then OUTPUT <= "~~~~~1~11~~";
     elsif std_match(INPUT, "-1---------") then OUTPUT <= "~~1~~~~1~~~";
     elsif std_match(INPUT, "1--------1-") then OUTPUT <= "~~~~~1~11~~";
     elsif std_match(INPUT, "00001000000") then OUTPUT <= "~0000000000";
     elsif std_match(INPUT, "00000100000") then OUTPUT <= "~0000000000";
     elsif std_match(INPUT, "00000010000") then OUTPUT <= "000~0000~~0";
     elsif std_match(INPUT, "00000001000") then OUTPUT <= "000~0000~~0";
     elsif std_match(INPUT, "00000000100") then OUTPUT <= "000~0000~~0";
     elsif std_match(INPUT, "00011000000") then OUTPUT <= "~00000000~~";
     elsif std_match(INPUT, "00010100000") then OUTPUT <= "~00000000~~";
     elsif std_match(INPUT, "00010010000") then OUTPUT <= "00~0000~~00";
     elsif std_match(INPUT, "00101000000") then OUTPUT <= "~00000000~~";
     elsif std_match(INPUT, "00100100000") then OUTPUT <= "~00000000~~";
     elsif std_match(INPUT, "00100001000") then OUTPUT <= "000~0000~~0";
     elsif std_match(INPUT, "00100000100") then OUTPUT <= "0000~000000";
     elsif std_match(INPUT, "00111000000") then OUTPUT <= "~00000000~~";
     elsif std_match(INPUT, "00110100000") then OUTPUT <= "~00000000~~";
     elsif std_match(INPUT, "00110000100") then OUTPUT <= "~00000000~~";
     elsif std_match(INPUT, "01001000000") then OUTPUT <= "00~0000~000";
     elsif std_match(INPUT, "01000010000") then OUTPUT <= "00~0000~000";
     elsif std_match(INPUT, "01000001000") then OUTPUT <= "00~0000~000";
     elsif std_match(INPUT, "01000000100") then OUTPUT <= "00~0000~000";
     elsif std_match(INPUT, "10001000000") then OUTPUT <= "~0000000~00";
     elsif std_match(INPUT, "10000100000") then OUTPUT <= "0~00000~000";
     elsif std_match(INPUT, "10000010000") then OUTPUT <= "00~0000~~00";
     elsif std_match(INPUT, "10000001000") then OUTPUT <= "000~0000~~0";
     elsif std_match(INPUT, "10000000100") then OUTPUT <= "0000~000000";
     elsif std_match(INPUT, "10010010000") then OUTPUT <= "00~0000~~00";
     elsif std_match(INPUT, "10101000000") then OUTPUT <= "00000~0~~00";
     elsif std_match(INPUT, "10100100000") then OUTPUT <= "0~000000000";
     elsif std_match(INPUT, "10100001000") then OUTPUT <= "0000~000000";
     elsif std_match(INPUT, "10100000100") then OUTPUT <= "0000~000000";
     elsif std_match(INPUT, "10110000100") then OUTPUT <= "0000~000000";
     elsif std_match(INPUT, "00000000010") then OUTPUT <= "000000~0~00";
     elsif std_match(INPUT, "10100000010") then OUTPUT <= "00000~0~~00";
     elsif std_match(INPUT, "10000000010") then OUTPUT <= "00000~0~~00";
     elsif std_match(INPUT, "00100000010") then OUTPUT <= "00000~0~~00";
     elsif std_match(INPUT, "10100000001") then OUTPUT <= "0~000000000";
     elsif std_match(INPUT, "10010000001") then OUTPUT <= "00~0000~~00";
     elsif std_match(INPUT, "00000000001") then OUTPUT <= "000000~0~00";
     elsif std_match(INPUT, "00100000001") then OUTPUT <= "000000~0~00";
     elsif std_match(INPUT, "10000000001") then OUTPUT <= "000000~0~00";
     elsif std_match(INPUT, "00010000001") then OUTPUT <= "000000~0~00";
     else OUTPUT <= "-----------";
    END if;

  END PROCESS;
END version;
