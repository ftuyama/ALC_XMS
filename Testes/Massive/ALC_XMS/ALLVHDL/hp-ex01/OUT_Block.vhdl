library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "000001") then OUTPUT <= "10001";
     elsif std_match(INPUT, "000000") then OUTPUT <= "10000";
     elsif std_match(INPUT, "000011") then OUTPUT <= "10000";
     elsif std_match(INPUT, "000010") then OUTPUT <= "10000";
     elsif std_match(INPUT, "001001") then OUTPUT <= "10001";
     elsif std_match(INPUT, "001000") then OUTPUT <= "10001";
     elsif std_match(INPUT, "001011") then OUTPUT <= "10001";
     elsif std_match(INPUT, "001101") then OUTPUT <= "11000";
     elsif std_match(INPUT, "001100") then OUTPUT <= "11000";
     elsif std_match(INPUT, "010001") then OUTPUT <= "00010";
     elsif std_match(INPUT, "010000") then OUTPUT <= "00010";
     elsif std_match(INPUT, "010010") then OUTPUT <= "10000";
     elsif std_match(INPUT, "101001") then OUTPUT <= "01110";
     elsif std_match(INPUT, "101000") then OUTPUT <= "01110";
     elsif std_match(INPUT, "101101") then OUTPUT <= "11110";
     elsif std_match(INPUT, "101100") then OUTPUT <= "11110";
     elsif std_match(INPUT, "110001") then OUTPUT <= "01010";
     elsif std_match(INPUT, "110000") then OUTPUT <= "01010";
     elsif std_match(INPUT, "111001") then OUTPUT <= "01110";
     elsif std_match(INPUT, "111000") then OUTPUT <= "01110";
     elsif std_match(INPUT, "111101") then OUTPUT <= "01110";
     elsif std_match(INPUT, "111100") then OUTPUT <= "01110";
     else OUTPUT <= "-----";
    END if;

  END PROCESS;
END version;
