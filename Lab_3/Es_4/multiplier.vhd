library ieee;
use ieee.std_logic_1164.all;

entity multiplier is 
    port (
        SW: std_logic_vector(7 downto 0);
        HEX0, HEX1, HEX2, HEX3: out std_logic_vector (0 to 6)
    );
end entity multiplier;

architecture behavior of multiplier is
    component Ripple_Adder
        port ( 
            A:      in  std_logic_vector (3 downto 0);
            B:      in  std_logic_vector (3 downto 0);
            Cin:    in  std_logic;
            S:      out std_logic_vector (3 downto 0);
           Cout:    out std_logic
        );
    end component;
	 
	 component display_hexadecimal IS
    PORT (
        A, B: IN std_logic_vector(3 downto 0);
		  S: IN std_logic_vector(7 downto 0);
        a_out, b_out, s1_out, s2_out: OUT std_logic_vector(0 to 6)
    );
	 END component;
 
    signal B0, B1, B2:  std_logic_vector (3 downto 0);
    signal A0, A1, A2:  std_logic_vector (3 downto 0);
	 signal p: std_logic_vector(7 downto 0);

begin

    A0 <=  ('0', SW(3) and SW(4), SW(2) and SW(4), SW(1) and SW(4));
    B0 <= (SW(3) and SW(5), SW(2) and SW(5), SW(1) and SW(5), SW(0) and SW(5));
    B1 <= (SW(3) and SW(6), SW(2) and SW(6), SW(1) and SW(6), SW(0) and SW(6));
    B2 <= (SW(3) and SW(7), SW(2) and SW(7), SW(1) and SW(7), SW(0) and SW(7));

	 p(0) <= SW(0) and SW(4); 
	 
first_row: 
    Ripple_Adder 
        port map (A => B0, B => A0, cin => '0', cout => A1(3), 
		  S(3) => A1(2), S(2) => A1(1), S(1) => A1(0), S(0) => p(1));
		  
second_row: 
    Ripple_Adder 
        port map (A => B1, B => A1, cin => '0', cout => A2(3), 
		  S(3) => A2(2), S(2) => A2(1), S(1) => A2(0),S(0) => p(2));
		  
third_row: 
    Ripple_Adder 
        port map ( A => B2, B => A2, cin => '0',cout => p(7), 
		  S => p(6 downto 3));
		  
display0:
	display_hexadecimal port map(A => SW(3 downto 0), B => SW(7 downto 4), S=>p,
							   a_out=> HEX0, b_out=>HEX1, s1_out=>HEX3, s2_out=>HEX2);
	 
end architecture behavior;