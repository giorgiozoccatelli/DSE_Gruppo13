library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regn is
	 generic (n: integer );
	 port (d: in signed (n-1 downto 0); 
	 clk, rst, en: in std_logic;
	 q: out signed (n-1 downto 0));
end entity;

architecture behavior of regn is
begin
	process (clk, rst)
	begin
	if (rst = '0') then
		q <= (others => '0');
	elsif (clk'event and clk = '1') then
		if en = '1' then
			q <= d;
		end if;
	end if;
end process;
end behavior;