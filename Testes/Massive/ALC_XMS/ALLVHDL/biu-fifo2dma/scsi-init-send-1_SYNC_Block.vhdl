library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY scsi_init_send_1_SYNC_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END scsi_init_send_1_SYNC_Block;

ARCHITECTURE version OF scsi_init_send_1_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, ".p") then OUTPUT <= "18";
     elsif std_match(INPUT, "-1--11") then OUTPUT <= "1~~~";
     elsif std_match(INPUT, "-1-00-") then OUTPUT <= "~~~1";
     elsif std_match(INPUT, "1-0--0") then OUTPUT <= "~~~1";
     elsif std_match(INPUT, "0----0") then OUTPUT <= "1~~~";
     elsif std_match(INPUT, "--10--") then OUTPUT <= "1~1~";
     elsif std_match(INPUT, "--0---") then OUTPUT <= "~1~~";
     elsif std_match(INPUT, "---1--") then OUTPUT <= "11~~";
     elsif std_match(INPUT, "-00011") then OUTPUT <= "0~00";
     elsif std_match(INPUT, "-00001") then OUTPUT <= "0~00";
     elsif std_match(INPUT, "-10011") then OUTPUT <= "~~00";
     elsif std_match(INPUT, "-10001") then OUTPUT <= "0~0~";
     elsif std_match(INPUT, "-10111") then OUTPUT <= "~~00";
     elsif std_match(INPUT, "-10101") then OUTPUT <= "~~00";
     elsif std_match(INPUT, "-11011") then OUTPUT <= "~0~0";
     elsif std_match(INPUT, "-11111") then OUTPUT <= "~~00";
     elsif std_match(INPUT, "110010") then OUTPUT <= "0~0~";
     elsif std_match(INPUT, "010010") then OUTPUT <= "~~00";
     elsif std_match(INPUT, "-11010") then OUTPUT <= "~0~0";
     else OUTPUT <= "----";
    END if;

  END PROCESS;
END version;
