library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY FGC_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END FGC_Block;

ARCHITECTURE version OF FGC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "0001") then OUTPUT <= "0";
     elsif std_match(INPUT, "0011") then OUTPUT <= "0";
     elsif std_match(INPUT, "0101") then OUTPUT <= "0";
     elsif std_match(INPUT, "0111") then OUTPUT <= "0";
     elsif std_match(INPUT, "1001") then OUTPUT <= "0";
     elsif std_match(INPUT, "1011") then OUTPUT <= "0";
     elsif std_match(INPUT, "1111") then OUTPUT <= "0";
     elsif std_match(INPUT, "---0") then OUTPUT <= "-";
     else OUTPUT <= "-";
    END if;

  END PROCESS;
END version;
