library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY ack_xbm1_SYNC IS
  PORT (
    INPUT  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    RESET  : IN  STD_LOGIC
  );
END ENTITY ack_xbm1_SYNC;

ARCHITECTURE ALC_XMS OF ack_xbm1_SYNC IS

COMPONENT ack_xbm1_SYNC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
  );
END COMPONENT;

COMPONENT D_Latch IS
  Port (
    EN : in  STD_LOGIC;
    D  : in  STD_LOGIC;
    Q  : out STD_LOGIC
  );
END COMPONENT;

  SIGNAL SSTATE : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL HIGH	 : STD_LOGIC;
BEGIN
B: ack_xbm1_SYNC_Block    PORT MAP(INPUT & SSTATE, SOUT);
STT0: D_Latch    PORT MAP(RESET, SOUT(0), HIGH);
STT1: D_Latch    PORT MAP(RESET, SOUT(1), HIGH);
STT2: D_Latch    PORT MAP(RESET, SOUT(2), HIGH);
STT3: D_Latch    PORT MAP(RESET, SOUT(3), HIGH);
OUT4: D_Latch    PORT MAP(RESET, SOUT(4), HIGH);
OUT5: D_Latch    PORT MAP(RESET, SOUT(5), HIGH);
OUT6: D_Latch    PORT MAP(RESET, SOUT(6), HIGH);
OUT7: D_Latch    PORT MAP(RESET, SOUT(7), HIGH);
OUT8: D_Latch    PORT MAP(RESET, SOUT(8), HIGH);
 
  PROCESS(INPUT)
  BEGIN
  	 HIGH <= '1';
    SSTATE <= SOUT(8 DOWNTO 5);
    OUTPUT <= SOUT(4 DOWNTO 0);
  END PROCESS;
END ALC_XMS;
