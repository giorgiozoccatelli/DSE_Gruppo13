library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
	port(x, y: in std_logic_vector(6 downto 0);
		  s: in std_logic;
		  m: out std_logic_vector(6 downto 0));
end entity;

architecture structural of mux_2to1 is
begin
	m(0) <= (NOT s AND x(0)) OR (s AND y(0));
	m(1) <= (NOT s AND x(1)) OR (s AND y(1));
	m(2) <= (NOT s AND x(2)) OR (s AND y(2));
	m(3) <= (NOT s AND x(3)) OR (s AND y(3));
	m(4) <= (NOT s AND x(4)) OR (s AND y(4));
	m(5) <= (NOT s AND x(5)) OR (s AND y(5));
	m(6) <= (NOT s AND x(6)) OR (s AND y(6));
end structural;