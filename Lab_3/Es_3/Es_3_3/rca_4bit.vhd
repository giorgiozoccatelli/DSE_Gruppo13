library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rca_4bit is 
	port ( a,b : in signed(3 downto 0);
			 c_in : in std_logic;
			 c_out : out std_logic; 
			 s : out signed(3 downto 0)
		  );
	end entity;

architecture behavior of rca_4bit is

	component full_adder
		port( a : in std_logic;
					b : in std_logic;
					c_in : in std_logic;
					s, c_out : out std_logic
				 );	
	end component;

	signal c : std_logic_vector(2 downto 0);
	
	begin
	
	full_adder0 : full_adder port map ( a => a(0), b => b(0), c_in => c_in, s => s(0), c_out => c(0)); 
	full_adder1 : full_adder port map ( a => a(1), b => b(1), c_in => c(0), s => s(1), c_out => c(1)); 
	full_adder2 : full_adder port map ( a => a(2), b => b(2), c_in => c(1), s => s(2), c_out => c(2));
	full_adder3 : full_adder port map ( a => a(3), b => b(3), c_in => c(2), s => s(3), c_out => c_out); 

end behavior;
