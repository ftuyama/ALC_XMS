library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY NSTATE_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END NSTATE_Block;

ARCHITECTURE version OF NSTATE_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "-0011000") then OUTPUT <= "1000";
     elsif std_match(INPUT, "01001000") then OUTPUT <= "0100";
     elsif std_match(INPUT, "11001000") then OUTPUT <= "0010";
     elsif std_match(INPUT, "-1011000") then OUTPUT <= "1000";
     elsif std_match(INPUT, "-1111000") then OUTPUT <= "1000";
     elsif std_match(INPUT, "-1110010") then OUTPUT <= "1000";
     elsif std_match(INPUT, "-1000010") then OUTPUT <= "0010";
     elsif std_match(INPUT, "-1010010") then OUTPUT <= "0010";
     elsif std_match(INPUT, "-1100010") then OUTPUT <= "0010";
     elsif std_match(INPUT, "-1110100") then OUTPUT <= "0001";
     elsif std_match(INPUT, "-1000100") then OUTPUT <= "0100";
     elsif std_match(INPUT, "-1010100") then OUTPUT <= "0100";
     elsif std_match(INPUT, "-1100100") then OUTPUT <= "0100";
     elsif std_match(INPUT, "-0010001") then OUTPUT <= "1000";
     elsif std_match(INPUT, "-1110001") then OUTPUT <= "0001";
     elsif std_match(INPUT, "-1010001") then OUTPUT <= "0001";
     elsif std_match(INPUT, "-0110001") then OUTPUT <= "0001";
     else OUTPUT <= "----";
    END if;

  END PROCESS;
END version;
