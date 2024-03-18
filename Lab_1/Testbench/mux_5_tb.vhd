LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_5_tb IS
END mux_5_tb;

ARCHITECTURE behavior OF mux_5_tb IS
    COMPONENT mux_5
        PORT ( 
            SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
            LEDR: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
        );
    END COMPONENT;
    
    SIGNAL SW_tb : STD_LOGIC_VECTOR(8 DOWNTO 0);
    SIGNAL LEDR_tb: STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
    dut: mux_5 PORT MAP (
        SW => SW_tb,
        LEDR => LEDR_tb
    );

    PROCESS
    BEGIN
        -- Configurazione 1: SW(8 DOWNTO 6) = "011", LEDR = SW(2 DOWNTO 0)
        SW_tb <= "011111010"; -- Input corrispondente alla configurazione 1
        WAIT FOR 20 ns;
        
        -- Configurazione 2: SW(8 DOWNTO 6) = "100", LEDR = SW(5 DOWNTO 3)
        SW_tb <= "100101111"; -- Input corrispondente alla configurazione 2
        WAIT FOR 20 ns;
        
        -- Configurazione 3: SW(8 DOWNTO 6) = "101", LEDR = SW(5 DOWNTO 3)
        SW_tb <= "101001110"; -- Input corrispondente alla configurazione 3
        WAIT FOR 20 ns;
        
        -- Configurazione 4: SW(8 DOWNTO 6) = "110", LEDR = SW(5 DOWNTO 3)
        SW_tb <= "110010110"; -- Input corrispondente alla configurazione 4
        WAIT FOR 20 ns;
        
        -- Configurazione 5: SW(8 DOWNTO 6) = "111", LEDR = SW(5 DOWNTO 3)
        SW_tb <= "111011010"; -- Input corrispondente alla configurazione 5
        WAIT FOR 20 ns;
        
        -- Configurazione 6: SW(8 DOWNTO 6) = "000", LEDR = "101"
        SW_tb <= "000000101"; -- Input corrispondente alla configurazione 6
        WAIT FOR 20 ns;
        
        -- Configurazione 7: SW(8 DOWNTO 6) = "001", LEDR = "010"
        SW_tb <= "001010000"; -- Input corrispondente alla configurazione 7
        WAIT FOR 20 ns;
        
        -- Configurazione 8: SW(8 DOWNTO 6) = "010", LEDR = "111"
        SW_tb <= "010111000"; -- Input corrispondente alla configurazione 8
        WAIT FOR 20 ns;
        
        WAIT; -- Attesa indefinita
    END PROCESS;
END behavior;
