LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY overflow_check IS
    PORT (
        a, b, sum: IN signed(3 DOWNTO 0); 
		  decision: OUT std_logic
    );
END overflow_check;
	
ARCHITECTURE behavior OF overflow_check IS
begin 
		decision <= (a(3) nand b(3)) and sum(3);
end behavior;
