LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY johnson_counter_tb is
end ENTITY johnson_counter_tb;

ARCHITECTURE Behavior of johnson_counter_tb is

component johnson_counter is
	Port (CLOCK_50:in std_logic;
			KEY0: IN std_logic;
			HEX0: OUT std_logic_vector(0 to 6)
	);
end component;

	signal clk_50: std_logic;
	signal KEY0_tb: std_logic;
	constant CLOCK_PERIOD: time := 20 ns;
	
	begin
		dut: johnson_counter PORT MAP (CLOCK_50 => clk_50, KEY0 => KEY0_tb);
	
	process
	begin 
	 KEY0_tb <= '0';
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
	 KEY0_tb <= '1';
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
	 KEY0_tb <= '0';
	 clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';	 
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_50 <= '1';
	wait;
	end process;
end Behavior;