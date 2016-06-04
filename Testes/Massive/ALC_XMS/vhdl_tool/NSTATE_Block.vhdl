library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY NSTATE_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END NSTATE_Block;

ARCHITECTURE version OF NSTATE_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "011000") then OUTPUT <= "0100";
     elsif std_match(INPUT, "111000") then OUTPUT <= "0010";
     elsif std_match(INPUT, "000100") then OUTPUT <= "1000";
     elsif std_match(INPUT, "100100") then OUTPUT <= "0001";
     elsif std_match(INPUT, "100010") then OUTPUT <= "1000";
     elsif std_match(INPUT, "000010") then OUTPUT <= "0001";
     elsif std_match(INPUT, "110001") then OUTPUT <= "0100";
     elsif std_match(INPUT, "010001") then OUTPUT <= "0010";
     elsif std_match(INPUT, "-01000") then OUTPUT <= "1000";
     elsif std_match(INPUT, "-10100") then OUTPUT <= "0100";
     elsif std_match(INPUT, "-10010") then OUTPUT <= "0010";
     elsif std_match(INPUT, "-00001") then OUTPUT <= "0001";
     else OUTPUT <= "----";
    END if;

  END PROCESS;
END version;
