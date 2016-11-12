library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY scsi_init_send_1_SYNC IS
  PORT (
    cntgt1, ok, rin, fain : in std_logic;
    RESET  : IN  STD_LOGIC;
    CLOCK  : IN  STD_LOGIC;
    aout, frout : out std_logic
  );
END ENTITY scsi_init_send_1_SYNC;

ARCHITECTURE ALC_XMS OF scsi_init_send_1_SYNC IS

COMPONENT scsi_init_send_1_SYNC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

  SIGNAL INPUT  : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL SSTATE : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
  -- Ordem dos inputs
  INPUT <= cntgt1 & ok & rin & fain;

  B: scsi_init_send_1_SYNC_Block    PORT MAP(INPUT & SSTATE, SOUT);
 
  PROCESS(CLOCK, RESET)
  BEGIN
    IF (RESET = '0') THEN
    	-- Ordem dos outputs
    	aout <= '0';
    	frout <= '0';
      SSTATE <= "01";

    ELSIF (RISING_EDGE(CLOCK)) THEN
    	-- Ordem dos outputs
    	aout <= SOUT(1);
    	frout <= SOUT(0);
    	SSTATE <= SOUT(3 DOWNTO 2);

    END IF;
  END PROCESS;
END ALC_XMS;
