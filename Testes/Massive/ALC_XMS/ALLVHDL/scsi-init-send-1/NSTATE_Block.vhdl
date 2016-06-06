library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY NSTATE_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END NSTATE_Block;

ARCHITECTURE version OF NSTATE_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "-00011") then OUTPUT <= "01";
     elsif std_match(INPUT, "-00001") then OUTPUT <= "01";
     elsif std_match(INPUT, "-10011") then OUTPUT <= "11";
     elsif std_match(INPUT, "-10001") then OUTPUT <= "01";
     elsif std_match(INPUT, "-10111") then OUTPUT <= "11";
     elsif std_match(INPUT, "-10101") then OUTPUT <= "11";
     elsif std_match(INPUT, "-11011") then OUTPUT <= "10";
     elsif std_match(INPUT, "-11111") then OUTPUT <= "11";
     elsif std_match(INPUT, "110010") then OUTPUT <= "01";
     elsif std_match(INPUT, "010010") then OUTPUT <= "11";
     elsif std_match(INPUT, "-11010") then OUTPUT <= "10";
     elsif std_match(INPUT, "----00") then OUTPUT <= "--";
     else OUTPUT <= "--";
    END if;

  END PROCESS;
END version;
