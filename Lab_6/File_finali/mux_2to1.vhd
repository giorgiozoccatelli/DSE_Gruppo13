library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_2to1 is
	 generic (n: integer);
	 port (x, y: in signed (n-1 downto 0);
	 sel: in std_logic;
	 o: out signed (n-1 downto 0));
end entity;

architecture behavioral of mux_2to1 is
begin
	process (sel, x, y)
	begin
	case sel is
		when '0' => o <= x;
		when others => o <= y;
	end case;
	end process;
end architecture; 