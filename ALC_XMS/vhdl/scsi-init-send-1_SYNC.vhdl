library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY scsi_init_send_1_SYNC IS
  PORT (
    INPUT  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    STATE  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    RSTATE : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    RESET  : IN  STD_LOGIC
  );
END ENTITY scsi_init_send_1_SYNC;

ARCHITECTURE ALC_XMS OF scsi_init_send_1_SYNC IS

COMPONENT scsi_init_send_1_SYNC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

COMPONENT D_Latch IS
  Port (
    EN : in  STD_LOGIC;
    D  : in  STD_LOGIC;
    Q  : out STD_LOGIC
  );
END COMPONENT;

  SIGNAL SSTATE : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SNSTATE: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SLSTATE: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SSOUT  : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN
B: scsi_init_send_1_SYNC_Block    PORT MAP(INPUT & SSTATE, SOUT & SSTATE);
STT0: D_Latch    PORT MAP(RESET, SLSTATE(0), SSTATE(0));
STT1: D_Latch    PORT MAP(RESET, SLSTATE(1), SSTATE(1));
OUT0: D_Latch    PORT MAP(RESET, SOUT(0), SSOUT(0));
OUT1: D_Latch    PORT MAP(RESET, SOUT(1), SSOUT(1));
 
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
