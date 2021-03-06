library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Latch0 is
  Port (
    EN : in  STD_LOGIC;
    D  : in  STD_LOGIC;
    rst: in  STD_LOGIC;
    Q  : out STD_LOGIC
  );
end D_Latch0;

architecture Behavioral of D_Latch0 is

begin
process(EN, rst, D)
begin
  if (rst = '0') then
    Q <= '0';
  elsif (EN = '1') then
    Q <= D;
  end if;
end process;

end Behavioral;
