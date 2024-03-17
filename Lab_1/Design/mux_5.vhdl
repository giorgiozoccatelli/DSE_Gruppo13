LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_5 IS
    PORT ( 
		  SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
        LEDR: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END ENTITY mux_5;

ARCHITECTURE behavior OF mux_5 IS
BEGIN
    PROCESS (SW)
    BEGIN
		IF SW(8 DOWNTO 6) = "011" THEN
			LEDR <= SW(2 DOWNTO 0);
		ELSIF SW(8 DOWNTO 6) = "100" THEN
			LEDR <= SW(5 DOWNTO 3);
		ELSIF SW(8 DOWNTO 6) = "101" THEN
			LEDR <= SW(5 DOWNTO 3);
		ELSIF SW(8 DOWNTO 6) = "110" THEN
			LEDR <= SW(5 DOWNTO 3);
		ELSIF SW(8 DOWNTO 6) = "111" THEN
			LEDR <= SW(5 DOWNTO 3);
		ELSIF SW(8 DOWNTO 6) = "000" THEN
			LEDR <= "101";
		ELSIF SW(8 DOWNTO 6) = "001" THEN
			LEDR <= "010";
		ELSIF SW(8 DOWNTO 6) = "010" THEN
			LEDR <= "111";	
		END IF;
    END PROCESS;
END behavior;
