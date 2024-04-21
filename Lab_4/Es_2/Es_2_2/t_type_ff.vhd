-- T-type flip-flop
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity t_type_ff is
	port (Clock, Resetn, T : in std_logic;
			Q : out unsigned
			);
end t_type_ff;

architecture behavior of t_type_ff is

signal temp: unsigned := '0';

begin

	process(T, Clock, Resetn)
	begin
	
	if (Resetn <= '0') then
		temp <= '0';
	elsif (Clock'event and Clock = '1') then 
		if (T = '1') then 
			temp <= not(temp) + 1;
		else 
			temp <= temp + 1;
		end if;
	end if;
	end process;
	
	Q <= temp;
	
end behavior;