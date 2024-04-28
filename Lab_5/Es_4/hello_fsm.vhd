library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hello_fsm is
	 port ( KEY0, CLOCK_50: in std_logic;
	 HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(6 downto 0));
end entity;

architecture structure of hello_fsm is

signal rep, en_fsm, en_reg, sel: std_logic;
signal q5, input, control: std_logic_vector (6 downto 0);
signal reg: unsigned (2 downto 0);

	component mux_2to1 is
		 port(x, y: in std_logic_vector(6 downto 0);
		 s : in std_logic;
		 m: out std_logic_vector(6 downto 0));
	end component;

	component display_converter is
		 port ( index: in unsigned (2 downto 0);
		 hex : out std_logic_vector(6 downto 0));
	end component;

	component regn is
		 port ( clk, en, rst: in std_logic;
		 d : in std_logic_vector (6 downto 0);
		 q0, q1, q2, q3, q4: buffer std_logic_vector (6 downto 0);
		 q5 : out std_logic_vector (6 downto 0));
	end component;
	
	component counter_1sec is
		 port (clk, rst: in std_logic; 
		  en : out std_logic);
	end component;
	
	component counter_1to5 is
		 port (clk, rst, en: in std_logic;
		 rep : out std_logic);
	end component;
	
	component flipflop is
		 port (clk, rst, d : in std_logic;
		 q : out std_logic);
	end component;

	component fsm is
		 port(clk, rst, en, rep: in std_logic;
		 reg: out unsigned (2 downto 0);
		 sel: out std_logic);
	end component;
	
begin
	 mux: mux_2to1 port map (control, q5, sel, input);
	 converter: display_converter port map (reg, control);
	 registers: regn port map (CLOCK_50, en_reg, KEY0, input, HEX0, HEX1, HEX2, HEX3, HEX4, q5);
	 state_machine: fsm port map (CLOCK_50, KEY0, en_fsm, rep, reg, sel);
	 counter1: counter_1sec port map (CLOCK_50, KEY0, en_fsm);
	 ff: flipflop port map (CLOCK_50, KEY0, en_fsm, en_reg);
	 counter2: counter_1to5 port map (CLOCK_50, KEY0, en_reg, rep);
	 HEX5 <= q5;
end architecture;