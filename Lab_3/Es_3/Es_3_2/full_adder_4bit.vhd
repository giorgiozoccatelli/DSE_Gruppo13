library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity full_adder_4bit is
	port ( a, b : in signed (3 downto 0);
			 carry_in : in std_logic;
			 s : out signed(3 downto 0);
			 carry_out : out std_logic
		  );
end entity;

architecture behavior of full_adder_4bit is
	
	component mux_2to1
		port ( a, b, s : in std_logic;
				u : out std_logic
				);
	end component;
	
	component full_adder 
		port (a : in std_logic;
				b : in std_logic;
				c_in : in std_logic;
				s, c_out : out std_logic;
				p : out std_logic
			  );	
	end component;
	
	signal p : std_logic_vector(3 downto 0);
	signal c : std_logic_vector(3 downto 0);
	signal p2 : std_logic;
	
	begin
	
	full_adder0 : full_adder port map ( a => a(0), b => b(0), c_in => carry_in, c_out => c(0), p => p(0)); 
	full_adder1 : full_adder port map ( a => a(1), b => b(1), c_in => c(0), c_out => c(1), p => p(1)); 
	full_adder2 : full_adder port map ( a => a(2), b => b(2), c_in => c(1), c_out => c(2), p => p(2));
	full_adder3 : full_adder port map ( a => a(3), b => b(3), c_in => c(2), c_out => c(3), p => p(3)); 
	
	p2 <= p(0) and p(1) and p(2) and p(3);
	
	mux : mux_2to1 port map ( a => c(3), b => carry_in, s => p2, u => carry_out);

end architecture;
	