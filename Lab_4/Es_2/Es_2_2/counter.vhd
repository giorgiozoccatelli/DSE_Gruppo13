--16-bit synchronous counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is 
	port ( clk : in std_logic;
			 rst : in std_logic;
			 enable : in std_logic;
			 Q : out std_logic_vector(3 downto 0)
		  );
end counter;

architecture behavior of counter is

	component t_type_ff 
		port (T, Clock, Resetn : in std_logic;
				Q : out std_logic
				);
	end component;
	
	signal d_temp : std_logic_vector(0 to 3) := "0000";
	signal temp : std_logic_vector(0 to 2);
	
	begin
	
	ff0 : t_type_ff port map( T => enable, Clock => clk, Q => d_temp(3), Resetn => rst);
	
	temp(0) <= d_temp(3) and enable;
	ff1 : t_type_ff port map( T => temp(0), Clock => clk, Q => d_temp(2), Resetn => rst);
	
	temp(1) <= d_temp(2) and temp(0);
	ff2 : t_type_ff port map( T => temp(1), Clock => clk, Q => d_temp(1), Resetn => rst);
	
	temp(2) <= d_temp(1) and temp(1);
	ff3 : t_type_ff port map( T => temp(2), Clock => clk, Q => d_temp(0), Resetn => rst);
	
	Q <= d_temp;
	
end behavior;	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	