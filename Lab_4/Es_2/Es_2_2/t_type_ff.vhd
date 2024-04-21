-- T-type flip-flop
library ieee;
use ieee.std_logic_1164.all;

entity t_type_ff is
	port (Clock, Resetn, T : in std_logic;
			Q : out std_logic
			);
end t_type_ff;

architecture behavior of t_type_ff is

signal temp: std_logic := '0';

begin

	process(T, Clock, Resetn)
	begin
	
	if (Resetn <= '0') then
		temp <= '0';
	elsif (Clock'event and Clock = '1') then 
		if (T = '1') then 
			temp <= not(temp);
		else 
			temp <= temp;
		end if;
	end if;
	end process;
	
	Q <= temp;
	
end behavior;