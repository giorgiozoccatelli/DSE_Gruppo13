library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;

 
entity ripple_adder is
	Port ( A, B : in signed (3 downto 0);
	Cin : in STD_LOGIC;
	S : out signed (3 downto 0);
	Cout, ovf_check: out STD_LOGIC);
end ripple_adder;
 
architecture Behavioral of ripple_adder is
 
	COMPONENT full_adder
		Port ( A, B, Cin : in STD_LOGIC;
		S, Cout : out STD_LOGIC);
	end COMPONENT;
 
signal carry: std_logic_vector(2 downto 0);
signal sum: signed(3 downto 0);
 
begin

FA0: full_adder port map(A(0), B(0), Cin, S(0), carry(0));
FA1: full_adder port map(A(1), B(1), carry(0), S(1), carry(1));
FA2: full_adder port map(A(2), B(2), carry(1), S(2), carry(2));
FA3: full_adder port map(A(3), B(3), carry(2), S(3), Cout);

end Behavioral;
