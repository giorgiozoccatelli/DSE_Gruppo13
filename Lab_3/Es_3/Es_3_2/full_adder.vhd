library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder is 
	port( a : in std_logic;
			b : in std_logic;
			c_in : in std_logic;
			s, c_out : out std_logic;
			p : out std_logic --propagate signal
		 );	
end full_adder;

architecture behavior of full_adder is 
begin 
		
		p <= a xor b;
		s <= c_in xor (a xor b);
		c_out <= (a and b) or (c_in and a) or (c_in and b);
		
end behavior;