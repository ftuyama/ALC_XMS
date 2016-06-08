library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY NSTATE_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(30 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END NSTATE_Block;

ARCHITECTURE version OF NSTATE_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "0000000000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000000000010000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000000000001000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000000000000100000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000000000000010000000000000") then OUTPUT <= "000010000000000000";
     elsif std_match(INPUT, "0000000000000000001000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000000000000000100000000000") then OUTPUT <= "000000100000000000";
     elsif std_match(INPUT, "0000000000000000000010000000000") then OUTPUT <= "000000010000000000";
     elsif std_match(INPUT, "0000000000000000000001000000000") then OUTPUT <= "000000001000000000";
     elsif std_match(INPUT, "0000000000000000000000100000000") then OUTPUT <= "000000001000000000";
     elsif std_match(INPUT, "0000000000000000000000010000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000000000000000000001000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0000000000000000000000000010000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000000000000000000000001000") then OUTPUT <= "000000100000000000";
     elsif std_match(INPUT, "0000000000000000000000000000100") then OUTPUT <= "000010000000000000";
     elsif std_match(INPUT, "0000000000000000000000000000010") then OUTPUT <= "000000010000000000";
     elsif std_match(INPUT, "0000000000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0000000000010100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0000000000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0000000001000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000000001000010000000000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "0000000001000001000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0000000001000000100000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0000000001000000001000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0000000001000000000000010000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0000000001000000000000001000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0000000001000000000000000010000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0000000010000000100000000000000") then OUTPUT <= "000000000100000000";
     elsif std_match(INPUT, "0000000010000000001000000000000") then OUTPUT <= "000000000000000100";
     elsif std_match(INPUT, "0000000010000000000000100000000") then OUTPUT <= "000000000100000000";
     elsif std_match(INPUT, "0000000010000000000000000000100") then OUTPUT <= "000000000000000100";
     elsif std_match(INPUT, "0000000100000000001000000000000") then OUTPUT <= "000000000000000010";
     elsif std_match(INPUT, "0000000100000000000000000000010") then OUTPUT <= "000000000000000010";
     elsif std_match(INPUT, "0000000100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0000000100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0000001000000000100000000000000") then OUTPUT <= "000000000000001000";
     elsif std_match(INPUT, "0000001000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0000001000000000000000000001000") then OUTPUT <= "000000000000001000";
     elsif std_match(INPUT, "0000001000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0000010000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000010000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0000010000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0000010000010100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0000010000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0000010000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0000010100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0000010100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0000011000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0000011000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0010000000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0010000000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0010000000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0010000000010100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0010000000010000100000000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000010000000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000001000000000000") then OUTPUT <= "000001000000000000";
     elsif std_match(INPUT, "0010000000010000000100000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000000010000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000000001000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000000000100000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000000000010000000") then OUTPUT <= "000000000010000000";
     elsif std_match(INPUT, "0010000000010000000000001000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0010000000010000000000000001000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000000000000000100") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000000000000000010") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "0010000000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0010000100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0010000100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0010001000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0010001000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0010010000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0010010000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0010010000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0010010000010100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0010010000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0010010000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0010010100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0010010100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0010011000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0010011000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100000000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0100000000000010000000000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "0100000000000001000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000000000000100000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000000000000010000000000000") then OUTPUT <= "000010000000000000";
     elsif std_match(INPUT, "0100000000000000001000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000000000000000100000000000") then OUTPUT <= "000000100000000000";
     elsif std_match(INPUT, "0100000000000000000010000000000") then OUTPUT <= "000000100000000000";
     elsif std_match(INPUT, "0100000000000000000001000000000") then OUTPUT <= "000000100000000000";
     elsif std_match(INPUT, "0100000000000000000000100000000") then OUTPUT <= "000010000000000000";
     elsif std_match(INPUT, "0100000000000000000000010000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000000000000000000001000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100000000000000000000000010000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000000000000000000000001000") then OUTPUT <= "000000000000001000";
     elsif std_match(INPUT, "0100000000000000000000000000100") then OUTPUT <= "000010000000000000";
     elsif std_match(INPUT, "0100000000000000000000000000010") then OUTPUT <= "000010000000000000";
     elsif std_match(INPUT, "0100000000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100000000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100000000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100000001000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0100000001000010000000000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "0100000001000001000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000001000000100000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000001000000010000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0100000001000000001000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000001000000000100000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000001000000000010000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000001000000000001000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000001000000000000100000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0100000001000000000000010000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000001000000000000001000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000001000000000000000010000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "0100000001000000000000000001000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0100000001000000000000000000100") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0100000001000000000000000000010") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "0100000100000000010000000000000") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100000100000000000000100000000") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100000100000000000000000001000") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100000100000000000000000000100") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100000100000000000000000000010") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100000100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100000100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100001000000000000100000000000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100001000000000000010000000000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100001000000000000001000000000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100001000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100001000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100010000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100010000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100010000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100010000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100010100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100010100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0100011000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0100011000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0110000000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0110000000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0110000000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0110000000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0110000100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0110000100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0110001000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0110001000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0110010000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0110010000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0110010000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0110010000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0110010100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0110010100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "0110011000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "0110011000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1000000000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "1000000000000010000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1000000000000001000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "1000000000000000100000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000000000000000010000000000000") then OUTPUT <= "000001000000000000";
     elsif std_match(INPUT, "1000000000000000001000000000000") then OUTPUT <= "000001000000000000";
     elsif std_match(INPUT, "1000000000000000000100000000000") then OUTPUT <= "000000100000000000";
     elsif std_match(INPUT, "1000000000000000000010000000000") then OUTPUT <= "000000010000000000";
     elsif std_match(INPUT, "1000000000000000000001000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000000000000000000000100000000") then OUTPUT <= "000000000100000000";
     elsif std_match(INPUT, "1000000000000000000000010000000") then OUTPUT <= "000000000010000000";
     elsif std_match(INPUT, "1000000000000000000000001000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1000000000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1000000000000000000000000010000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1000000000000000000000000001000") then OUTPUT <= "000000000000001000";
     elsif std_match(INPUT, "1000000000000000000000000000100") then OUTPUT <= "000000000000000100";
     elsif std_match(INPUT, "1000000000000000000000000000010") then OUTPUT <= "000000000000000010";
     elsif std_match(INPUT, "1000000000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1000000000001010000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1000000000001001000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1000000000001000000000010000000") then OUTPUT <= "000000000010000000";
     elsif std_match(INPUT, "1000000000001000000000001000000") then OUTPUT <= "000000000010000000";
     elsif std_match(INPUT, "1000000000010100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "1000000000010010000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1000000000010001000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "1000000000010000000000010000000") then OUTPUT <= "000000000010000000";
     elsif std_match(INPUT, "1000000000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1000000000010000000000000010000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1000000000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1000000000011010000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1000000000011000000000010000000") then OUTPUT <= "000000000010000000";
     elsif std_match(INPUT, "1000000000100000100000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000000000100000001000000000000") then OUTPUT <= "000001000000000000";
     elsif std_match(INPUT, "1000000000100000000100000000000") then OUTPUT <= "000001000000000000";
     elsif std_match(INPUT, "1000000000100000000010000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000000010000000000000100000000") then OUTPUT <= "000000000100000000";
     elsif std_match(INPUT, "1000000010000000000000000000100") then OUTPUT <= "000000000000000100";
     elsif std_match(INPUT, "1000000100000000000000000000010") then OUTPUT <= "000000000000000010";
     elsif std_match(INPUT, "1000000100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1000000100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1000001000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1000001000000000000000000001000") then OUTPUT <= "000000000000001000";
     elsif std_match(INPUT, "1000001000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1000010000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "1000010000000010000000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000001000000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000100000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000010000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000001000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000100000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000010000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000001000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000000100000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000000010000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000000001000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1000010000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1000010000000000000000000010000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000000000001000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000000000000100") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000000000000010") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1000010000010100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "1000010000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1000010000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1000010010000010000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1000010010000001000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "1000010010000000100000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000010000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000001000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000100000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000010000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000001000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000000100000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000000010000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000000001000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000000000010000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000000000001000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000000000000100") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010010000000000000000000010") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1000010100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1000010100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1000011000000000000000001000000") then OUTPUT <= "000000000000001000";
     elsif std_match(INPUT, "1000011000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1000011000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1000100000000000000000001000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001000000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "1001000000000010000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1001000000000001000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "1001000000000000100000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000010000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000001000000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000100000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000010000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000001000000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000000100000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000000010000000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000000001000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001000000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1001000000000000000000000010000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000000000001000") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000000000000100") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000000000000010") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001000000000000000000000000001") then OUTPUT <= "000100000000000000";
     elsif std_match(INPUT, "1001100000000100000000000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000010000000000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000001000000000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000100000000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000010000000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000001000000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000100000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000010000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000001000000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000000100000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000000010000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000000001000000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000000000100000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000000000001000") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000000000000100") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000000000000010") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1001100000000000000000000000001") then OUTPUT <= "000000000001000000";
     elsif std_match(INPUT, "1010000000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "1010000000000010000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1010000000000001000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "1010000000000000000000010000000") then OUTPUT <= "000000000010000000";
     elsif std_match(INPUT, "1010000000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1010000000000000000000000010000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1010000000001010000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1010000000001000000000010000000") then OUTPUT <= "000000000010000000";
     elsif std_match(INPUT, "1010000000010100000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "1010000000010010000000000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010001000000000000000") then OUTPUT <= "001000000000000000";
     elsif std_match(INPUT, "1010000000010000100000000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000010000000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000001000000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000100000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000010000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000001000000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000000100000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000000010000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000000001000000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000000000100000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000000000010000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000000000001000") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000000000000100") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000000000000010") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000010000000000000000001") then OUTPUT <= "000000000000010000";
     elsif std_match(INPUT, "1010000000011010000000000000000") then OUTPUT <= "010000000000000000";
     elsif std_match(INPUT, "1010000000011000000000010000000") then OUTPUT <= "000000000010000000";
     elsif std_match(INPUT, "1010000100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1010000100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1010001000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1010001000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1010010000000100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "1010010000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1010010000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1010010000010100000000000000000") then OUTPUT <= "100000000000000000";
     elsif std_match(INPUT, "1010010000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1010010000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1010010100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1010010100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1010011000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1010011000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1100000000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1100000000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1100000000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1100000000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1100000100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1100000100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1100001000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1100001000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1100010000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1100010000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1100010000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1100010000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1100010100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1100010100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1100011000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1100011000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1110000000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1110000000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1110000000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1110000000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1110000100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1110000100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1110001000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1110001000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1110010000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1110010000000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1110010000010000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1110010000010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1110010100000000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1110010100010000000000000000001") then OUTPUT <= "000000000000000001";
     elsif std_match(INPUT, "1110011000000000000000000100000") then OUTPUT <= "000000000000100000";
     elsif std_match(INPUT, "1110011000010000000000000100000") then OUTPUT <= "000000000000100000";
     else OUTPUT <= "------------------";
    END if;

  END PROCESS;
END version;
