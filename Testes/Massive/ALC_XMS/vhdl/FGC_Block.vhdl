library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY FGC_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END FGC_Block;

ARCHITECTURE version OF FGC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "01111") then OUTPUT <= "1";
     elsif std_match(INPUT, "11111") then OUTPUT <= "1";
     elsif std_match(INPUT, "00101") then OUTPUT <= "1";
     elsif std_match(INPUT, "10101") then OUTPUT <= "1";
     elsif std_match(INPUT, "10100") then OUTPUT <= "1";
     elsif std_match(INPUT, "00100") then OUTPUT <= "1";
     elsif std_match(INPUT, "11110") then OUTPUT <= "1";
     elsif std_match(INPUT, "01110") then OUTPUT <= "1";
     elsif std_match(INPUT, "-0111") then OUTPUT <= "0";
     elsif std_match(INPUT, "-1101") then OUTPUT <= "0";
     elsif std_match(INPUT, "-1100") then OUTPUT <= "0";
     elsif std_match(INPUT, "-0110") then OUTPUT <= "0";
     elsif std_match(INPUT, "--000") then OUTPUT <= "-";
     elsif std_match(INPUT, "--001") then OUTPUT <= "-";
     elsif std_match(INPUT, "--010") then OUTPUT <= "-";
     elsif std_match(INPUT, "--011") then OUTPUT <= "-";
     else OUTPUT <= "-";
    END if;

  END PROCESS;
END version;
