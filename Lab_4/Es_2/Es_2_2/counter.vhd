--16-bit synchronous counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is 
	port ( clk : in std_logic;
			 rst : in std_logic;
			 enable : in std_logic;
			 Q : out unsigned(3 downto 0)
		  );
end counter;

architecture behavior of counter is

	component t_type_ff 
		port (T, Clock, Resetn : in std_logic;
				Q : out unsigned
				);
	end component;
	
	begin
	
	ff0 : t_type_ff port map( T => enable, Clock => clk, Q => Q(3), Resetn => rst);

	ff1 : t_type_ff port map( T => temp(0), Clock => clk, Q => Q(2), Resetn => rst);

	ff2 : t_type_ff port map( T => temp(1), Clock => clk, Q => Q(1), Resetn => rst);

	ff3 : t_type_ff port map( T => temp(2), Clock => clk, Q => Q(0), Resetn => rst);
	
	Q <= d_temp;
	
end behavior;	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	