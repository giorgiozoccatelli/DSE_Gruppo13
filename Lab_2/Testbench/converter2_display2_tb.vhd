library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter2_display2_tb is
end converter2_display2_tb;

architecture behavior of converter2_display2_tb is 

	component converter2_display2
	port ( SW : in unsigned(5 downto 0);
			 HEX0, HEX1 : out std_logic_vector(6 downto 0)
         );
	end component;
	
	signal SW_tb : unsigned(5 downto 0);
	
	begin
		
		dut : converter2_display2  port map(
			SW => SW_tb
			);
			
	process
	begin
		SW_tb <= "111111"; -- numero 77
		wait for 20 ns;
		
		SW_tb <= "000000"; -- numero 00 ossia blank
		wait for 20 ns;
		
		SW_tb <= "101111"; -- numero 57
		wait for 20 ns;
		
		SW_tb <= "000010"; -- numero 2
		wait for 20 ns;
		
		SW_tb <= "001011"; -- numero 13
		wait;
		
	end process;
end behavior;
