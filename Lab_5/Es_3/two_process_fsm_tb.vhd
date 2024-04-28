library ieee;
use ieee.std_logic_1164.all;

entity two_process_fsm_tb is
end entity;

architecture behavior of two_process_fsm_tb is

	component two_process_fsm is
		 port (KEY0 : in std_logic;
		 SW : in std_logic_vector(1 downto 0);
		 LEDR0: out std_logic);
	end component;
	
signal w, z, clk, rst: std_logic;

begin
dut: two_process_fsm port map(KEY0=>clk, SW(0)=> rst, SW(1)=>w, LEDR0=>z);
	process
	begin
		clk <= '1';
		rst <= '0';
		w <= '0';
		wait for 10 ns;
		clk <= '0';
		rst <= '1';
		w <= '0';
		wait for 10 ns;
		clk <= '1';
		w <= '0'; 
		wait for 10 ns;
		clk <= '0';
		w <= '0'; 
		wait for 10 ns;
		clk <= '1'; 
		w <= '1'; 
		wait for 10 ns;
		clk <= '0';
		w <= '0'; 
		wait for 10 ns;
		clk <= '1';
		w <= '0'; 
		wait for 10 ns;
		clk <= '0';
		w <= '0'; 
		wait for 10 ns;
		clk <= '1';
		w <= '0'; 
		wait for 10 ns;
		clk <= '0';
		w <= '0';
		wait for 10 ns;
		clk <= '1';	
		w <= '0';
		wait for 10 ns;
		clk <= '0';
		w <= '0';
		wait for 10 ns;
		clk <= '1';
		w <= '1';
		wait for 10 ns;
		clk <= '0';
		w <= '1';
		wait for 10 ns;
		clk <= '1';
		w <= '1';
		wait for 10 ns;
		clk <= '0';
		w <= '1';
		wait for 10 ns;
		clk <= '1';
		w <= '1';
		wait for 10 ns;
		clk <= '0';
		w <= '1';
		rst <= '0';
		wait for 10 ns;
		clk <= '1';
		w <= '1';		
		wait;
	end process;
end behavior;