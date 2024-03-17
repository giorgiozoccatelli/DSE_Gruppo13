library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end mux_tb;
	
architecture behavior of mux_tb is 
	component mux 
		port (
				a,b: in std_logic;
				s: in std_logic;
				y: out std_logic
		);
	end component;
	
signal a_tb, b_tb, s_tb: std_logic;
signal y_tb: std_logic;

begin 
	uut : mux port map (
				a_tb <= a, 
				b_tb <= b, 
				s_tb <= s,
				y_tb <= y);
		
process
					
	begin

		  a_tb <= '0';
        b_tb <= '0';
        s_tb <= '0';
        wait for 10 ns;
        
        a_tb <= '0';
        b_tb <= '0';
        s_tb <= '1';
        wait for 10 ns;
        
        a_tb <= '0';
        b_tb <= '1';
        s_tb <= '0';
        wait for 10 ns;
        
        a_tb <= '0';
        b_tb <= '1';
        s_tb <= '1';
        wait for 10 ns;
        
        a_tb <= '1';
        b_tb <= '0';
        s_tb <= '0';
        wait for 10 ns;
        
        a_tb <= '1';
        b_tb <= '0';
        s_tb <= '1';
        wait for 10 ns;
        
        a_tb <= '1';
        b_tb <= '1';
        s_tb <= '0';
        wait for 10 ns;
        
        a_tb <= '1';
        b_tb <= '1';
        s_tb <= '1';
        wait;
		
	end process;
end architecture behavior;
