library ieee;
use ieee.std_logic_1164.all;

entity one_hot_fsm_tb is
end entity;

architecture behavior of one_hot_fsm_tb is

component one_hot_fsm is	
	port ( KEY0 : in std_logic;	--clk
			 SW0 : in std_logic;		--rst
			 SW1 : in std_logic;		--input w
			 LEDR0 : out std_logic	--output z
		  );
end component;

signal KEY0_tb, SW0_tb, SW1_tb : std_logic;

begin
	
	dut : one_hot_fsm port map ( KEY0 => KEY0_tb, SW0 => SW0_tb, SW1 => SW1_tb);
	
	process
	begin
	
		SW0_tb <= '0';
		KEY0_tb <= '0';
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW0_tb <= '1';
		SW1_tb <= '0';	--w=0
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '0';	--w=0
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '0';	--w=0
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '1'; --w=1
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '1'; --w=1
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '1'; --w=1
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '1'; --w=1
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '1'; --w=1
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '0';	--w=0
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '0';	--w=0
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '0';	--w=0
		wait for 5 ns;
		KEY0_tb <= '1';
		wait for 5 ns;
		
		KEY0_tb <= '0';
		SW1_tb <= '0';	--w=0
		wait for 5 ns;
		KEY0_tb <= '1';
		wait;
	
	end process;
	
end behavior;
	