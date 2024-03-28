library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter2_display2_tb is
end converter2_display2_tb;

architecture behavioral of converter2_display2_tb is 

	component converter2_display2
	port ( SW : in unsigned(5 downto 0);
			 HEX0, HEX1 : out std_logic_vector(0 to 6)
         );
	end component;
	
	signal SW_tb : unsigned(5 downto 0);
	
	begin
		
		dut : converter2_display2  port map(
			SW => SW_tb
			);
			
	process
	begin
		SW_tb <= "111111"; -- numero 63
		wait for 20 ns;
		
		SW_tb <= "000000"; -- numero 00 ossia blank
		wait for 20 ns;
		
		SW_tb <= "101111"; -- numero 47
		wait for 20 ns;
		
		SW_tb <= "000010"; -- numero 2
		wait for 20 ns;
		
		SW_tb <= "001011"; -- numero 11
		wait;
		
	end process;
end behavioral;
