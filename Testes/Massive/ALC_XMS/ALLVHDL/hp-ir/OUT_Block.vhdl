library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "0001") then OUTPUT <= "00";
     elsif std_match(INPUT, "1001") then OUTPUT <= "10";
     elsif std_match(INPUT, "1011") then OUTPUT <= "00";
     elsif std_match(INPUT, "1101") then OUTPUT <= "01";
     elsif std_match(INPUT, "1010") then OUTPUT <= "00";
     elsif std_match(INPUT, "0000") then OUTPUT <= "00";
     elsif std_match(INPUT, "1100") then OUTPUT <= "01";
     elsif std_match(INPUT, "1110") then OUTPUT <= "01";
     elsif std_match(INPUT, "1000") then OUTPUT <= "01";
     elsif std_match(INPUT, "0100") then OUTPUT <= "01";
     else OUTPUT <= "--";
    END if;

  END PROCESS;
END version;
