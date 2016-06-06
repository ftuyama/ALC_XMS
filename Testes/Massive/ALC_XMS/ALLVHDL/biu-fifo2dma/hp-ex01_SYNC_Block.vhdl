library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY hp_ex01_SYNC_Block IS
  PORT (
    INPUT : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
  );
END hp_ex01_SYNC_Block;

ARCHITECTURE version OF hp_ex01_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, ".p") then OUTPUT <= "30";
     elsif std_match(INPUT, "-00-01") then OUTPUT <= "1~~~~1";
     elsif std_match(INPUT, "1-1---") then OUTPUT <= "~~~1~~";
     elsif std_match(INPUT, "0-10--") then OUTPUT <= "11~~~1";
     elsif std_match(INPUT, "-00---") then OUTPUT <= "~1~~~~";
     elsif std_match(INPUT, "-1--0-") then OUTPUT <= "1~~~1~";
     elsif std_match(INPUT, "----1-") then OUTPUT <= "~1~~~~";
     elsif std_match(INPUT, "-0-1--") then OUTPUT <= "111~~~";
     elsif std_match(INPUT, "1-----") then OUTPUT <= "1~1~1~";
     elsif std_match(INPUT, "000001") then OUTPUT <= "~~000~";
     elsif std_match(INPUT, "000000") then OUTPUT <= "0~0000";
     elsif std_match(INPUT, "000011") then OUTPUT <= "0~0000";
     elsif std_match(INPUT, "000010") then OUTPUT <= "0~0000";
     elsif std_match(INPUT, "001001") then OUTPUT <= "~~000~";
     elsif std_match(INPUT, "001000") then OUTPUT <= "~~000~";
     elsif std_match(INPUT, "001011") then OUTPUT <= "~~000~";
     elsif std_match(INPUT, "001101") then OUTPUT <= "~~~000";
     elsif std_match(INPUT, "001100") then OUTPUT <= "~~~000";
     elsif std_match(INPUT, "010001") then OUTPUT <= "~000~0";
     elsif std_match(INPUT, "010000") then OUTPUT <= "~000~0";
     elsif std_match(INPUT, "010010") then OUTPUT <= "0~0000";
     elsif std_match(INPUT, "101001") then OUTPUT <= "~0~~~0";
     elsif std_match(INPUT, "101000") then OUTPUT <= "~0~~~0";
     elsif std_match(INPUT, "101101") then OUTPUT <= "~~~~~0";
     elsif std_match(INPUT, "101100") then OUTPUT <= "~~~~~0";
     elsif std_match(INPUT, "110001") then OUTPUT <= "~0~0~0";
     elsif std_match(INPUT, "110000") then OUTPUT <= "~0~0~0";
     elsif std_match(INPUT, "111001") then OUTPUT <= "~0~~~0";
     elsif std_match(INPUT, "111000") then OUTPUT <= "~0~~~0";
     elsif std_match(INPUT, "111101") then OUTPUT <= "~0~~~0";
     elsif std_match(INPUT, "111100") then OUTPUT <= "~0~~~0";
     else OUTPUT <= "------";
    END if;

  END PROCESS;
END version;
