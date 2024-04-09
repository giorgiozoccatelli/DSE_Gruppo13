library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_4bit is
	port ( a, b : in signed(3 downto 0);
				 s : in std_logic;
				 u : out signed(3 downto 0)
		  );
end entity;

architecture behavior of mux_4bit is
begin
		u(0) <= (a(0) and not s) or (b(0) and s);
		u(1) <= (a(1) and not s) or (b(1) and s);
		u(2) <= (a(2) and not s) or (b(2) and s);
		u(3) <= (a(3) and not s) or (b(3) and s);
end architecture;