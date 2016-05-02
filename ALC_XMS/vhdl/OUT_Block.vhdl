library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "0000101") then OUTPUT <= "0000";
     elsif std_match(INPUT, "0000000") then OUTPUT <= "0000";
     elsif std_match(INPUT, "0000111") then OUTPUT <= "0110";
     elsif std_match(INPUT, "0000110") then OUTPUT <= "0110";
     elsif std_match(INPUT, "0000100") then OUTPUT <= "0110";
     elsif std_match(INPUT, "0001101") then OUTPUT <= "0011";
     elsif std_match(INPUT, "0001000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "0001111") then OUTPUT <= "1100";
     elsif std_match(INPUT, "0010101") then OUTPUT <= "0011";
     elsif std_match(INPUT, "0010000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "0010110") then OUTPUT <= "0110";
     elsif std_match(INPUT, "0010100") then OUTPUT <= "0000";
     elsif std_match(INPUT, "0011101") then OUTPUT <= "0011";
     elsif std_match(INPUT, "0011000") then OUTPUT <= "0011";
     elsif std_match(INPUT, "0011100") then OUTPUT <= "0011";
     elsif std_match(INPUT, "0100101") then OUTPUT <= "1000";
     elsif std_match(INPUT, "0100111") then OUTPUT <= "1000";
     elsif std_match(INPUT, "0100110") then OUTPUT <= "1000";
     elsif std_match(INPUT, "0100100") then OUTPUT <= "1000";
     elsif std_match(INPUT, "1000101") then OUTPUT <= "0100";
     elsif std_match(INPUT, "1000000") then OUTPUT <= "1000";
     elsif std_match(INPUT, "1000111") then OUTPUT <= "1100";
     elsif std_match(INPUT, "1000110") then OUTPUT <= "0110";
     elsif std_match(INPUT, "1000100") then OUTPUT <= "0000";
     elsif std_match(INPUT, "1001111") then OUTPUT <= "1100";
     elsif std_match(INPUT, "1010101") then OUTPUT <= "1100";
     elsif std_match(INPUT, "1010000") then OUTPUT <= "0000";
     elsif std_match(INPUT, "1010110") then OUTPUT <= "0000";
     elsif std_match(INPUT, "1010100") then OUTPUT <= "0000";
     elsif std_match(INPUT, "1011100") then OUTPUT <= "0000";
     elsif std_match(INPUT, "0000001") then OUTPUT <= "0100";
     elsif std_match(INPUT, "1010001") then OUTPUT <= "1100";
     elsif std_match(INPUT, "1000001") then OUTPUT <= "1100";
     elsif std_match(INPUT, "0010001") then OUTPUT <= "1100";
     elsif std_match(INPUT, "1010011") then OUTPUT <= "0000";
     elsif std_match(INPUT, "1001011") then OUTPUT <= "1100";
     elsif std_match(INPUT, "0000011") then OUTPUT <= "0100";
     elsif std_match(INPUT, "0010011") then OUTPUT <= "0100";
     elsif std_match(INPUT, "1000011") then OUTPUT <= "0100";
     elsif std_match(INPUT, "0001011") then OUTPUT <= "0100";
     elsif std_match(INPUT, "----010") then OUTPUT <= "----";
     else OUTPUT <= "----";
    END if;

  END PROCESS;
END version;
