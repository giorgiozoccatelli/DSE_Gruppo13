library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity display_converter is
	 port (index: in unsigned (2 downto 0);
			hex : out std_logic_vector(6 downto 0));
end entity;

architecture structural of display_converter is
begin
	 hex(0) <= index(2) or not index(0);
	 hex(1) <= index(2) or (index(1) xor index(0));
	 hex(2) <= index(2) or (index(1) xor index(0));
	 hex(3) <= index(2) or (index(1) nor index(0));
	 hex(4) <= index(2);
	 hex(5) <= index(2);
	 hex(6) <= index(2)or index(1);
end structural; 