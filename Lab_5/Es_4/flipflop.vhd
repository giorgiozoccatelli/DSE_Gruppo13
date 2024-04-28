library ieee;
use ieee.std_logic_1164.all;

entity flipflop is
	 port (clk, rst, d : in std_logic;
			q : out std_logic);
end entity;
 
 
architecture behavior of flipflop is
begin
	process(clk)
	begin
		if clk'event AND clk = '1' then
			 if rst <= '0' then
			 q <= '0';
			 else
			 q <= d;
			 end if;
		end if;
	end process;
end behavior;