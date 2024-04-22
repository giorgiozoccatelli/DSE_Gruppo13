library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity johnson_counter is 
	Port (clk_j,reset, enable, freeze: in std_logic;
			display_out: OUT std_logic_vector(0 to 6)
	);
end johnson_counter;

architecture behavior of johnson_counter is

	component flipflop is
		port(clk: in std_logic;
		rst: in std_logic;
		start_j: in std_logic;
		D: in std_logic;
		Q: out std_logic
		);
	end component;
	
	component display_counter is 
	Port (start_j:in std_logic;
			number: IN std_logic_vector(0 to 4);
			display: OUT std_logic_vector(0 to 6)
		);
	end component;
	
	component regn is
		GENERIC ( N : integer:=5);
		PORT (R : IN std_logic_vector(0 to N-1);
		clk, rst, start_j, stop: IN STD_LOGIC;
		Q : OUT std_logic_vector(0 to N-1));
	end component;
	
	signal d_temp : std_logic_vector(0 to 4) := "00000"; 
	signal display_temp: std_logic_vector(0 to 4);
	signal inv: std_logic := '0';


begin
	inv <= not(d_temp(4));
	ff0: flipflop port map(clk=> clk_j, rst=>reset, start_j=>enable, D=>inv, Q=>d_temp(0));
	ff1: flipflop port map(clk=> clk_j, rst=>reset, start_j=>enable, D=>d_temp(0), Q=>d_temp(1));
	ff2: flipflop port map(clk=> clk_j, rst=>reset, start_j=>enable, D=>d_temp(1), Q=>d_temp(2));
	ff3: flipflop port map(clk=> clk_j, rst=>reset, start_j=>enable, D=>d_temp(2), Q=>d_temp(3));
	ff4: flipflop port map(clk=> clk_j, rst=>reset, start_j=>enable, D=>d_temp(3), Q=>d_temp(4));
	regn0: regn port map(R=>d_temp,clk=>clk_j, rst=>reset, start_j=>enable, stop=>freeze, Q=>display_temp);
	display: display_counter port map(start_j=> enable, number=>display_temp, display=>display_out);
end behavior;
	