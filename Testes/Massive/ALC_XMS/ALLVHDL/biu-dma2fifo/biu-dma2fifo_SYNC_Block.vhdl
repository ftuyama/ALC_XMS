library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY biu_dma2fifo_SYNC_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
  );
END biu_dma2fifo_SYNC_Block;

ARCHITECTURE version OF biu_dma2fifo_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "---0-1--") then OUTPUT <= "~1~~~~";
     elsif std_match(INPUT, "---0--1-") then OUTPUT <= "~~1~~~";
     elsif std_match(INPUT, "-1011---") then OUTPUT <= "1~~~1~";
     elsif std_match(INPUT, "-1-----1") then OUTPUT <= "~~~1~1";
     elsif std_match(INPUT, "--0--1--") then OUTPUT <= "~1~~~~";
     elsif std_match(INPUT, "--0---1-") then OUTPUT <= "~~1~~~";
     elsif std_match(INPUT, "0--0--0-") then OUTPUT <= "~1~~~~";
     elsif std_match(INPUT, "1--0-0--") then OUTPUT <= "~~1~~~";
     elsif std_match(INPUT, "--110-0-") then OUTPUT <= "~~~1~1";
     elsif std_match(INPUT, "--11-0-0") then OUTPUT <= "1~~~~1";
     elsif std_match(INPUT, "-00-----") then OUTPUT <= "1~~~~~";
     elsif std_match(INPUT, "-0011000") then OUTPUT <= "~00000";
     elsif std_match(INPUT, "01001000") then OUTPUT <= "0~0000";
     elsif std_match(INPUT, "11001000") then OUTPUT <= "00~000";
     elsif std_match(INPUT, "-1011000") then OUTPUT <= "~000~0";
     elsif std_match(INPUT, "-1111000") then OUTPUT <= "~0000~";
     elsif std_match(INPUT, "-1110010") then OUTPUT <= "~0000~";
     elsif std_match(INPUT, "-1000010") then OUTPUT <= "00~000";
     elsif std_match(INPUT, "-1010010") then OUTPUT <= "00~000";
     elsif std_match(INPUT, "-1100010") then OUTPUT <= "00~000";
     elsif std_match(INPUT, "-1110100") then OUTPUT <= "000~0~";
     elsif std_match(INPUT, "-1000100") then OUTPUT <= "0~0000";
     elsif std_match(INPUT, "-1010100") then OUTPUT <= "0~0000";
     elsif std_match(INPUT, "-1100100") then OUTPUT <= "0~0000";
     elsif std_match(INPUT, "-0010001") then OUTPUT <= "~00000";
     elsif std_match(INPUT, "-1110001") then OUTPUT <= "000~0~";
     elsif std_match(INPUT, "-1010001") then OUTPUT <= "000~0~";
     elsif std_match(INPUT, "-0110001") then OUTPUT <= "000~0~";
     else OUTPUT <= "------";
    END if;

  END PROCESS;
END version;
