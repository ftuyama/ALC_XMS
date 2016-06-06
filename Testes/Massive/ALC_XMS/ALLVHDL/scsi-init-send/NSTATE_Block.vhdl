library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY NSTATE_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END NSTATE_Block;

ARCHITECTURE version OF NSTATE_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "-000101") then OUTPUT <= "11";
     elsif std_match(INPUT, "-000111") then OUTPUT <= "11";
     elsif std_match(INPUT, "1100001") then OUTPUT <= "00";
     elsif std_match(INPUT, "0100101") then OUTPUT <= "01";
     elsif std_match(INPUT, "0100111") then OUTPUT <= "11";
     elsif std_match(INPUT, "1100101") then OUTPUT <= "01";
     elsif std_match(INPUT, "1100111") then OUTPUT <= "11";
     elsif std_match(INPUT, "-101101") then OUTPUT <= "01";
     elsif std_match(INPUT, "-101111") then OUTPUT <= "01";
     elsif std_match(INPUT, "-110001") then OUTPUT <= "01";
     elsif std_match(INPUT, "-110101") then OUTPUT <= "01";
     elsif std_match(INPUT, "-111101") then OUTPUT <= "01";
     elsif std_match(INPUT, "-110100") then OUTPUT <= "10";
     elsif std_match(INPUT, "-100000") then OUTPUT <= "00";
     elsif std_match(INPUT, "-100100") then OUTPUT <= "00";
     elsif std_match(INPUT, "-110000") then OUTPUT <= "00";
     elsif std_match(INPUT, "1100110") then OUTPUT <= "11";
     elsif std_match(INPUT, "0100110") then OUTPUT <= "01";
     elsif std_match(INPUT, "-110110") then OUTPUT <= "10";
     else OUTPUT <= "--";
    END if;

  END PROCESS;
END version;
