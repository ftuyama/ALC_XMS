library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "00011000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00101000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00100010") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00111000") then OUTPUT <= "0100";
     elsif std_match(INPUT, "00110010") then OUTPUT <= "0011";
     elsif std_match(INPUT, "01100010") then OUTPUT <= "0011";
     elsif std_match(INPUT, "01111000") then OUTPUT <= "0000";
     elsif std_match(INPUT, "01110010") then OUTPUT <= "1010";
     elsif std_match(INPUT, "11111000") then OUTPUT <= "0010";
     elsif std_match(INPUT, "11110010") then OUTPUT <= "0010";
     elsif std_match(INPUT, "01110100") then OUTPUT <= "0000";
     elsif std_match(INPUT, "00010100") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00110100") then OUTPUT <= "0011";
     elsif std_match(INPUT, "01010100") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00010001") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00100001") then OUTPUT <= "0011";
     elsif std_match(INPUT, "01110001") then OUTPUT <= "0000";
     elsif std_match(INPUT, "01010001") then OUTPUT <= "0000";
     elsif std_match(INPUT, "00110001") then OUTPUT <= "0000";
     elsif std_match(INPUT, "01100001") then OUTPUT <= "0000";
     else OUTPUT <= "----";
    END if;

  END PROCESS;
END version;
