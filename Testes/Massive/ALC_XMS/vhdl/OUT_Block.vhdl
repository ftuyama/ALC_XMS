library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "011000") then OUTPUT <= "01";
     elsif std_match(INPUT, "111000") then OUTPUT <= "10";
     elsif std_match(INPUT, "000100") then OUTPUT <= "00";
     elsif std_match(INPUT, "100100") then OUTPUT <= "11";
     elsif std_match(INPUT, "100010") then OUTPUT <= "00";
     elsif std_match(INPUT, "000010") then OUTPUT <= "11";
     elsif std_match(INPUT, "110001") then OUTPUT <= "01";
     elsif std_match(INPUT, "010001") then OUTPUT <= "10";
     elsif std_match(INPUT, "-01000") then OUTPUT <= "00";
     elsif std_match(INPUT, "-10100") then OUTPUT <= "01";
     elsif std_match(INPUT, "-10010") then OUTPUT <= "10";
     elsif std_match(INPUT, "-00001") then OUTPUT <= "11";
     else OUTPUT <= "--";
    END if;

  END PROCESS;
END version;
