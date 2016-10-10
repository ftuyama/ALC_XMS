library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY sc_control_SYNC IS
  PORT (
    INPUT  : IN  STD_LOGIC_VECTOR(12 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(16 DOWNTO 0);
    RESET  : IN  STD_LOGIC;
    CLOCK  : IN  STD_LOGIC
  );
END ENTITY sc_control_SYNC;

ARCHITECTURE ALC_XMS OF sc_control_SYNC IS

COMPONENT sc_control_SYNC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(30 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(34 DOWNTO 0)
  );
END COMPONENT;

  SIGNAL SSTATE : STD_LOGIC_VECTOR(17 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(34 DOWNTO 0);

BEGIN
B: sc_control_SYNC_Block    PORT MAP(INPUT & SSTATE, SOUT);
 
  PROCESS(CLOCK)
  BEGIN
    IF (RISING_EDGE(CLOCK)) THEN
    	SSTATE <= SOUT(34 DOWNTO 17);
    	OUTPUT <= SOUT(16 DOWNTO 0);
    END IF;
  END PROCESS;
END ALC_XMS;