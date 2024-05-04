library ieee;
use ieee.std_logic_1164.all;

entity left_shiftreg is 
	port ( clk, rst, D : in std_logic;
			Q : out std_logic_vector(7 downto 0)
			);
end left_shiftreg;

architecture behavior of left_shiftreg is
signal qs : std_logic_vector(7 downto 0);
begin
	process(clk, rst)
	begin
	
			if rst = '1' then
				qs <= (others => '0');
			elsif clk'event and clk ='1' then
				qs(0) <= D;
				qs(7 downto 1) <= qs(6 downto 0);
			end if;
			
	end process;	
	Q <= qs;	
end behavior;
			