library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;


entity reaction_timer is 
	Port (SW: in std_logic_vector(7 downto 0);
			clock, KEY0, KEY3: IN std_logic;
			HEX0, HEX1, HEX2, HEX3: OUT std_logic_vector(0 to 6);
			LEDR0: out std_logic
	);
end reaction_timer;

architecture behavior of reaction_timer is

component delay_converter is
  port (
    switches : in std_logic_vector(7 downto 0); 
    delay_ms : out integer range 0 to 8000 
  );
end component;

component counter_delay is
  port (
    clk : in std_logic;
    reset : in std_logic;
	 delay_ms : in integer;
	 start_sample: out std_logic
  );
end component;


component clock_divider_10 is
	port ( clk,reset: in std_logic;
		   clock_out_10: out std_logic);
end component;

component clock_divider_100 is
 	port ( clk,reset: in std_logic;
		   clock_out_100: out std_logic);
end component;

component clock_divider_1000 is
	port ( clk,reset: in std_logic;
		   clock_out_1000: out std_logic);
end component;


component johnson_counter is
	Port (clk_j,reset,enable, freeze: in std_logic;
			display_out: OUT std_logic_vector(0 to 6)
	);
end component;

	signal delay_ms0: integer range 0 to 8000;
	signal start_sample0: std_logic;
	signal clock_10, clock_100, clock_1000: std_logic;
	
begin
	delay_converter0: delay_converter port map(switches => SW(7 downto 0), delay_ms => delay_ms0);
	counter_delay0: counter_delay port map(clk => clock, reset=>KEY0, delay_ms => delay_ms0, 
											start_sample=> start_sample0);
	divider_10: clock_divider_10 port map(clk=>clock, reset=>KEY0, clock_out_10=> clock_10);
	divider_100: clock_divider_100 port map(clk=>clock, reset=>KEY0, clock_out_100=> clock_100);	
	divider_1000: clock_divider_1000 port map(clk=>clock, reset=>KEY0, clock_out_1000=> clock_1000);
	johnson_counter0: johnson_counter port map(clk_j=>clock, reset=>KEY0, enable=>start_sample0, freeze => KEY3, display_out=>HEX0);
	johnson_counter1: johnson_counter port map(clk_j=>clock_10, reset=>KEY0, enable=>start_sample0, freeze => KEY3, display_out=>HEX1);
	johnson_counter2: johnson_counter port map(clk_j=>clock_100, reset=>KEY0, enable=>start_sample0, freeze => KEY3,  display_out=>HEX2);
	johnson_counter3: johnson_counter port map(clk_j=>clock_1000, reset=>KEY0, enable=>start_sample0, freeze => KEY3, display_out=>HEX3);
	LEDR0<=start_sample0;
end behavior;
	