library ieee;
use ieee.std_logic_1164.all;

entity left_shiftreg is 
	port ( clk, rst: in std_logic;
			D : in std_logic_vector(9 downto 0);
			Q : out std_logic_vector(9 downto 0)
			);
end left_shiftreg;

architecture behavior of left_shiftreg is
signal qs : std_logic_vector(9 downto 0);
begin
	process(clk, rst)
	begin
	
			if rst = '1' then
				qs <= (others => '0');
			elsif clk'event and clk ='1' then
				qs(0) <= '0';
				qs(9 downto 1) <= D(8 downto 0);
			end if;
			
	end process;	
	Q <= qs;	
end behavior;
			