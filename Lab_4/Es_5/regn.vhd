LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY regn IS
	GENERIC ( N : integer:=5);
	PORT (R : IN std_logic_vector(0 to N-1);
	clk, rst, start_j,stop: IN STD_LOGIC;
	Q : OUT std_logic_vector(0 to N-1));
END regn;

ARCHITECTURE Behavior OF regn IS
signal last: std_logic_vector(0 to 4):="00000";
BEGIN
	PROCESS (clk, rst, start_j)
	BEGIN
		IF (rst = '1') THEN
			Q <= (OTHERS => '0');
		ELSIF (clk'EVENT AND clk = '1') THEN
			if start_j='1' then
				if stop ='0' then 
					Q<=R;
				else
					last<=R;
					Q <= last;
				end if;
			 else
				Q <= (OTHERS=> '0');
			end if;
		END IF;
	END process;
end behavior;