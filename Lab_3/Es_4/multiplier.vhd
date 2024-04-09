library ieee;
use ieee.std_logic_1164.all;

entity multiplier is 
    port (
        x: in  std_logic_vector (3 downto 0);
        y: in  std_logic_vector (3 downto 0);
        p: out std_logic_vector (7 downto 0)
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
 
    signal B0, B1, B2:  std_logic_vector (3 downto 0);
    signal A0, A1, A2:  std_logic_vector (3 downto 0);

begin

    B0 <= (x(3) and y(1), x(2) and y(1), x(1) and y(1), x(0) and y(1));
    B1 <= (x(3) and y(2), x(2) and y(2), x(1) and y(2), x(0) and y(2));
    B2 <= (x(3) and y(3), x(2) and y(3), x(1) and y(3), x(0) and y(3));
    A0 <=  ('0', x(3) and y(0), x(2) and y(0), x(1) and y(0));

	 p(0) <= x(0) and y(0); 
	 
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
	 
end architecture behavior;