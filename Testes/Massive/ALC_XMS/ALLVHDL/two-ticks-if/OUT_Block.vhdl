library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "00001") then OUTPUT <= "10";
     elsif std_match(INPUT, "00000") then OUTPUT <= "00";
     elsif std_match(INPUT, "00011") then OUTPUT <= "01";
     elsif std_match(INPUT, "00010") then OUTPUT <= "01";
     elsif std_match(INPUT, "00101") then OUTPUT <= "00";
     elsif std_match(INPUT, "00100") then OUTPUT <= "00";
     elsif std_match(INPUT, "01001") then OUTPUT <= "10";
     elsif std_match(INPUT, "10001") then OUTPUT <= "10";
     elsif std_match(INPUT, "10000") then OUTPUT <= "10";
     elsif std_match(INPUT, "10011") then OUTPUT <= "10";
     elsif std_match(INPUT, "10101") then OUTPUT <= "10";
     elsif std_match(INPUT, "10100") then OUTPUT <= "10";
     elsif std_match(INPUT, "11001") then OUTPUT <= "10";
     else OUTPUT <= "--";
    END if;

  END PROCESS;
END version;
