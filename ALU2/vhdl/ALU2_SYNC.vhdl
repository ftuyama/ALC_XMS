library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY ALU2_SYNC IS
  PORT (
    C, start, EvDone, M1A, M2A2 : in std_logic;
    RESET  : IN  STD_LOGIC;
    CLOCK  : IN  STD_LOGIC;
    Prech, LX, LY, A2M, EndP, seldx, selym2 : out std_logic
  );
END ENTITY ALU2_SYNC;

ARCHITECTURE ALC_XMS OF ALU2_SYNC IS

COMPONENT ALU2_SYNC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

  SIGNAL INPUT  : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL SSTATE : STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
  -- Ordem dos inputs
  INPUT <= C & start & EvDone & M1A & M2A2;

  B: ALU2_SYNC_Block    PORT MAP(INPUT & SSTATE, SOUT);
 
  PROCESS(CLOCK, RESET)
  BEGIN
    IF (RST = '0') THEN

    	-- Ordem dos outputs
    	selym2 <= '0';
    	seldx <= '0';
    	EndP <= '0';
    	A2M <= '0';
    	LY <= '0';
    	LX <= '0';
    	Prech <= '0';
     SSTATE <= '000000000'
    	-- Ordem dos outputs
    	Prech <= '0';
    	LX <= '0';
    	LY <= '0';
    	A2M <= '0';
    	EndP <= '0';
    	seldx <= '0';
    	selym2 <= '0';
    ELSIF (RISING_EDGE(CLOCK)) THEN
    	SSTATE <= SOUT(15 DOWNTO 7);

    	-- Ordem dos outputs
    	Prech <= SOUT(6);
    	LX <= SOUT(5);
    	LY <= SOUT(4);
    	A2M <= SOUT(3);
    	EndP <= SOUT(2);
    	seldx <= SOUT(1);
    	selym2 <= SOUT(0);
    END IF;
  END PROCESS;
END ALC_XMS;
