library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY fifocellctrl IS
  PORT (
    INPUT  : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END ENTITY fifocellctrl;

ARCHITECTURE ALC_XMS OF fifocellctrl IS

COMPONENT FGC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT NSTATE_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

COMPONENT OUT_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
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
  SIGNAL SSOUT  : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL FGC    : STD_LOGIC_VECTOR(0 DOWNTO 0);

BEGIN
B1: FGC_Block    PORT MAP(INPUT & SSTATE, FGC(0));
B2: NSTATE_Block PORT MAP(INPUT & SSTATE, SNSTATE);
B3: OUT_Block    PORT MAP(INPUT & SSTATE, SOUT);
STT0: D_Latch    PORT MAP(FGC(0), SNSTATE(0), SSTATE(0));
OUT0: D_Latch    PORT MAP(SSOUT(0) XOR SOUT(0), SOUT(0), SSOUT(0));
OUT1: D_Latch    PORT MAP(SSOUT(1) XOR SOUT(1), SOUT(1), SSOUT(1));
 
  PROCESS(INPUT)
  BEGIN
    OUTPUT <= SSOUT;
  END PROCESS;
END ALC_XMS;
