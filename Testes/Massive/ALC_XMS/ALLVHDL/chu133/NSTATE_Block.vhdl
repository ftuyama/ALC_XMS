library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY NSTATE_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END NSTATE_Block;

ARCHITECTURE version OF NSTATE_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "0001") then OUTPUT <= "1";
     elsif std_match(INPUT, "0000") then OUTPUT <= "0";
     elsif std_match(INPUT, "0010") then OUTPUT <= "0";
     elsif std_match(INPUT, "0101") then OUTPUT <= "1";
     elsif std_match(INPUT, "0100") then OUTPUT <= "0";
     elsif std_match(INPUT, "0111") then OUTPUT <= "0";
     elsif std_match(INPUT, "0110") then OUTPUT <= "0";
     elsif std_match(INPUT, "1001") then OUTPUT <= "1";
     elsif std_match(INPUT, "1000") then OUTPUT <= "1";
     elsif std_match(INPUT, "1101") then OUTPUT <= "1";
     else OUTPUT <= "-";
    END if;

  END PROCESS;
END version;
