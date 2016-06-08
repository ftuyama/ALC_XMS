library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(10 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "00001000000") then OUTPUT <= "0000";
     elsif std_match(INPUT, "00000100000") then OUTPUT <= "0000";
     elsif std_match(INPUT, "00000010000") then OUTPUT <= "0110";
     elsif std_match(INPUT, "00000001000") then OUTPUT <= "0110";
     elsif std_match(INPUT, "00000000100") then OUTPUT <= "0110";
     elsif std_match(INPUT, "00011000000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00010100000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00010010000") then OUTPUT <= "1100";
     elsif std_match(INPUT, "00101000000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00100100000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00100001000") then OUTPUT <= "0110";
     elsif std_match(INPUT, "00100000100") then OUTPUT <= "0000";
     elsif std_match(INPUT, "00111000000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00110100000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "00110000100") then OUTPUT <= "0011";
     elsif std_match(INPUT, "01001000000") then OUTPUT <= "1000";
     elsif std_match(INPUT, "01000010000") then OUTPUT <= "1000";
     elsif std_match(INPUT, "01000001000") then OUTPUT <= "1000";
     elsif std_match(INPUT, "01000000100") then OUTPUT <= "1000";
     elsif std_match(INPUT, "10001000000") then OUTPUT <= "0100";
     elsif std_match(INPUT, "10000100000") then OUTPUT <= "1000";
     elsif std_match(INPUT, "10000010000") then OUTPUT <= "1100";
     elsif std_match(INPUT, "10000001000") then OUTPUT <= "0110";
     elsif std_match(INPUT, "10000000100") then OUTPUT <= "0000";
     elsif std_match(INPUT, "10010010000") then OUTPUT <= "1100";
     elsif std_match(INPUT, "10101000000") then OUTPUT <= "1100";
     elsif std_match(INPUT, "10100100000") then OUTPUT <= "0000";
     elsif std_match(INPUT, "10100001000") then OUTPUT <= "0000";
     elsif std_match(INPUT, "10100000100") then OUTPUT <= "0000";
     elsif std_match(INPUT, "10110000100") then OUTPUT <= "0000";
     elsif std_match(INPUT, "00000000010") then OUTPUT <= "0100";
     elsif std_match(INPUT, "10100000010") then OUTPUT <= "1100";
     elsif std_match(INPUT, "10000000010") then OUTPUT <= "1100";
     elsif std_match(INPUT, "00100000010") then OUTPUT <= "1100";
     elsif std_match(INPUT, "10100000001") then OUTPUT <= "0000";
     elsif std_match(INPUT, "10010000001") then OUTPUT <= "1100";
     elsif std_match(INPUT, "00000000001") then OUTPUT <= "0100";
     elsif std_match(INPUT, "00100000001") then OUTPUT <= "0100";
     elsif std_match(INPUT, "10000000001") then OUTPUT <= "0100";
     elsif std_match(INPUT, "00010000001") then OUTPUT <= "0100";
     else OUTPUT <= "----";
    END if;

  END PROCESS;
END version;
