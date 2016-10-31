library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "-001100") then OUTPUT <= "00";
     elsif std_match(INPUT, "-001010") then OUTPUT <= "00";
     elsif std_match(INPUT, "-100010") then OUTPUT <= "00";
     elsif std_match(INPUT, "-101100") then OUTPUT <= "01";
     elsif std_match(INPUT, "-101010") then OUTPUT <= "01";
     elsif std_match(INPUT, "0110100") then OUTPUT <= "00";
     elsif std_match(INPUT, "0110010") then OUTPUT <= "00";
     elsif std_match(INPUT, "1110100") then OUTPUT <= "00";
     elsif std_match(INPUT, "1110010") then OUTPUT <= "00";
     elsif std_match(INPUT, "-111100") then OUTPUT <= "10";
     elsif std_match(INPUT, "-111010") then OUTPUT <= "00";
     elsif std_match(INPUT, "-001001") then OUTPUT <= "00";
     elsif std_match(INPUT, "-110001") then OUTPUT <= "00";
     elsif std_match(INPUT, "-111001") then OUTPUT <= "00";
     elsif std_match(INPUT, "-100001") then OUTPUT <= "00";
     elsif std_match(INPUT, "-101001") then OUTPUT <= "00";
     elsif std_match(INPUT, "-010001") then OUTPUT <= "00";
     elsif std_match(INPUT, "-011001") then OUTPUT <= "00";
     elsif std_match(INPUT, "-000001") then OUTPUT <= "00";
     else OUTPUT <= "--";
    END if;

  END PROCESS;
END version;
