library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sixteenbit_rca is 
	port ( a_tot, b_tot : in signed(15 downto 0);
			 carry_in : in std_logic;
			 s_tot : out signed(15 downto 0);
			 carry_out : out std_logic
		  );
end sixteenbit_rca;

architecture behavior of sixteenbit_rca is 
			
	component full_adder 
		port( a : in std_logic;
				b : in std_logic;
				s : out std_logic;
				c_in : in std_logic;
				c_out : out std_logic
			 );
	end component;
		
	signal carry : std_logic_vector(14 downto 0);
	
	begin
	
	FA0 : full_adder port map(a_tot(0), b_tot(0), s_tot(0), carry_in, carry(0));
	FA1 : full_adder port map(a_tot(1), b_tot(1), s_tot(1), carry(0), carry(1));
	FA2 : full_adder port map(a_tot(2), b_tot(2), s_tot(2), carry(1), carry(2));
	FA3 : full_adder port map(a_tot(3), b_tot(3), s_tot(3), carry(2), carry(3));
	FA4 : full_adder port map(a_tot(4), b_tot(4), s_tot(4), carry(3), carry(4));
	FA5 : full_adder port map(a_tot(5), b_tot(5), s_tot(5), carry(4), carry(5));
	FA6 : full_adder port map(a_tot(6), b_tot(6), s_tot(6), carry(5), carry(6));
	FA7 : full_adder port map(a_tot(7), b_tot(7), s_tot(7), carry(6), carry(7));
	FA8 : full_adder port map(a_tot(8), b_tot(8), s_tot(8), carry(7), carry(8));
	FA9 : full_adder port map(a_tot(9), b_tot(9), s_tot(9), carry(8), carry(9));
	FA10 : full_adder port map(a_tot(10), b_tot(10), s_tot(10), carry(9), carry(10));
	FA11 : full_adder port map(a_tot(11), b_tot(11), s_tot(11), carry(10), carry(11));
	FA12 : full_adder port map(a_tot(12), b_tot(12), s_tot(12), carry(11), carry(12));
	FA13 : full_adder port map(a_tot(13), b_tot(13), s_tot(13), carry(12), carry(13));
	FA14 : full_adder port map(a_tot(14), b_tot(14), s_tot(14), carry(13), carry(14));
	FA15 : full_adder port map(a_tot(15), b_tot(15), s_tot(15), carry(14), carry_out);
	
end behavior;