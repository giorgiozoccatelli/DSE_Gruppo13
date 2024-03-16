LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- "Empty" entity.
ENTITY testbench_es1 IS
END testbench_es1;

ARCHITECTURE Behavior OF testbench_es1 IS
	SIGNAL ingresso_SW: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL uscita_LEDR: STD_LOGIC_VECTOR(9 DOWNTO 0);
	COMPONENT laboratory_1
		PORT (SW: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		LEDR: OUT STD_LOGIC_VECTOR (9 DOWNTO 0));
	END COMPONENT; 


BEGIN
	my_port : laboratory_1 PORT MAP (SW => ingresso_SW, LEDR => uscita_LEDR);
	
	PROCESS
	BEGIN
		ingresso_SW(9 DOWNTO 0) <= "0101010101";
		WAIT FOR 200 ns;
		ingresso_sw(9 DOWNTO 0) <= "1010101010";
		WAIT FOR 200 ns;
		ingresso_SW(9 DOWNTO 0) <= "1111111111";
		WAIT;
	END PROCESS;
END Behavior;

