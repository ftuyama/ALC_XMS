library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "0001") then OUTPUT <= "000";
     elsif std_match(INPUT, "0011") then OUTPUT <= "100";
     elsif std_match(INPUT, "0101") then OUTPUT <= "001";
     elsif std_match(INPUT, "0111") then OUTPUT <= "100";
     elsif std_match(INPUT, "1001") then OUTPUT <= "010";
     elsif std_match(INPUT, "1011") then OUTPUT <= "111";
     elsif std_match(INPUT, "1111") then OUTPUT <= "100";
     elsif std_match(INPUT, "---0") then OUTPUT <= "---";
     else OUTPUT <= "---";
    END if;

  END PROCESS;
END version;
