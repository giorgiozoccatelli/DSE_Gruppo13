library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_4to1 is
 generic (n: integer);
 port (w, x, y, z: in signed (n-1 downto 0);
 sel: in std_logic_vector (1 downto 0);
 o: out signed (n-1 downto 0));
end entity;

architecture behavioral of mux_4to1 is
begin
	process (sel, w, x, y, z)
	begin
	case sel is
		 when "00" => o <= w;
		 when "01" => o <= x;
		 when "10" => o <= y;
		 when others => o <= z;
	end case;
	end process;
end architecture; 