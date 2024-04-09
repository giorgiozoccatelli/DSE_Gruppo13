library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity csa is 
	port ( a, b : in signed(15 downto 0);
			 c_in : in std_logic;
			 s : out signed(15 downto 0);
			 c_out : out std_logic
		  );
end entity;

architecture behavior of csa is
	
	component rca_4bit
		port ( a,b: in signed(3 downto 0);
				 c_in : in std_logic;
				 c_out : out std_logic;
				 s : out signed(3 downto 0)
			  );
	end component;
	
	component mux_4bit 
		port ( a, b : in signed(3 downto 0);
				 s : in std_logic;
				 u : out signed(3 downto 0)
		  );
	end component;
	
	component mux_2to1
		port ( a, b, s : in std_logic;
				 u : out std_logic
				);
	end component;
	
	signal s0_1, s1_1, s0_2, s1_2, s0_3, s1_3 : signed(3 downto 0);

	signal c4, c8, c12 : std_logic;
	
	signal c0_8, c1_8, c0_12, c1_12, c0_16, c1_16 : std_logic;
	
	begin
	
	rca0 : rca_4bit port map(a => a(3 downto 0), b => b(3 downto 0), s => s(3 downto 0), c_in => c_in, c_out => c4);
	
	rca1 : rca_4bit port map(a => a(7 downto 4), b => b(7 downto 4), s => s0_1, c_in => '0' , c_out => c0_8);
	rca2 : rca_4bit port map(a => a(7 downto 4), b => b(7 downto 4), s => s1_1, c_in => '1' , c_out => c1_8);
	
	rca3 : rca_4bit port map(a => a(11 downto 8), b => b(11 downto 8), s => s0_2, c_in => '0' , c_out => c0_12);
	rca4 : rca_4bit port map(a => a(11 downto 8), b => b(11 downto 8), s => s1_2, c_in => '1' , c_out => c1_12);
	
	rca5 : rca_4bit port map(a => a(15 downto 12), b => b(15 downto 12), s => s0_3, c_in => '0' , c_out => c0_16);
	rca6 : rca_4bit port map(a => a(15 downto 12), b => b(15 downto 12), s => s1_3, c_in => '1' , c_out => c1_16);
	
	mux0 : mux_4bit port map(a => s0_1, b => s1_1, s => c4, u => s(7 downto 4));
	mux1 : mux_4bit port map(a => s0_2, b => s1_2, s => c8, u => s(11 downto 8));
	mux2 : mux_4bit port map(a => s0_3, b => s1_3, s => c12, u => s(15 downto 12));
	
	mux2_0 : mux_2to1 port map(a => c0_8, b=> c1_8, s=> c4, u => c8);
	mux2_1 : mux_2to1 port map(a => c0_12, b=> c1_12, s=> c8, u => c12);
	mux2_2 : mux_2to1 port map(a => c0_16, b=> c1_16, s=> c12, u => c_out);
	
end architecture;
