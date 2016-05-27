library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY nak_pa IS
  PORT (
    INPUT  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    STATE  : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    RSTATE : IN  STD_LOGIC_VECTOR(0 DOWNTO 0);
    RESET  : IN  STD_LOGIC;
    IN_DELAY  : IN  STD_LOGIC;
    OUT_DELAY : OUT STD_LOGIC
  );
END ENTITY nak_pa;

ARCHITECTURE ALC_XMS OF nak_pa IS

COMPONENT FGC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT NSTATE_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

COMPONENT OUT_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END COMPONENT;

COMPONENT D_Latch IS
  Port (
    EN : in  STD_LOGIC;
    D  : in  STD_LOGIC;
    Q  : out STD_LOGIC
  );
END COMPONENT;

  SIGNAL SSTATE : STD_LOGIC_VECTOR(0 DOWNTO 0);
  SIGNAL SNSTATE: STD_LOGIC_VECTOR(0 DOWNTO 0);
  SIGNAL SLSTATE: STD_LOGIC_VECTOR(0 DOWNTO 0);
  SIGNAL SSOUT  : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN
B1: FGC_Block    PORT MAP(INPUT & SSTATE, OUT_DELAY);
B2: NSTATE_Block PORT MAP(INPUT & SSTATE, SNSTATE);
B3: OUT_Block    PORT MAP(INPUT & SSTATE, SOUT);
STT0: D_Latch    PORT MAP(IN_DELAY OR RESET, SLSTATE(0), SSTATE(0));
OUT0: D_Latch    PORT MAP(SSOUT(0) XOR SOUT(0), SOUT(0), SSOUT(0));
OUT1: D_Latch    PORT MAP(SSOUT(1) XOR SOUT(1), SOUT(1), SSOUT(1));
OUT2: D_Latch    PORT MAP(SSOUT(2) XOR SOUT(2), SOUT(2), SSOUT(2));
OUT3: D_Latch    PORT MAP(SSOUT(3) XOR SOUT(3), SOUT(3), SSOUT(3));
OUT4: D_Latch    PORT MAP(SSOUT(4) XOR SOUT(4), SOUT(4), SSOUT(4));
 
  PROCESS(INPUT, RSTATE, RESET, IN_DELAY)
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
