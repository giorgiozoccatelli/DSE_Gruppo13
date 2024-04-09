LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multiplier_tb is
end ENTITY multiplier_tb;

ARCHITECTURE Behavior of multiplier_tb is
	COMPONENT multiplier 
    PORT (
        SW: std_logic_vector(7 downto 0);
        HEX0, HEX1, HEX2, HEX3: out std_logic_vector (0 to 6)
    );
	END COMPONENT;

	SIGNAL x_tb, y_tb: std_logic_vector(3 downto 0);

	
	begin
		dut: multiplier PORT MAP (SW(7 downto 4)=>x_tb, SW(3 downto 0)=> y_tb);
		
	process
	begin 
	x_tb <= "0010"; -- 2x3
	y_tb <= "0011"; 
	wait for 20 ns;
	x_tb <= "0001"; -- 1x14
	y_tb <= "1110";
	wait for 20 ns;
	x_tb <= "1001"; -- 9x2
	y_tb <= "0010";
		wait;		
	end process;
end Behavior;

		
		
		