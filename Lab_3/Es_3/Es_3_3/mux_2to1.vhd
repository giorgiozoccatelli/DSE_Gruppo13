library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is 
	port ( a, b, s : in std_logic;
			 u : out std_logic
			);
end entity;

architecture behavior of mux_2to1 is
	begin
		u <= (a and not s) or (b and s);
end architecture;
	