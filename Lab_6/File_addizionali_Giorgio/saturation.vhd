library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- saturation circuit
entity saturation is
 port (i: in signed (9 downto 0);
 sel: in std_logic_vector (1 downto 0);
 flag: out std_logic_vector (1 downto 0);
 o: out signed (7 downto 0));
end entity;

architecture structural of saturation is
signal p_o: signed (6 downto 0); -- partial output
signal comp: std_logic; -- comparation signal

component multiple_xor is
	port (i: in signed (2 downto 0);
	o: out std_logic);
end component;

component mux_4to1 is 
	generic (n: integer);
	port (w, x, y, z: in signed (n-1 downto 0);
	sel: in std_logic_vector (1 downto 0);
	o: out signed (n-1 downto 0));
end component;

begin
multi_xor: multiple_xor port map (i => i (9 downto 7), o => comp);

mux: mux_4to1 generic map (n => 7)
 port map (w => i (6 downto 0), x => i (6 downto 0), y => "1111111",
 z => "0000000", sel => sel, o => p_o);

o <= i (9) & p_o;
flag <= comp&i (9);
end structural; 