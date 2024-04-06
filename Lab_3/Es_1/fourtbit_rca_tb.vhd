LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY fourbit_rca_tb is
end ENTITY fourbit_rca_tb;

ARCHITECTURE Behavior of fourbit_rca_tb is
	COMPONENT fourbit_rca 
    PORT (
        SW: IN std_logic_vector(8 DOWNTO 0); 
		  KEY0, KEY1: IN std_logic;
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT std_logic_vector(0 to 6);
		  LEDR9 : OUT std_logic
    );
END COMPONENT;

	SIGNAL SW_tb: std_logic_vector(8 DOWNTO 0);
	SIGNAL KEY0_tb, KEY1_tb: std_logic;
	
	begin
		dut: fourbit_rca PORT MAP (SW=>SW_tb, KEY0=>KEY0_tb, KEY1=>KEY1_tb);
		
	process
	begin 
		SW_tb <= "000100011"; --Caso 1: 2+3 (risultato positivo, no overflow, no carry in su LSB)
		KEY0_tb <= '0'; 
		KEY1_tb <= '0';
		wait for 20 ns;
		KEY0_tb <= '1'; -- Disattivo reset
		wait for 20 ns;
		KEY1_tb <= '1'; --Attivo clock
		wait for 20 ns;
		KEY1_tb <= '0'; --Disattivo clock
		wait for 20 ns;
		KEY0_tb <= '0'; --Attivo reset
		wait for 20 ns;
		SW_tb <= "011011100"; --Caso 2: -3-4 (risultato negativo, no overflow, no carry in su LSB)
		wait for 20 ns;
		KEY0_tb <= '1'; 
		wait for 20 ns;
		KEY1_tb <= '1'; 
		wait for 20 ns;
		KEY1_tb <= '0'; 
		wait for 20 ns;
		KEY0_tb <= '0'; 
		wait for 20 ns;
		SW_tb <= "011001100"; --Caso 3: 4+4 (risultato positio, overflow, no carry in su LSB)
		wait for 20 ns;
		KEY0_tb <= '1'; 
		wait for 20 ns;
		KEY1_tb <= '1';
		wait for 20 ns;
		KEY1_tb <= '0'; 
		wait for 20 ns;
		KEY0_tb <= '0'; 
		wait for 20 ns;
		SW_tb <= "001110110"; --Caso 4: 7+6 (risultato positio, overflow, no carry in su LSB)
		wait for 20 ns;
		KEY0_tb <= '1'; -- Disattivo reset
		wait for 20 ns;
		KEY1_tb <= '1'; --Attivo clock
		wait for 20 ns;
		KEY1_tb <= '0'; --Disattivo clock
		wait for 20 ns;
		KEY0_tb <= '0'; --Attivo reset
		wait;		
	end process;
end Behavior;

		
		
		