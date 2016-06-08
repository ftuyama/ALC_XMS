library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "-0001000") then OUTPUT <= "00001";
     elsif std_match(INPUT, "-0000010") then OUTPUT <= "00001";
     elsif std_match(INPUT, "-0000100") then OUTPUT <= "00001";
     elsif std_match(INPUT, "-0000001") then OUTPUT <= "10000";
     elsif std_match(INPUT, "-0011000") then OUTPUT <= "00000";
     elsif std_match(INPUT, "-0010010") then OUTPUT <= "00000";
     elsif std_match(INPUT, "-0010100") then OUTPUT <= "00000";
     elsif std_match(INPUT, "-0010001") then OUTPUT <= "00000";
     elsif std_match(INPUT, "-0101000") then OUTPUT <= "10000";
     elsif std_match(INPUT, "-0100010") then OUTPUT <= "10000";
     elsif std_match(INPUT, "-0100100") then OUTPUT <= "10000";
     elsif std_match(INPUT, "-0100001") then OUTPUT <= "10000";
     elsif std_match(INPUT, "-0110001") then OUTPUT <= "10000";
     elsif std_match(INPUT, "-1011000") then OUTPUT <= "00000";
     elsif std_match(INPUT, "-1010010") then OUTPUT <= "00000";
     elsif std_match(INPUT, "-1010100") then OUTPUT <= "00000";
     elsif std_match(INPUT, "-1010001") then OUTPUT <= "00000";
     elsif std_match(INPUT, "01101000") then OUTPUT <= "11010";
     elsif std_match(INPUT, "01100010") then OUTPUT <= "11010";
     elsif std_match(INPUT, "01100100") then OUTPUT <= "10101";
     elsif std_match(INPUT, "01100001") then OUTPUT <= "10000";
     elsif std_match(INPUT, "11101000") then OUTPUT <= "10101";
     elsif std_match(INPUT, "11100010") then OUTPUT <= "11010";
     elsif std_match(INPUT, "11100100") then OUTPUT <= "10101";
     elsif std_match(INPUT, "11100001") then OUTPUT <= "10000";
     elsif std_match(INPUT, "-1111000") then OUTPUT <= "00000";
     elsif std_match(INPUT, "-1110010") then OUTPUT <= "10000";
     elsif std_match(INPUT, "-1110100") then OUTPUT <= "10000";
     elsif std_match(INPUT, "-1110001") then OUTPUT <= "10000";
     else OUTPUT <= "-----";
    END if;

  END PROCESS;
END version;
