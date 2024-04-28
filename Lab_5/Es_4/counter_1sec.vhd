library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity counter_1sec is
 port (clk, rst: in std_logic;
 en : out std_logic);
end entity;

architecture behavior of counter_1sec is

signal count: unsigned(25 downto 0);
begin
	process(clk)
	begin
		if clk'event AND clk = '1' then
			 if rst = '0' then
			 count <= (others => '0');
			 en <= '0';
			 else
			 count <= count + 1;
			 en <= '0';
			 if count = "00000000000000000000110000" then
			 en <= '1';
			 elsif count = "00000000000000000000110001" then 
			 count <= (others => '0');
			 end if;
			 end if; 
		end if;
	end process;
end architecture;