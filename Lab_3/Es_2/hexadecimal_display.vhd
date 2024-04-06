library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hexadecimal_display is 
	port ( 
			HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(0 to 6)
		   );