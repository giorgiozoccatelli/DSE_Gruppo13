library ieee;
use ieee.std_logic_1164.all;


entity lab_2_1_tb is
end entity lab_2_1_tb;


architecture behavior of lab_2_1_tb is
	component lab_2_1
		port (SW: IN std_logic_vector(2 downto 0);
				HEX0: OUT std_logic_vector(0 to 6)
				);
	end component;
	
	signal SW_tb: std_logic_vector(2 downto 0);
	signal HEX0_tb: std_logic_vector(0 to 6);
	
	begin
		dut: lab_2_1 port map(
			SW => SW_tb,
			HEX0 => HEX0_tb
			);
	process
	begin
		SW_tb <= "000"; -- H
		wait for 20 ns;
		SW_tb <= "001"; -- E
		wait for 20 ns;
		SW_tb <= "010"; -- L
		wait for 20 ns;
		SW_tb <= "010"; -- L
		wait for 20 ns;
		SW_tb <= "011"; -- O
		wait for 20 ns;
		SW_tb <= "100"; -- blank
		wait;
	end process;
end behavior;

		



