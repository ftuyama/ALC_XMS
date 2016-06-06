library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY sc_control_SYNC IS
  PORT (
    INPUT  : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
    STATE  : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
    RSTATE : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
    RESET  : IN  STD_LOGIC
  );
END ENTITY sc_control_SYNC;

ARCHITECTURE ALC_XMS OF sc_control_SYNC IS

COMPONENT sc_control_SYNC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(30 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(34 DOWNTO 0)
  );
END COMPONENT;

COMPONENT D_Latch IS
  Port (
    EN : in  STD_LOGIC;
    D  : in  STD_LOGIC;
    Q  : out STD_LOGIC
  );
END COMPONENT;

  SIGNAL SSTATE : STD_LOGIC_VECTOR(17 DOWNTO 0);
  SIGNAL SNSTATE: STD_LOGIC_VECTOR(17 DOWNTO 0);
  SIGNAL SLSTATE: STD_LOGIC_VECTOR(17 DOWNTO 0);
  SIGNAL SSOUT  : STD_LOGIC_VECTOR(16 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(16 DOWNTO 0);

BEGIN
B: sc_control_SYNC_Block    PORT MAP(INPUT & SSTATE, SOUT & SSTATE);
STT0: D_Latch    PORT MAP(RESET, SLSTATE(0), SSTATE(0));
STT1: D_Latch    PORT MAP(RESET, SLSTATE(1), SSTATE(1));
STT2: D_Latch    PORT MAP(RESET, SLSTATE(2), SSTATE(2));
STT3: D_Latch    PORT MAP(RESET, SLSTATE(3), SSTATE(3));
STT4: D_Latch    PORT MAP(RESET, SLSTATE(4), SSTATE(4));
STT5: D_Latch    PORT MAP(RESET, SLSTATE(5), SSTATE(5));
STT6: D_Latch    PORT MAP(RESET, SLSTATE(6), SSTATE(6));
STT7: D_Latch    PORT MAP(RESET, SLSTATE(7), SSTATE(7));
STT8: D_Latch    PORT MAP(RESET, SLSTATE(8), SSTATE(8));
STT9: D_Latch    PORT MAP(RESET, SLSTATE(9), SSTATE(9));
STT10: D_Latch    PORT MAP(RESET, SLSTATE(10), SSTATE(10));
STT11: D_Latch    PORT MAP(RESET, SLSTATE(11), SSTATE(11));
STT12: D_Latch    PORT MAP(RESET, SLSTATE(12), SSTATE(12));
STT13: D_Latch    PORT MAP(RESET, SLSTATE(13), SSTATE(13));
STT14: D_Latch    PORT MAP(RESET, SLSTATE(14), SSTATE(14));
STT15: D_Latch    PORT MAP(RESET, SLSTATE(15), SSTATE(15));
STT16: D_Latch    PORT MAP(RESET, SLSTATE(16), SSTATE(16));
STT17: D_Latch    PORT MAP(RESET, SLSTATE(17), SSTATE(17));
OUT0: D_Latch    PORT MAP(RESET, SOUT(0), SSOUT(0));
OUT1: D_Latch    PORT MAP(RESET, SOUT(1), SSOUT(1));
OUT2: D_Latch    PORT MAP(RESET, SOUT(2), SSOUT(2));
OUT3: D_Latch    PORT MAP(RESET, SOUT(3), SSOUT(3));
OUT4: D_Latch    PORT MAP(RESET, SOUT(4), SSOUT(4));
OUT5: D_Latch    PORT MAP(RESET, SOUT(5), SSOUT(5));
OUT6: D_Latch    PORT MAP(RESET, SOUT(6), SSOUT(6));
OUT7: D_Latch    PORT MAP(RESET, SOUT(7), SSOUT(7));
OUT8: D_Latch    PORT MAP(RESET, SOUT(8), SSOUT(8));
OUT9: D_Latch    PORT MAP(RESET, SOUT(9), SSOUT(9));
OUT10: D_Latch    PORT MAP(RESET, SOUT(10), SSOUT(10));
OUT11: D_Latch    PORT MAP(RESET, SOUT(11), SSOUT(11));
OUT12: D_Latch    PORT MAP(RESET, SOUT(12), SSOUT(12));
OUT13: D_Latch    PORT MAP(RESET, SOUT(13), SSOUT(13));
OUT14: D_Latch    PORT MAP(RESET, SOUT(14), SSOUT(14));
OUT15: D_Latch    PORT MAP(RESET, SOUT(15), SSOUT(15));
OUT16: D_Latch    PORT MAP(RESET, SOUT(16), SSOUT(16));
 
  PROCESS(INPUT, RSTATE, RESET)
  BEGIN
    OUTPUT <= SSOUT;
    IF (RESET = '1') THEN
      SLSTATE <= RSTATE;
    ELSE
      SLSTATE <= SNSTATE;
    END IF;
    STATE <= SSTATE;
  END PROCESS;
END ALC_XMS;