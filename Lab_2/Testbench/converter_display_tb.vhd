library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;



entity converter_display_tb is
end entity converter_display_tb;


architecture behavior of converter_display_tb is
	component converter_display
	PORT ( SW : IN unsigned(3 DOWNTO 0);
			 HEX1,HEX0 : OUT STD_LOGIC_VECTOR(0 to 6)
			);
	end component;
	
signal SW_tb: unsigned(3 downto 0);

begin	
		dut: converter_display port map(
			SW => SW_tb
			);
			
	process
	begin
		SW_tb <= "1001"; -- Numero 9
   	wait for 20 ns; 
		SW_tb <= "0100"; -- Numero 4
		wait for 20 ns;
		SW_tb <= "1111"; -- Numero 15
		wait for 20 ns;
		SW_tb <= "1101"; -- Numero 13
		wait;
	end process;
end behavior;
