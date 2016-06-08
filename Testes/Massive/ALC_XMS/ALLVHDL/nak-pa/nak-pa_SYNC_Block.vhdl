library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY nak_pa_SYNC_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
  );
END nak_pa_SYNC_Block;

ARCHITECTURE version OF nak_pa_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "--100") then OUTPUT <= "-----1";
     elsif std_match(INPUT, "1---0") then OUTPUT <= "--1---";
     elsif std_match(INPUT, "--101") then OUTPUT <= "11----";
     elsif std_match(INPUT, "-1-01") then OUTPUT <= "11----";
     elsif std_match(INPUT, "1--01") then OUTPUT <= "11----";
     elsif std_match(INPUT, "-1--0") then OUTPUT <= "---11-";
     elsif std_match(INPUT, "---1-") then OUTPUT <= "1-111-";
     elsif std_match(INPUT, "00001") then OUTPUT <= "000000";
     elsif std_match(INPUT, "00000") then OUTPUT <= "000000";
     elsif std_match(INPUT, "00101") then OUTPUT <= "--0000";
     elsif std_match(INPUT, "01001") then OUTPUT <= "--0000";
     elsif std_match(INPUT, "01101") then OUTPUT <= "--0000";
     elsif std_match(INPUT, "10001") then OUTPUT <= "--0000";
     elsif std_match(INPUT, "10000") then OUTPUT <= "00-000";
     elsif std_match(INPUT, "10101") then OUTPUT <= "--0000";
     elsif std_match(INPUT, "11001") then OUTPUT <= "--0000";
     elsif std_match(INPUT, "11000") then OUTPUT <= "00---0";
     elsif std_match(INPUT, "11101") then OUTPUT <= "--0000";
     elsif std_match(INPUT, "11100") then OUTPUT <= "00----";
     elsif std_match(INPUT, "11111") then OUTPUT <= "-0---0";
     elsif std_match(INPUT, "11110") then OUTPUT <= "-0---0";
     else OUTPUT <= "------";
    END if;

  END PROCESS;
END version;
