library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY FGC_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END FGC_Block;

ARCHITECTURE version OF FGC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "00011000") then OUTPUT <= "1";
     elsif std_match(INPUT, "00101000") then OUTPUT <= "1";
     elsif std_match(INPUT, "00100010") then OUTPUT <= "0";
     elsif std_match(INPUT, "00111000") then OUTPUT <= "0";
     elsif std_match(INPUT, "00110010") then OUTPUT <= "0";
     elsif std_match(INPUT, "01100010") then OUTPUT <= "0";
     elsif std_match(INPUT, "01111000") then OUTPUT <= "0";
     elsif std_match(INPUT, "01110010") then OUTPUT <= "0";
     elsif std_match(INPUT, "11111000") then OUTPUT <= "0";
     elsif std_match(INPUT, "11110010") then OUTPUT <= "1";
     elsif std_match(INPUT, "01110100") then OUTPUT <= "1";
     elsif std_match(INPUT, "00010100") then OUTPUT <= "0";
     elsif std_match(INPUT, "00110100") then OUTPUT <= "0";
     elsif std_match(INPUT, "01010100") then OUTPUT <= "0";
     elsif std_match(INPUT, "00010001") then OUTPUT <= "1";
     elsif std_match(INPUT, "00100001") then OUTPUT <= "1";
     elsif std_match(INPUT, "01110001") then OUTPUT <= "0";
     elsif std_match(INPUT, "01010001") then OUTPUT <= "0";
     elsif std_match(INPUT, "00110001") then OUTPUT <= "0";
     elsif std_match(INPUT, "01100001") then OUTPUT <= "0";
     else OUTPUT <= "-";
    END if;

  END PROCESS;
END version;
