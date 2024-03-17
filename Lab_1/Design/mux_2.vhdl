LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_2 IS
	PORT ( 
	SW: IN STD_LOGIC_VECTOR(8 downto 0);
	LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END mux_2;


ARCHITECTURE behavior OF mux_2 IS
BEGIN
    PROCESS(SW)
    BEGIN
        IF SW(8) = '0' THEN
            LEDR <= SW(3 downto 0);
        ELSE
            LEDR <= SW(7 downto 4);
        END IF;
    END PROCESS;
END behavior;
