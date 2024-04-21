--testbench
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is 
end entity;

architecture behavior of counter_tb is
	
	component counter is
		port ( clk : in std_logic;
				 rst : in std_logic;
				 Q : out std_logic_vector(15 downto 0)
			  );
	end component;
	
	signal clk_tb, rst_tb : std_logic;
	
	begin
		
		dut : counter port map (clk => clk_tb, rst => rst_tb);
	
	process
	begin
	
	rst_tb <='0';	--setting RESET value to '0'
	clk_tb <= '0';		
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 2 ns;
	rst_tb <='1';	--RESET to '1'
	wait for 3 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;  
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait for 5 ns;
	
	clk_tb <='1';
	wait for 5 ns;
	clk_tb <= '0';
	wait;
	
	end process;
end behavior;
		