library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY chu150_SYNC_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END chu150_SYNC_Block;

ARCHITECTURE version OF chu150_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "101-") then OUTPUT <= "--11";
     elsif std_match(INPUT, "-10-") then OUTPUT <= "---1";
     elsif std_match(INPUT, "1-0-") then OUTPUT <= "--1-";
     elsif std_match(INPUT, "--1-") then OUTPUT <= "-1--";
     elsif std_match(INPUT, "----") then OUTPUT <= "1---";
     elsif std_match(INPUT, "0001") then OUTPUT <= "-000";
     elsif std_match(INPUT, "0011") then OUTPUT <= "--00";
     elsif std_match(INPUT, "0101") then OUTPUT <= "-00-";
     elsif std_match(INPUT, "0111") then OUTPUT <= "--00";
     elsif std_match(INPUT, "1001") then OUTPUT <= "-0-0";
     elsif std_match(INPUT, "1111") then OUTPUT <= "--00";
     else OUTPUT <= "----";
    END if;

  END PROCESS;
END version;
