--16-bit synchronous counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is 
	port ( KEY0 : in std_logic;
			 SW0 : in std_logic;
			 SW1 : in std_logic;
			 Q : out std_logic_vector(15 downto 0);
			 HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(0 to 6)
		  );
end counter;

architecture behavior of counter is

	component t_type_ff 
		port (T, Clock, Resetn : in std_logic;
				Q : out std_logic
				);
	end component;
	
	component regn 
		generic ( N : integer:=16);
		port (R : in std_logic_vector(0 to N-1);
				clk, rst : in std_logic;
				Q : out std_logic_vector(0 to N-1)
				);
	end component;
	
	component display_counter
		port (number: in std_logic_vector(0 to 15);
				display0, display1, display2, display3: out std_logic_vector(0 to 6)
		);
	end component;
	
	signal d_temp : std_logic_vector(0 to 15) := "0000000000000000";
	signal temp : std_logic_vector(0 to 14);
	signal display_temp : std_logic_vector(0 to 15);
	
	begin
	
	ff0 : t_type_ff port map( T => SW1, Clock => KEY0, Q => d_temp(15), Resetn => SW0);
	
	temp(0) <= d_temp(15) and SW1;
	ff1 : t_type_ff port map( T => temp(0), Clock => KEY0, Q => d_temp(14), Resetn => SW0);
	
	temp(1) <= d_temp(14) and temp(0);
	ff2 : t_type_ff port map( T => temp(1), Clock => KEY0, Q => d_temp(13), Resetn => SW0);
	
	temp(2) <= d_temp(13) and temp(1);
	ff3 : t_type_ff port map( T => temp(2), Clock => KEY0, Q => d_temp(12), Resetn => SW0);
	
	temp(3) <= d_temp(12) and temp(2);
	ff4 : t_type_ff port map( T => temp(3), Clock => KEY0, Q => d_temp(11), Resetn => SW0);
	
	temp(4) <= d_temp(11) and temp(3);
	ff5 : t_type_ff port map( T => temp(4), Clock => KEY0, Q => d_temp(10), Resetn => SW0);
	
	temp(5) <= d_temp(10) and temp(4);
	ff6 : t_type_ff port map( T => temp(5), Clock => KEY0, Q => d_temp(9), Resetn => SW0);
	
	temp(6) <= d_temp(9) and temp(5);
	ff7 : t_type_ff port map( T => temp(6), Clock => KEY0, Q => d_temp(8), Resetn => SW0);
	
	temp(7) <= d_temp(8) and temp(6);
	ff8 : t_type_ff port map( T => temp(7), Clock => KEY0, Q => d_temp(7), Resetn => SW0);
	
	temp(8) <= d_temp(7) and temp(7);
	ff9 : t_type_ff port map( T => temp(8), Clock => KEY0, Q => d_temp(6), Resetn => SW0);
	
	temp(9) <= d_temp(6) and temp(8);
	ff10 : t_type_ff port map( T => temp(9), Clock => KEY0, Q => d_temp(5), Resetn => SW0);
	
	temp(10) <= d_temp(5) and temp(9);
	ff11 : t_type_ff port map( T => temp(10), Clock => KEY0, Q => d_temp(4), Resetn => SW0);
	
	temp(11) <= d_temp(4) and temp(10);
	ff12 : t_type_ff port map( T => temp(11), Clock => KEY0, Q => d_temp(3), Resetn => SW0);
	
	temp(12) <= d_temp(3) and temp(11);
	ff13 : t_type_ff port map( T => temp(12), Clock => KEY0, Q => d_temp(2), Resetn => SW0);
	
	temp(13) <= d_temp(2) and temp(12);
	ff14 : t_type_ff port map( T => temp(13), Clock => KEY0, Q => d_temp(1), Resetn => SW0);
	
	temp(14) <= d_temp(1) and temp(13);
	ff15 : t_type_ff port map( T => temp(14), Clock => KEY0, Q => d_temp(0), Resetn => SW0); 	
	
	Q <= d_temp;
	
	regn0 : regn port map (R => d_temp, clk => KEY0, rst => SW0, Q => display_temp);
	
	display0 : display_counter port map (number => display_temp, display0 => HEX0, display1 => HEX1, display2 => HEX2, display3 => HEX3);
	
end behavior;	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	