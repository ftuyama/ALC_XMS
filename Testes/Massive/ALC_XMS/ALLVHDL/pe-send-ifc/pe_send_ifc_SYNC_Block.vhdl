library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY pe_send_ifc_SYNC_Block IS
  PORT (
    INPUT : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
    OUTPUT: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END pe_send_ifc_SYNC_Block;

ARCHITECTURE version OF pe_send_ifc_SYNC_Block IS
BEGIN
  PROCESS(INPUT)
  BEGIN
     if std_match(INPUT, "10-00-0-0") then OUTPUT <= "1------";
     elsif std_match(INPUT, "1110----0") then OUTPUT <= "1-----1";
     elsif std_match(INPUT, "-001----0") then OUTPUT <= "-1-----";
     elsif std_match(INPUT, "--11--0-0") then OUTPUT <= "1----11";
     elsif std_match(INPUT, "--0-0-1--") then OUTPUT <= "-1-----";
     elsif std_match(INPUT, "-100-1---") then OUTPUT <= "1---1--";
     elsif std_match(INPUT, "-01---0-0") then OUTPUT <= "----1-1";
     elsif std_match(INPUT, "-101--0--") then OUTPUT <= "---11--";
     elsif std_match(INPUT, "-100---1-") then OUTPUT <= "--1-11-";
     elsif std_match(INPUT, "-0-01-0--") then OUTPUT <= "--1-11-";
     elsif std_match(INPUT, "-1-01---0") then OUTPUT <= "--1-11-";
     elsif std_match(INPUT, "-010----1") then OUTPUT <= "1---1-1";
     elsif std_match(INPUT, "--0-0---1") then OUTPUT <= "---11--";
     elsif std_match(INPUT, "---1--1--") then OUTPUT <= "-1-----";
     elsif std_match(INPUT, "-0----1--") then OUTPUT <= "-1-----";
     elsif std_match(INPUT, "---1----1") then OUTPUT <= "---11--";
     elsif std_match(INPUT, "0--------") then OUTPUT <= "-1-----";
     elsif std_match(INPUT, "-1------1") then OUTPUT <= "---11--";
     elsif std_match(INPUT, "000001000") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "000000100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "001000100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "010000100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "011000100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "100001000") then OUTPUT <= "-000000";
     elsif std_match(INPUT, "100000010") then OUTPUT <= "-000000";
     elsif std_match(INPUT, "100000100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "100011000") then OUTPUT <= "00-0--0";
     elsif std_match(INPUT, "100010010") then OUTPUT <= "00-0--0";
     elsif std_match(INPUT, "100010100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "100101000") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "100100010") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "100100100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "100110100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "101001000") then OUTPUT <= "-000-0-";
     elsif std_match(INPUT, "101000010") then OUTPUT <= "-000-0-";
     elsif std_match(INPUT, "101000100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "101101000") then OUTPUT <= "-000---";
     elsif std_match(INPUT, "101100010") then OUTPUT <= "-000---";
     elsif std_match(INPUT, "101100100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "110001000") then OUTPUT <= "-000-00";
     elsif std_match(INPUT, "110000010") then OUTPUT <= "00-0--0";
     elsif std_match(INPUT, "110000100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "110010010") then OUTPUT <= "00-0--0";
     elsif std_match(INPUT, "110010100") then OUTPUT <= "00-0--0";
     elsif std_match(INPUT, "110101000") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "110100010") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "110100100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "110110100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "111001000") then OUTPUT <= "-00000-";
     elsif std_match(INPUT, "111000010") then OUTPUT <= "-00000-";
     elsif std_match(INPUT, "111000100") then OUTPUT <= "-00000-";
     elsif std_match(INPUT, "111101000") then OUTPUT <= "-0000--";
     elsif std_match(INPUT, "111100010") then OUTPUT <= "-0000--";
     elsif std_match(INPUT, "111100100") then OUTPUT <= "0-00000";
     elsif std_match(INPUT, "101000001") then OUTPUT <= "-000-0-";
     elsif std_match(INPUT, "100010001") then OUTPUT <= "00-0--0";
     elsif std_match(INPUT, "110100001") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "110000001") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "111100001") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "111000001") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "100100001") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "100000001") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "101100001") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "110110001") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "110010001") then OUTPUT <= "000--00";
     elsif std_match(INPUT, "100110001") then OUTPUT <= "000--00";
     else OUTPUT <= "-------";
    END if;

  END PROCESS;
END version;
