library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity V_Pulse is
  Port (
    i : in  STD_LOGIC;
    o : out STD_LOGIC
  );
end entity V_Pulse;

architecture Behavioral of V_Pulse is

signal s0,s1,s2,s4,s5: std_logic;

begin

s0<= '1';   
process (s0,s2,i)
begin
	if s2 = '0' then
	s1<='0';
	elsif s0 = '0' then
	s1<='1';
	elsif rising_edge(i) then
	s1 <= s0;
	end if;
end process;

s2<= not s1;   
process (s0,s2,s5)
begin
	if s5 = '0' then
	s4<='0';
	elsif s0 = '0' then
	s4<='1';
	elsif rising_edge(s2) then
	s4 <= s0;
	end if;
end process;

s5 <= not(s4);
o <= s4;

end architecture Behavioral;
