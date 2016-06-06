library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY call_proc_SYNC_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END call_proc_SYNC_Block;

ARCHITECTURE version OF call_proc_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, ".p") then OUTPUT <= "25";
     elsif std_match(INPUT, "1-00") then OUTPUT <= "~~1~";
     elsif std_match(INPUT, "-110") then OUTPUT <= "~~1~";
     elsif std_match(INPUT, "-101") then OUTPUT <= "~~1~";
     elsif std_match(INPUT, "0-11") then OUTPUT <= "~~1~";
     elsif std_match(INPUT, "-10-") then OUTPUT <= "~1~~";
     elsif std_match(INPUT, "10-1") then OUTPUT <= "1~~1";
     elsif std_match(INPUT, "-01-") then OUTPUT <= "~1~~";
     elsif std_match(INPUT, "101-") then OUTPUT <= "1~~1";
     elsif std_match(INPUT, "01-1") then OUTPUT <= "1~~1";
     elsif std_match(INPUT, "011-") then OUTPUT <= "1~~1";
     elsif std_match(INPUT, "--11") then OUTPUT <= "1~~1";
     elsif std_match(INPUT, "0001") then OUTPUT <= "0000";
     elsif std_match(INPUT, "0000") then OUTPUT <= "0000";
     elsif std_match(INPUT, "0010") then OUTPUT <= "0~00";
     elsif std_match(INPUT, "0100") then OUTPUT <= "0~00";
     elsif std_match(INPUT, "0111") then OUTPUT <= "~0~~";
     elsif std_match(INPUT, "0110") then OUTPUT <= "~0~~";
     elsif std_match(INPUT, "1001") then OUTPUT <= "~00~";
     elsif std_match(INPUT, "1000") then OUTPUT <= "00~0";
     elsif std_match(INPUT, "1011") then OUTPUT <= "~~0~";
     elsif std_match(INPUT, "1010") then OUTPUT <= "~~0~";
     elsif std_match(INPUT, "1101") then OUTPUT <= "0~~0";
     elsif std_match(INPUT, "1100") then OUTPUT <= "0~~0";
     elsif std_match(INPUT, "1111") then OUTPUT <= "~00~";
     elsif std_match(INPUT, "1110") then OUTPUT <= "00~0";
     else OUTPUT <= "----";
    END if;

  END PROCESS;
END version;
