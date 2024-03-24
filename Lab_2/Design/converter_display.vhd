LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

ENTITY converter_display IS
	PORT ( SW : IN unsigned(3 DOWNTO 0);
			 HEX0,HEX1 : OUT STD_LOGIC_VECTOR(0 to 6)
			);
	END converter_display;
	
ARCHITECTURE Behavior OF converter_display IS

component converter is
	port ( SW : in unsigned(3 downto 0);  
           m : out std_logic_vector(3 downto 0);  
           z : out std_logic 
		  );
end component;

component display is
	port ( m : in std_logic_vector(3 downto 0);  
          z : in std_logic;
			 HEX1, HEX0: out std_logic_vector(0 to 6)
			);
end component;

signal a1: std_logic_vector(3 downto 0);
signal a2: std_logic;

BEGIN
converter0: converter PORT MAP (SW,a1,a2);
display0: display PORT MAP (a1,a2,HEX0, HEX1);
END behavior;

