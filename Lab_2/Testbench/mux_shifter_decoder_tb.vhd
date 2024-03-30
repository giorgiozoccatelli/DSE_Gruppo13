library ieee;
use ieee.std_logic_1164.all;


entity mux_shifter_decoder_tb is
end entity mux_shifter_decoder_tb;


architecture behavior of mux_shifter_decoder_tb is
	component mux_shifter_decoder
	PORT ( SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			 HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(0 to 6)
			);
	end component;
	
	signal SW_tb: std_logic_vector(4 downto 0);
	
	begin	
		dut: mux_shifter_decoder port map(
			SW => SW_tb
			);
			
	process
	begin
		SW_tb <= "00100"; --Configurazione "ELLOH"
		wait for 20 ns; 
		SW_tb <= "01001"; --Configurazione "PPOCE"
		wait for 20 ns;
		SW_tb <= "01110"; --Configurazione "LOCEL"
		wait for 20 ns;
		SW_tb <= "11011"; --Configurazione "OFEPP"
		wait;
	end process;
end behavior;

		
