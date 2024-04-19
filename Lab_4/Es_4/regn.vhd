LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY regn IS
	GENERIC ( N : integer:=5);
	PORT (R : IN std_logic_vector(0 to N-1);
	clk, rst : IN STD_LOGIC;
	Q : OUT std_logic_vector(0 to N-1));
END regn;

ARCHITECTURE Behavior OF regn IS
BEGIN
	PROCESS (clk, rst)
	BEGIN
		IF (rst = '0') THEN
			Q <= (OTHERS => '0');
		ELSIF (clk'EVENT AND clk = '1') THEN
			Q <= R;
		END IF;
	END process;
end behavior;
