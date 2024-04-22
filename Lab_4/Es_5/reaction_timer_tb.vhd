LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reaction_timer_tb is
end ENTITY reaction_timer_tb;

ARCHITECTURE Behavior of reaction_timer_tb is

component reaction_timer is
	Port (SW: in std_logic_vector(7 downto 0);
			clock, KEY0, KEY3: IN std_logic;
			HEX0, HEX1, HEX2, HEX3: OUT std_logic_vector(0 to 6);
			LEDR0: out std_logic
	);
end component;

	signal clk_1: std_logic;
	signal KEY0_tb, KEY3_tb: std_logic;
	signal SW_tb: std_logic_vector(7 downto 0);
	constant CLOCK_PERIOD: time := 1 ms;
	
	begin
		dut: reaction_timer PORT MAP (SW => SW_tb, KEY0 => KEY0_tb, KEY3=>KEY3_tb, clock=>clk_1);
	
	process
	begin 
	 KEY0_tb <= '1';
	 KEY3_tb <= '0';
    clk_1 <= '0';
	 SW_tb <= "11000001"; -- 3 seconds delay
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
	 KEY0_tb <= '0';
    wait for 3000 ms;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';	 
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
	 KEY3_tb<= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
	 KEY0_tb <= '1';
	 clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';	 
	 KEY3_tb <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '0';
    wait for CLOCK_PERIOD/2;
    clk_1 <= '1';
	wait;
	end process;
end Behavior;