library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity flipflop is
	Port (clk : in STD_LOGIC;
	rst : in STD_LOGIC;
	start_j: in std_logic;
	D : in STD_LOGIC;
	Q : out STD_LOGIC);
end flipflop;
 
architecture behavior of flipflop is
signal temp: std_logic:= '0';
	begin
		process(clk,rst,start_j)
		begin
		if rst = '1' then
			temp <= '0';
		elsif (clk'event and clk='1') then
			if start_j = '1' then
				temp <= D;
			else 
				temp <= '0';
			end if;
		end if;
		end process;
	Q <= temp;
end behavior;