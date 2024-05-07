library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity multiple_xor is
	 port (i: in signed (2 downto 0);
	 o: out std_logic);
	end entity;
architecture structural of multiple_xor is

signal find0, find1: std_logic;
begin

find1 <= i(2) or i(1) or i(0);

find0 <= i(2) and i(1) and i(0);

o <= not find0 and find1;
end structural; 