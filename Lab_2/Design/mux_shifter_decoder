LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_shifter_decoder IS
	PORT ( SW : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			 HEX0,HEX1,HEX2,HEX3,HEX4 : OUT STD_LOGIC_VECTOR(6 downto 0)
			);
	END mux_shifter_decoder;
	
ARCHITECTURE Behavior OF mux_shifter_decoder IS

	component mux IS
	PORT ( SW: IN STD_LOGIC_VECTOR(1 downto 0);
  output_mux: OUT STD_LOGIC_VECTOR(14 downto 0)
	   	);
end component;

	component shifter IS
	PORT (input_shifter: IN STD_LOGIC_VECTOR(14 downto 0);
			           SW: IN STD_LOGIC_VECTOR(2 downto 0);
		  output_shifter: OUT STD_LOGIC_VECTOR(14 downto 0)
			);
end component;

	component decoder
	PORT ( input_decoder: IN STD_LOGIC_VECTOR(14 downto 0);
	HEX0, HEX1, HEX2, HEX3, HEX4 : OUT STD_LOGIC_VECTOR(0 to 6));
END COMPONENT;

SIGNAL a1,a2 : std_logic_vector (14 downto 0);

BEGIN
MUX0: mux PORT MAP (SW(1 DOWNTO 0),a1);
SHIFT0: shifter PORT MAP (a1, SW(4 downto 2),a2);
DECODER0: decoder PORT MAP (a2, HEX0, HEX1, HEX2, HEX3, HEX4);
END Behavior;
