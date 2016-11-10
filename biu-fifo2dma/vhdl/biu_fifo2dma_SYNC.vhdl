library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY biu_fifo2dma_SYNC IS
  PORT (
    cntgt1, ok, fain, dackn : in std_logic;
    RESET  : IN  STD_LOGIC;
    CLOCK  : IN  STD_LOGIC;
    dreq, frout : out std_logic
  );
END ENTITY biu_fifo2dma_SYNC;

ARCHITECTURE ALC_XMS OF biu_fifo2dma_SYNC IS

COMPONENT biu_fifo2dma_SYNC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END COMPONENT;

  SIGNAL INPUT  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL SSTATE : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN
  -- Ordem dos inputs
  INPUT <= cntgt1 & ok & fain & dackn;

  B: biu_fifo2dma_SYNC_Block    PORT MAP(INPUT & SSTATE, SOUT);
 
  PROCESS(CLOCK, RESET)
  BEGIN
    IF (RST = '0') THEN

    	-- Ordem dos outputs
    	frout <= '0';
    	dreq <= '0';
     SSTATE <= '000'
    	-- Ordem dos outputs
    	dreq <= '0';
    	frout <= '0';
    ELSIF (RISING_EDGE(CLOCK)) THEN
    	SSTATE <= SOUT(4 DOWNTO 2);

    	-- Ordem dos outputs
    	dreq <= SOUT(1);
    	frout <= SOUT(0);
    END IF;
  END PROCESS;
END ALC_XMS;
