LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity SR_latch_tb is
end entity;

architecture behavior of SR_latch_tb is 
	component SR_latch is
		port ( Clk, R, S : in STD_LOGIC;
				 Q : out STD_LOGIC);
	end component;
	
signal R_tb, Clk_tb, S_tb: std_logic;

begin
		
		dut: SR_latch port map (Clk => Clk_tb, R => R_tb, S => S_tb);

	process
	
	begin
	
	S_tb <= '0';
	R_tb <= '0';
	Clk_tb <= '0';
	wait for 10 ns;
	
	Clk_tb <= '1';		--clock cycle n.1
	wait for 10 ns;
	S_tb <= '1';		--set command up
	Clk_tb <= '0';
	wait for 10 ns;
	
	Clk_tb <= '1';		--clock cycle n.2
	wait for 10 ns;
	Clk_tb <= '0';
	wait for 5 ns;
	S_tb <= '0';		--set command down
	wait for 5 ns;
	
	Clk_tb <= '1';		--clock cycle n.3
	wait for 10 ns;
	Clk_tb <= '0';
	R_tb <= '1';		--reset command up
	wait for 10 ns;
	
	Clk_tb <= '1';		--clock cycle n.4
	wait for 10 ns;
	R_tb <= '0';		--reset command down
	Clk_tb <= '0';
	wait;

	end process;
end behavior;	