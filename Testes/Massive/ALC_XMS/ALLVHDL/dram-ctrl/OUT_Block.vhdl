library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY OUT_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
  );
END OUT_Block;

ARCHITECTURE version OF OUT_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "01110001") then OUTPUT <= "011101";
     elsif std_match(INPUT, "01110101") then OUTPUT <= "011101";
     elsif std_match(INPUT, "01111001") then OUTPUT <= "011101";
     elsif std_match(INPUT, "01111101") then OUTPUT <= "011101";
     elsif std_match(INPUT, "01111100") then OUTPUT <= "011101";
     elsif std_match(INPUT, "01111111") then OUTPUT <= "111101";
     elsif std_match(INPUT, "01111110") then OUTPUT <= "111101";
     elsif std_match(INPUT, "10100011") then OUTPUT <= "000010";
     elsif std_match(INPUT, "10100010") then OUTPUT <= "000010";
     elsif std_match(INPUT, "10100111") then OUTPUT <= "010010";
     elsif std_match(INPUT, "10110011") then OUTPUT <= "010010";
     elsif std_match(INPUT, "10110010") then OUTPUT <= "000010";
     elsif std_match(INPUT, "10110111") then OUTPUT <= "010010";
     elsif std_match(INPUT, "10110110") then OUTPUT <= "010010";
     elsif std_match(INPUT, "10111111") then OUTPUT <= "011100";
     elsif std_match(INPUT, "10111110") then OUTPUT <= "011100";
     elsif std_match(INPUT, "11000011") then OUTPUT <= "001010";
     elsif std_match(INPUT, "11000010") then OUTPUT <= "001010";
     elsif std_match(INPUT, "11000111") then OUTPUT <= "011010";
     elsif std_match(INPUT, "11000110") then OUTPUT <= "011010";
     elsif std_match(INPUT, "11001111") then OUTPUT <= "011100";
     elsif std_match(INPUT, "11001110") then OUTPUT <= "011100";
     elsif std_match(INPUT, "11010011") then OUTPUT <= "001010";
     elsif std_match(INPUT, "11011111") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11011110") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11100011") then OUTPUT <= "001010";
     elsif std_match(INPUT, "11100010") then OUTPUT <= "000010";
     elsif std_match(INPUT, "11101111") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11101110") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11110001") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11110000") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11110011") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11110010") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11110101") then OUTPUT <= "011101";
     elsif std_match(INPUT, "11110100") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11110111") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11110110") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11111001") then OUTPUT <= "011101";
     elsif std_match(INPUT, "11111000") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11111011") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11111010") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11111101") then OUTPUT <= "011101";
     elsif std_match(INPUT, "11111100") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11111111") then OUTPUT <= "111100";
     elsif std_match(INPUT, "11111110") then OUTPUT <= "111100";
     else OUTPUT <= "------";
    END if;

  END PROCESS;
END version;
