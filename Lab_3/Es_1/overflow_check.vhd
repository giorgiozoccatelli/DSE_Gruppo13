LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY overflow_check IS
    PORT (
        sum: IN signed(3 DOWNTO 0); 
		  decision: OUT std_logic
    );
END overflow_check;
	
ARCHITECTURE behavior OF overflow_check IS
begin 
	process(sum)
	begin
		if (sum >= 8) then
			decision <= '1';
		else
			decision <= '0';
		end if;
	end process;
end behavior;
