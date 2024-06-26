LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_2_tb IS
END mux_2_tb;

ARCHITECTURE behavior OF mux_2_tb IS
    COMPONENT mux_2
        PORT ( 
            SW: IN STD_LOGIC_VECTOR(8 downto 0);
            LEDR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL SW_tb : STD_LOGIC_VECTOR(8 downto 0);
    SIGNAL LEDR_tb: STD_LOGIC_VECTOR(3 DOWNTO 0);
	 

BEGIN
    dut: mux_2 PORT MAP (
        SW => SW_tb,
        LEDR => LEDR_tb
    );

	PROCESS
   BEGIN
			-- Configurazione 1: SW(8) = '0', SW(7 downto 4) = "1010", SW(3 downto 0) = "1111"
			SW_tb <= "010101111";
			WAIT FOR 10 ns;

			-- Configurazione 2: SW(8) = '1', SW(7 downto 4) = "1010", SW(3 downto 0) = "1111"
			SW_tb <= "110101111";
			WAIT FOR 10 ns;

			-- Configurazione 3: SW(8) = '1', SW(7 downto 4) = "0011", SW(3 downto 0) = "0101"
			SW_tb <= "100110101";
			WAIT FOR 10 ns;
        WAIT;
	END PROCESS;
END behavior;
