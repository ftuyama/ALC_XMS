library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Latch is
  Port (
    EN : in  STD_LOGIC;
    D  : in  STD_LOGIC;
    Q  : out STD_LOGIC
  );
end D_Latch;

architecture Behavioral of D_Latch is
begin
process(EN, D)
begin
  if (EN = '1') then
    Q <= D;
  end if;
end process;
end Behavioral;
