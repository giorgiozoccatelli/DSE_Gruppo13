library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cba_16bit is 
	port ( a, b : in signed(15 downto 0);
			 c_in : in std_logic;
			 c_out : out std_logic;
			 s : out signed(15 downto 0)
			);
end entity;

architecture behavior of cba_16bit is

component carry_bypass_adder_4bit
		port ( a, b : in signed(3 downto 0);
			 carry_in : in std_logic;
			 s : out signed(3 downto 0);
			 carry_out : out std_logic
		  );
end component;

signal c : std_logic_vector(2 downto 0);

begin

cba0 : carry_bypass_adder_4bit port map ( a => a(3 downto 0), b => b(3 downto 0), carry_in => c_in, carry_out => c(0), s => s(3 downto 0));
cba1 : carry_bypass_adder_4bit port map ( a => a(7 downto 4), b => b(7 downto 4), carry_in => c(0), carry_out => c(1), s => s(7 downto 4));
cba2 : carry_bypass_adder_4bit port map ( a => a(11 downto 8), b => b(11 downto 8), carry_in => c(1), carry_out => c(2), s => s(11 downto 8));
cba3 : carry_bypass_adder_4bit port map ( a => a(15 downto 12), b => b(15 downto 12), carry_in => c(2), carry_out => c_out, s => s(15 downto 12));

end architecture;