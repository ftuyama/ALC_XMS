library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY scsi_init_send_SYNC_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END scsi_init_send_SYNC_Block;

ARCHITECTURE version OF scsi_init_send_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "-1-0-11") then OUTPUT <= "1-1--";
     elsif std_match(INPUT, "1-0--10") then OUTPUT <= "1-1--";
     elsif std_match(INPUT, "--10--1") then OUTPUT <= "-1-1-";
     elsif std_match(INPUT, "-----00") then OUTPUT <= "----1";
     elsif std_match(INPUT, "--0-0--") then OUTPUT <= "----1";
     elsif std_match(INPUT, "--1-1-0") then OUTPUT <= "1--11";
     elsif std_match(INPUT, "----1-1") then OUTPUT <= "-1---";
     elsif std_match(INPUT, "--0--1-") then OUTPUT <= "-1---";
     elsif std_match(INPUT, "-0-----") then OUTPUT <= "1----";
     elsif std_match(INPUT, "-000101") then OUTPUT <= "--000";
     elsif std_match(INPUT, "-000111") then OUTPUT <= "--000";
     elsif std_match(INPUT, "1100001") then OUTPUT <= "0000-";
     elsif std_match(INPUT, "0100101") then OUTPUT <= "0-000";
     elsif std_match(INPUT, "0100111") then OUTPUT <= "---00";
     elsif std_match(INPUT, "1100101") then OUTPUT <= "0-000";
     elsif std_match(INPUT, "1100111") then OUTPUT <= "---00";
     elsif std_match(INPUT, "-101101") then OUTPUT <= "0-000";
     elsif std_match(INPUT, "-101111") then OUTPUT <= "0-000";
     elsif std_match(INPUT, "-110001") then OUTPUT <= "0-0-0";
     elsif std_match(INPUT, "-110101") then OUTPUT <= "0-0-0";
     elsif std_match(INPUT, "-111101") then OUTPUT <= "0-000";
     elsif std_match(INPUT, "-110100") then OUTPUT <= "-00--";
     elsif std_match(INPUT, "-100000") then OUTPUT <= "0000-";
     elsif std_match(INPUT, "-100100") then OUTPUT <= "0000-";
     elsif std_match(INPUT, "-110000") then OUTPUT <= "0000-";
     elsif std_match(INPUT, "1100110") then OUTPUT <= "---00";
     elsif std_match(INPUT, "0100110") then OUTPUT <= "0-000";
     elsif std_match(INPUT, "-110110") then OUTPUT <= "-00--";
     else OUTPUT <= "-----";
    END if;

  END PROCESS;
END version;
