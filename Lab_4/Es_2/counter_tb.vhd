--testbench
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is 
end entity;

architecture behavior of counter_tb is
	
	component counter is
		port ( KEY0 : in std_logic;
			 SW1 : in std_logic;
			 SW0 : in std_logic;
			 Q : out std_logic_vector(15 downto 0);
			 HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(6 downto 0)
		  );
	end component;
	
	signal KEY0_tb, SW1_tb, SW0_tb : std_logic;
	
	begin
		
		dut : counter port map (KEY0 => KEY0_tb, SW0 => SW0_tb, SW1 => SW1_tb);
	
	process
	begin
	
	SW1_tb <='1';	--setting ENABLE value to '1'
	SW0_tb <='0';	--setting RESET value to '0'
	KEY0_tb <= '0';		
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 2 ns;
	SW0_tb <='1';	--RESET to '1'
	wait for 3 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 2 ns;
	SW1_tb <= '0';		--setting ENABLE value to '0'
	wait for 3 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 2 ns;
	SW1_tb <= '1';    --resetting ENABLE value to '1'
	wait for 3 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;
	
	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait for 5 ns;

	KEY0_tb <='1';
	wait for 5 ns;
	KEY0_tb <= '0';
	wait;
	
	end process;
end behavior;
		