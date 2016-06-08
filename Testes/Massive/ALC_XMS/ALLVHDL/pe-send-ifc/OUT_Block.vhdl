library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "000001000") then OUTPUT <= "000";
     elsif std_match(INPUT, "000000100") then OUTPUT <= "000";
     elsif std_match(INPUT, "001000100") then OUTPUT <= "000";
     elsif std_match(INPUT, "010000100") then OUTPUT <= "000";
     elsif std_match(INPUT, "011000100") then OUTPUT <= "000";
     elsif std_match(INPUT, "100001000") then OUTPUT <= "000";
     elsif std_match(INPUT, "100000010") then OUTPUT <= "000";
     elsif std_match(INPUT, "100000100") then OUTPUT <= "000";
     elsif std_match(INPUT, "100011000") then OUTPUT <= "110";
     elsif std_match(INPUT, "100010010") then OUTPUT <= "110";
     elsif std_match(INPUT, "100010100") then OUTPUT <= "000";
     elsif std_match(INPUT, "100101000") then OUTPUT <= "000";
     elsif std_match(INPUT, "100100010") then OUTPUT <= "000";
     elsif std_match(INPUT, "100100100") then OUTPUT <= "000";
     elsif std_match(INPUT, "100110100") then OUTPUT <= "000";
     elsif std_match(INPUT, "101001000") then OUTPUT <= "101";
     elsif std_match(INPUT, "101000010") then OUTPUT <= "101";
     elsif std_match(INPUT, "101000100") then OUTPUT <= "000";
     elsif std_match(INPUT, "101101000") then OUTPUT <= "111";
     elsif std_match(INPUT, "101100010") then OUTPUT <= "111";
     elsif std_match(INPUT, "101100100") then OUTPUT <= "000";
     elsif std_match(INPUT, "110001000") then OUTPUT <= "100";
     elsif std_match(INPUT, "110000010") then OUTPUT <= "110";
     elsif std_match(INPUT, "110000100") then OUTPUT <= "000";
     elsif std_match(INPUT, "110010010") then OUTPUT <= "110";
     elsif std_match(INPUT, "110010100") then OUTPUT <= "110";
     elsif std_match(INPUT, "110101000") then OUTPUT <= "100";
     elsif std_match(INPUT, "110100010") then OUTPUT <= "100";
     elsif std_match(INPUT, "110100100") then OUTPUT <= "000";
     elsif std_match(INPUT, "110110100") then OUTPUT <= "000";
     elsif std_match(INPUT, "111001000") then OUTPUT <= "001";
     elsif std_match(INPUT, "111000010") then OUTPUT <= "001";
     elsif std_match(INPUT, "111000100") then OUTPUT <= "001";
     elsif std_match(INPUT, "111101000") then OUTPUT <= "011";
     elsif std_match(INPUT, "111100010") then OUTPUT <= "011";
     elsif std_match(INPUT, "111100100") then OUTPUT <= "000";
     elsif std_match(INPUT, "101000001") then OUTPUT <= "101";
     elsif std_match(INPUT, "100010001") then OUTPUT <= "110";
     elsif std_match(INPUT, "110100001") then OUTPUT <= "100";
     elsif std_match(INPUT, "110000001") then OUTPUT <= "100";
     elsif std_match(INPUT, "111100001") then OUTPUT <= "100";
     elsif std_match(INPUT, "111000001") then OUTPUT <= "100";
     elsif std_match(INPUT, "100100001") then OUTPUT <= "100";
     elsif std_match(INPUT, "100000001") then OUTPUT <= "100";
     elsif std_match(INPUT, "101100001") then OUTPUT <= "100";
     elsif std_match(INPUT, "110110001") then OUTPUT <= "100";
     elsif std_match(INPUT, "110010001") then OUTPUT <= "100";
     elsif std_match(INPUT, "100110001") then OUTPUT <= "100";
     else OUTPUT <= "---";
    END if;

  END PROCESS;
END version;
