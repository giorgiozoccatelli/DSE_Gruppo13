library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
port (a, b: in signed (8 downto 0);
	 cin: in std_logic;
	 sum: out signed (8 downto 0));
end entity;

architecture behavioral of adder is
begin
sum <= a + b + ("00000000" & cin);
end behavioral;