library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY select2p_SYNC_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
  );
END select2p_SYNC_Block;

ARCHITECTURE version OF select2p_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "00-1--") then OUTPUT <= "1-----";
     elsif std_match(INPUT, "10--1-") then OUTPUT <= "1-----";
     elsif std_match(INPUT, "111---") then OUTPUT <= "--1-1-";
     elsif std_match(INPUT, "01---1") then OUTPUT <= "--1-1-";
     elsif std_match(INPUT, "011---") then OUTPUT <= "-1---1";
     elsif std_match(INPUT, "11---1") then OUTPUT <= "-1---1";
     elsif std_match(INPUT, "-01---") then OUTPUT <= "1-----";
     elsif std_match(INPUT, "10-1--") then OUTPUT <= "---111";
     elsif std_match(INPUT, "00--1-") then OUTPUT <= "---111";
     elsif std_match(INPUT, "-1--1-") then OUTPUT <= "--1-1-";
     elsif std_match(INPUT, "-1-1--") then OUTPUT <= "-1---1";
     elsif std_match(INPUT, "-0---1") then OUTPUT <= "---111";
     elsif std_match(INPUT, "011000") then OUTPUT <= "0-000-";
     elsif std_match(INPUT, "111000") then OUTPUT <= "00-0-0";
     elsif std_match(INPUT, "000100") then OUTPUT <= "-00000";
     elsif std_match(INPUT, "100100") then OUTPUT <= "000---";
     elsif std_match(INPUT, "100010") then OUTPUT <= "-00000";
     elsif std_match(INPUT, "000010") then OUTPUT <= "000---";
     elsif std_match(INPUT, "110001") then OUTPUT <= "0-000-";
     elsif std_match(INPUT, "010001") then OUTPUT <= "00-0-0";
     elsif std_match(INPUT, "-01000") then OUTPUT <= "-00000";
     elsif std_match(INPUT, "-10100") then OUTPUT <= "0-000-";
     elsif std_match(INPUT, "-10010") then OUTPUT <= "00-0-0";
     elsif std_match(INPUT, "-00001") then OUTPUT <= "000---";
     else OUTPUT <= "------";
    END if;

  END PROCESS;
END version;
