library ieee;
use ieee.std_logic_1164.all;

entity two_process_fsm is
	 port (KEY0 : in std_logic;
	 SW : in std_logic_vector(1 downto 0);
	 LEDR0: out std_logic);
end entity;

architecture behavior of two_process_fsm is
	component fsm is
	 port(clk, rst, w: in std_logic;
	 z: out std_logic);
	end component;

begin
fsm0: fsm port map (clk => KEY0, rst => SW(0), w => SW(1), z => LEDR0);
end behavior; 