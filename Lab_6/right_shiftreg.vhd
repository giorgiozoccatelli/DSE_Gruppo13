library ieee;
use ieee.std_logic_1164.all;

entity right_shiftreg is 
	port ( clk, rst, D : in std_logic;
			Q : out std_logic_vector(7 downto 0)
			);
end right_shiftreg;

architecture behavior of right_shiftreg is
signal qs : std_logic_vector(7 downto 0);
begin
	process(clk, rst)
	begin
	
			if rst = '1' then
				qs <= (others => '0');
			elsif clk'event and clk ='1' then
				qs(7) <= D;
				qs(6 downto 0) <= qs(7 downto 1);
			end if;
			
	end process;	
	Q <= qs;	
end behavior;
			