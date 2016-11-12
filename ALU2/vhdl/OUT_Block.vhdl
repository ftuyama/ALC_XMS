library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(13 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "-0000100000000") then OUTPUT <= "1000000";
     elsif std_match(INPUT, "-0000001000000") then OUTPUT <= "1000000";
     elsif std_match(INPUT, "-0000010000000") then OUTPUT <= "1000000";
     elsif std_match(INPUT, "-1000100000000") then OUTPUT <= "1000100";
     elsif std_match(INPUT, "-1000001000000") then OUTPUT <= "1000100";
     elsif std_match(INPUT, "-1000000100000") then OUTPUT <= "0001010";
     elsif std_match(INPUT, "-1000000010000") then OUTPUT <= "0001010";
     elsif std_match(INPUT, "-1000000001000") then OUTPUT <= "0001010";
     elsif std_match(INPUT, "-1000010000000") then OUTPUT <= "0000000";
     elsif std_match(INPUT, "-1011100000000") then OUTPUT <= "0100000";
     elsif std_match(INPUT, "-1011001000000") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1011000100000") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1011000010000") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1011000001000") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1011010000000") then OUTPUT <= "0000011";
     elsif std_match(INPUT, "01100100000000") then OUTPUT <= "1000000";
     elsif std_match(INPUT, "01100001000000") then OUTPUT <= "1010000";
     elsif std_match(INPUT, "01100000100000") then OUTPUT <= "1101000";
     elsif std_match(INPUT, "01100000010000") then OUTPUT <= "1011010";
     elsif std_match(INPUT, "01100000001000") then OUTPUT <= "1001010";
     elsif std_match(INPUT, "01100010000000") then OUTPUT <= "1001010";
     elsif std_match(INPUT, "11100100000000") then OUTPUT <= "1000000";
     elsif std_match(INPUT, "11100001000000") then OUTPUT <= "1010000";
     elsif std_match(INPUT, "11100000100000") then OUTPUT <= "1101000";
     elsif std_match(INPUT, "11100000010000") then OUTPUT <= "1011010";
     elsif std_match(INPUT, "11100000001000") then OUTPUT <= "1001010";
     elsif std_match(INPUT, "11100010000000") then OUTPUT <= "1000000";
     elsif std_match(INPUT, "01111100000000") then OUTPUT <= "1100011";
     elsif std_match(INPUT, "01111001000000") then OUTPUT <= "1100001";
     elsif std_match(INPUT, "01111000100000") then OUTPUT <= "1100001";
     elsif std_match(INPUT, "01111000010000") then OUTPUT <= "1100001";
     elsif std_match(INPUT, "01111000001000") then OUTPUT <= "1100001";
     elsif std_match(INPUT, "01111010000000") then OUTPUT <= "1100011";
     elsif std_match(INPUT, "11111100000000") then OUTPUT <= "1100001";
     elsif std_match(INPUT, "11111001000000") then OUTPUT <= "1100001";
     elsif std_match(INPUT, "11111000100000") then OUTPUT <= "1100001";
     elsif std_match(INPUT, "11111000010000") then OUTPUT <= "1100001";
     elsif std_match(INPUT, "11111000001000") then OUTPUT <= "1100001";
     elsif std_match(INPUT, "11111010000000") then OUTPUT <= "1100011";
     elsif std_match(INPUT, "-1011000000001") then OUTPUT <= "0100000";
     elsif std_match(INPUT, "-1100000000001") then OUTPUT <= "1101000";
     elsif std_match(INPUT, "-1101000000001") then OUTPUT <= "1101000";
     elsif std_match(INPUT, "-1110000000001") then OUTPUT <= "1101000";
     elsif std_match(INPUT, "-1111000000001") then OUTPUT <= "1101000";
     elsif std_match(INPUT, "-1000000000001") then OUTPUT <= "1101000";
     elsif std_match(INPUT, "-1001000000001") then OUTPUT <= "1101000";
     elsif std_match(INPUT, "-1010000000001") then OUTPUT <= "1101000";
     elsif std_match(INPUT, "-1100000000010") then OUTPUT <= "1011010";
     elsif std_match(INPUT, "-1011000000010") then OUTPUT <= "0000011";
     elsif std_match(INPUT, "-1010000000010") then OUTPUT <= "0000011";
     elsif std_match(INPUT, "-1001000000010") then OUTPUT <= "0000011";
     elsif std_match(INPUT, "-1000000000010") then OUTPUT <= "0000011";
     elsif std_match(INPUT, "-1111000000010") then OUTPUT <= "0000011";
     elsif std_match(INPUT, "-1110000000010") then OUTPUT <= "0000011";
     elsif std_match(INPUT, "-1101000000010") then OUTPUT <= "0000011";
     elsif std_match(INPUT, "-1100000000100") then OUTPUT <= "1010000";
     elsif std_match(INPUT, "-1011000000100") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1010000000100") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1001000000100") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1000000000100") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1111000000100") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1110000000100") then OUTPUT <= "0000001";
     elsif std_match(INPUT, "-1101000000100") then OUTPUT <= "0000001";
     else OUTPUT <= "-------";
    END if;

  END PROCESS;
END version;
