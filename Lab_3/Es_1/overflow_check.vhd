LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY overflow_check IS
    PORT (
        sum: IN signed(3 DOWNTO 0); 
		  cout: IN std_logic;
		  decision: OUT std_logic
    );
END overflow_check;
	
ARCHITECTURE behavior OF overflow_check IS
begin 
		decision <= cout xor sum(3);
end behavior;
