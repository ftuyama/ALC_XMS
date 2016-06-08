library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY NSTATE_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END NSTATE_Block;

ARCHITECTURE version OF NSTATE_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "00000") then OUTPUT <= "00";
     elsif std_match(INPUT, "00011") then OUTPUT <= "00";
     elsif std_match(INPUT, "00010") then OUTPUT <= "10";
     elsif std_match(INPUT, "10000") then OUTPUT <= "00";
     elsif std_match(INPUT, "10011") then OUTPUT <= "10";
     elsif std_match(INPUT, "10010") then OUTPUT <= "10";
     elsif std_match(INPUT, "00100") then OUTPUT <= "00";
     elsif std_match(INPUT, "00101") then OUTPUT <= "10";
     elsif std_match(INPUT, "00110") then OUTPUT <= "10";
     elsif std_match(INPUT, "10100") then OUTPUT <= "00";
     elsif std_match(INPUT, "10101") then OUTPUT <= "00";
     elsif std_match(INPUT, "10110") then OUTPUT <= "10";
     elsif std_match(INPUT, "01011") then OUTPUT <= "11";
     elsif std_match(INPUT, "01001") then OUTPUT <= "01";
     elsif std_match(INPUT, "01010") then OUTPUT <= "01";
     elsif std_match(INPUT, "11011") then OUTPUT <= "11";
     elsif std_match(INPUT, "11001") then OUTPUT <= "01";
     elsif std_match(INPUT, "11010") then OUTPUT <= "11";
     elsif std_match(INPUT, "01100") then OUTPUT <= "11";
     elsif std_match(INPUT, "01111") then OUTPUT <= "11";
     elsif std_match(INPUT, "01101") then OUTPUT <= "01";
     elsif std_match(INPUT, "11100") then OUTPUT <= "01";
     elsif std_match(INPUT, "11111") then OUTPUT <= "11";
     elsif std_match(INPUT, "11101") then OUTPUT <= "01";
     else OUTPUT <= "--";
    END if;

  END PROCESS;
END version;
