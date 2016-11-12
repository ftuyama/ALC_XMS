library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY FGC_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(13 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END FGC_Block;

ARCHITECTURE version OF FGC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "-0000100000000") then OUTPUT <= "1";
     elsif std_match(INPUT, "-0000001000000") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1000000010000") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1000000001000") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1011001000000") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1011000100000") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1011000010000") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1011000001000") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1011010000000") then OUTPUT <= "1";
     elsif std_match(INPUT, "01100000100000") then OUTPUT <= "1";
     elsif std_match(INPUT, "01100010000000") then OUTPUT <= "1";
     elsif std_match(INPUT, "11100000100000") then OUTPUT <= "1";
     elsif std_match(INPUT, "11100010000000") then OUTPUT <= "1";
     elsif std_match(INPUT, "01111100000000") then OUTPUT <= "1";
     elsif std_match(INPUT, "01111000100000") then OUTPUT <= "1";
     elsif std_match(INPUT, "01111000010000") then OUTPUT <= "1";
     elsif std_match(INPUT, "01111000001000") then OUTPUT <= "1";
     elsif std_match(INPUT, "11111100000000") then OUTPUT <= "1";
     elsif std_match(INPUT, "11111000100000") then OUTPUT <= "1";
     elsif std_match(INPUT, "11111000010000") then OUTPUT <= "1";
     elsif std_match(INPUT, "11111000001000") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1011000000001") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1100000000010") then OUTPUT <= "1";
     elsif std_match(INPUT, "-1100000000100") then OUTPUT <= "1";
     else OUTPUT <= "0";
    END if;

  END PROCESS;
END version;
