library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY scsi_init_send_1_SYNC IS
  PORT (
    INPUT  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    RESET  : IN  STD_LOGIC;
    CLOCK  : IN  STD_LOGIC
  );
END ENTITY scsi_init_send_1_SYNC;

ARCHITECTURE ALC_XMS OF scsi_init_send_1_SYNC IS

COMPONENT scsi_init_send_1_SYNC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

  SIGNAL SSTATE : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
B: scsi_init_send_1_SYNC_Block    PORT MAP(INPUT & SSTATE, SOUT);
 
  PROCESS(CLOCK)
  BEGIN
    IF (RISING_EDGE(CLOCK)) THEN
    	SSTATE <= SOUT(3 DOWNTO 2);
    	OUTPUT <= SOUT(1 DOWNTO 0);
    END IF;
  END PROCESS;
END ALC_XMS;
