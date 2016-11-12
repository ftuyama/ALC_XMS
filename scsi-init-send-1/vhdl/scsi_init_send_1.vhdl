library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY scsi_init_send_1 IS
  PORT (
    RESET  : IN  STD_LOGIC;
    cntgt1, ok, rin, fain : in std_logic;
    STATE  : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    NSTATE : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        FGC    : OUT STD_LOGIC;
aout, frout : out std_logic
  );
END ENTITY scsi_init_send_1;

ARCHITECTURE ALC_XMS OF scsi_init_send_1 IS

COMPONENT FGC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT NSTATE_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT OUT_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;

COMPONENT D_Latch0 IS
  Port (
    EN : in  STD_LOGIC;
    D  : in  STD_LOGIC;
    rst: in  STD_LOGIC;
    Q  : out STD_LOGIC
  );
END COMPONENT;

COMPONENT D_Latch1 IS
  Port (
    EN : in  STD_LOGIC;
    D  : in  STD_LOGIC;
    rst: in  STD_LOGIC;
    Q  : out STD_LOGIC
  );
END COMPONENT;

COMPONENT V_Pulse IS
  Port (
    i  : in  STD_LOGIC;
    o  : out STD_LOGIC
  );
END COMPONENT;

  SIGNAL INPUT  : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL SSTATE : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SNSTATE: STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SSOUT  : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL DFGC   : STD_LOGIC;
  SIGNAL SFGC   : STD_LOGIC;
BEGIN

  -- Ordem dos inputs
  INPUT <= cntgt1 & ok & rin & fain;

  -- Lógica de estado
  STATE <= SSTATE;
  NSTATE <= SNSTATE;
  FGC <= DFGC;

  -- Blocos lógicos
  DELAY: V_Pulse    PORT MAP(SFGC, DFGC);
  B1: FGC_Block     PORT MAP(INPUT & SSTATE, SFGC);
  B2: NSTATE_Block  PORT MAP(INPUT & SSTATE, SNSTATE);
  B3: OUT_Block     PORT MAP(INPUT & SSTATE, SOUT);

  -- Elementos de memória
  STT1: D_Latch0    PORT MAP(DFGC, SNSTATE(1), RESET, SSTATE(1));
  STT0: D_Latch1    PORT MAP(DFGC, SNSTATE(0), RESET, SSTATE(0));

  OUT1: D_Latch0    PORT MAP(SSOUT(1) XOR SOUT(1), SOUT(1), RESET, SSOUT(1));
  OUT0: D_Latch0    PORT MAP(SSOUT(0) XOR SOUT(0), SOUT(0), RESET, SSOUT(0));

  -- Ordem dos outputs
      aout <= SSOUT(1);
     frout <= SSOUT(0);

END ALC_XMS;
