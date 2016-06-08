library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "-000101") then OUTPUT <= "000";
     elsif std_match(INPUT, "-000111") then OUTPUT <= "000";
     elsif std_match(INPUT, "1100001") then OUTPUT <= "001";
     elsif std_match(INPUT, "0100101") then OUTPUT <= "000";
     elsif std_match(INPUT, "0100111") then OUTPUT <= "100";
     elsif std_match(INPUT, "1100101") then OUTPUT <= "000";
     elsif std_match(INPUT, "1100111") then OUTPUT <= "100";
     elsif std_match(INPUT, "-101101") then OUTPUT <= "000";
     elsif std_match(INPUT, "-101111") then OUTPUT <= "000";
     elsif std_match(INPUT, "-110001") then OUTPUT <= "010";
     elsif std_match(INPUT, "-110101") then OUTPUT <= "010";
     elsif std_match(INPUT, "-111101") then OUTPUT <= "000";
     elsif std_match(INPUT, "-110100") then OUTPUT <= "011";
     elsif std_match(INPUT, "-100000") then OUTPUT <= "001";
     elsif std_match(INPUT, "-100100") then OUTPUT <= "001";
     elsif std_match(INPUT, "-110000") then OUTPUT <= "001";
     elsif std_match(INPUT, "1100110") then OUTPUT <= "100";
     elsif std_match(INPUT, "0100110") then OUTPUT <= "000";
     elsif std_match(INPUT, "-110110") then OUTPUT <= "011";
     else OUTPUT <= "---";
    END if;

  END PROCESS;
END version;
