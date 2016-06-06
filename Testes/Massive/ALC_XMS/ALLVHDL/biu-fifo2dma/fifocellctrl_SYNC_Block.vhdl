library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY fifocellctrl_SYNC_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END fifocellctrl_SYNC_Block;

ARCHITECTURE version OF fifocellctrl_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, ".p") then OUTPUT <= "9";
     elsif std_match(INPUT, "001") then OUTPUT <= "11~";
     elsif std_match(INPUT, "10-") then OUTPUT <= "1~1";
     elsif std_match(INPUT, "001") then OUTPUT <= "~~0";
     elsif std_match(INPUT, "011") then OUTPUT <= "000";
     elsif std_match(INPUT, "101") then OUTPUT <= "~0~";
     elsif std_match(INPUT, "100") then OUTPUT <= "~0~";
     elsif std_match(INPUT, "010") then OUTPUT <= "000";
     elsif std_match(INPUT, "000") then OUTPUT <= "000";
     elsif std_match(INPUT, "110") then OUTPUT <= "000";
     else OUTPUT <= "---";
    END if;

  END PROCESS;
END version;
