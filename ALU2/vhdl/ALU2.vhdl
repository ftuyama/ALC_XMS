library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY ALU2 IS
  PORT (
    RESET  : IN  STD_LOGIC;
    C, start, EvDone, M1A, M2A2 : in std_logic;
    STATE  : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    NSTATE : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
        FGC    : OUT STD_LOGIC;
Prech, LX, LY, A2M, EndP, seldx, selym2 : out std_logic
  );
END ENTITY ALU2;

ARCHITECTURE ALC_XMS OF ALU2 IS

COMPONENT FGC_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT NSTATE_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
  );
END COMPONENT;

COMPONENT OUT_Block IS
  PORT (
    INPUT  : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    OUTPUT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
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

  SIGNAL INPUT  : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL SSTATE : STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL SNSTATE: STD_LOGIC_VECTOR(8 DOWNTO 0);
  SIGNAL SSOUT  : STD_LOGIC_VECTOR(6 DOWNTO 0);
  SIGNAL SOUT   : STD_LOGIC_VECTOR(6 DOWNTO 0);
  SIGNAL DFGC   : STD_LOGIC;
  SIGNAL SFGC   : STD_LOGIC;
BEGIN

  -- Ordem dos inputs
  INPUT <= C & start & EvDone & M1A & M2A2;

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
  STT8: D_Latch0    PORT MAP(DFGC, SNSTATE(8), RESET, SSTATE(8));
  STT7: D_Latch1    PORT MAP(DFGC, SNSTATE(7), RESET, SSTATE(7));
  STT6: D_Latch0    PORT MAP(DFGC, SNSTATE(6), RESET, SSTATE(6));
  STT5: D_Latch0    PORT MAP(DFGC, SNSTATE(5), RESET, SSTATE(5));
  STT4: D_Latch0    PORT MAP(DFGC, SNSTATE(4), RESET, SSTATE(4));
  STT3: D_Latch0    PORT MAP(DFGC, SNSTATE(3), RESET, SSTATE(3));
  STT2: D_Latch0    PORT MAP(DFGC, SNSTATE(2), RESET, SSTATE(2));
  STT1: D_Latch0    PORT MAP(DFGC, SNSTATE(1), RESET, SSTATE(1));
  STT0: D_Latch0    PORT MAP(DFGC, SNSTATE(0), RESET, SSTATE(0));

  OUT6: D_Latch1    PORT MAP(SSOUT(6) XOR SOUT(6), SOUT(6), RESET, SSOUT(6));
  OUT5: D_Latch0    PORT MAP(SSOUT(5) XOR SOUT(5), SOUT(5), RESET, SSOUT(5));
  OUT4: D_Latch0    PORT MAP(SSOUT(4) XOR SOUT(4), SOUT(4), RESET, SSOUT(4));
  OUT3: D_Latch0    PORT MAP(SSOUT(3) XOR SOUT(3), SOUT(3), RESET, SSOUT(3));
  OUT2: D_Latch0    PORT MAP(SSOUT(2) XOR SOUT(2), SOUT(2), RESET, SSOUT(2));
  OUT1: D_Latch0    PORT MAP(SSOUT(1) XOR SOUT(1), SOUT(1), RESET, SSOUT(1));
  OUT0: D_Latch0    PORT MAP(SSOUT(0) XOR SOUT(0), SOUT(0), RESET, SSOUT(0));

  -- Ordem dos outputs
     Prech <= SSOUT(6);
        LX <= SSOUT(5);
        LY <= SSOUT(4);
       A2M <= SSOUT(3);
      EndP <= SSOUT(2);
     seldx <= SSOUT(1);
    selym2 <= SSOUT(0);

END ALC_XMS;
