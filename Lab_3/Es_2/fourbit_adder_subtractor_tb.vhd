LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY fourbit_adder_subtractor_tb is
end ENTITY fourbit_adder_subtractor_tb;

ARCHITECTURE Behavior of fourbit_adder_subtractor_tb is
	COMPONENT fourbit_adder_subtractor 
    PORT (
        SW: IN std_logic_vector(8 DOWNTO 0);
		  KEY0, KEY1: IN std_logic;
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT std_logic_vector(0 to 6);
        LEDR9 : OUT std_logic
    );
	END COMPONENT;

	SIGNAL sign: std_logic;
	SIGNAL SW_tb_a, SW_tb_b: std_logic_vector(3 downto 0);
	SIGNAL KEY0_tb, KEY1_tb: std_logic;
	
	begin
		dut: fourbit_adder_subtractor PORT MAP (SW(8) => sign, SW(7 downto 4)=>SW_tb_a, SW(3 downto 0) => SW_tb_b,
		KEY0=>KEY0_tb, KEY1=>KEY1_tb);
		
	process
	begin 
		sign <= '0';
		SW_tb_a <= "0010";
		SW_tb_b <= "0011"; --Caso 1: 2+3 (addizione, no overflow, no carry in su LSB)
		KEY0_tb <= '0'; 
		KEY1_tb <= '0';
		wait for 20 ns;
		KEY0_tb <= '1'; -- Disattivo reset
		wait for 20 ns;
		KEY1_tb <= '1'; --Attivo clock (ciclo 1)
		wait for 20 ns;
		KEY1_tb <= '0'; --Disattivo clock
		wait for 20 ns;
		KEY1_tb <= '1'; -- Attivo clock (ciclo 2)
		wait for 20 ns;
		KEY1_tb <= '0'; -- Disattivo clock
		wait for 20 ns;
		KEY0_tb <= '0'; --Attivo reset
		wait for 20 ns;
		sign <= '1';
		SW_tb_a <= "1101";
		SW_tb_b <= "1100"; --Caso 2: -3 - (-4) (sottrazione, no overflow, no carry in su LSB)
		wait for 20 ns;
		KEY0_tb <= '1'; 
		wait for 20 ns;
		KEY1_tb <= '1'; 
		wait for 20 ns;
		KEY1_tb <= '0'; 
		wait for 20 ns;
		KEY1_tb <= '1';
		wait for 20 ns;
		KEY1_tb <= '0';
		wait for 20 ns;
		KEY0_tb <= '0'; 
		wait for 20 ns;
		sign <= '1';
		SW_tb_a <= "0110";
		SW_tb_b <= "0100"; --Caso 3: 6-4 (risultato positivo, no overflow, no carry in su LSB)
		wait for 20 ns;
		KEY0_tb <= '1'; 
		wait for 20 ns;
		KEY1_tb <= '1';
		wait for 20 ns;
		KEY1_tb <= '0'; 
		wait for 20 ns;
		KEY1_tb <= '1';
		wait for 20 ns;
		KEY1_tb <= '0';
		wait for 20 ns;
		KEY0_tb <= '0'; 
		wait for 20 ns;
		sign <= '0';
		SW_tb_a <= "0111";
		SW_tb_b <= "0110"; --Caso 4: 7+6 (risultato positio, overflow, no carry in su LSB)
		wait for 20 ns;
		KEY0_tb <= '1'; 
		wait for 20 ns;
		KEY1_tb <= '1'; 
		wait for 20 ns;
		KEY1_tb <= '0'; 
		wait for 20 ns;
		KEY1_tb <= '1';
		wait for 20 ns;
		KEY1_tb <= '0';
		wait for 20 ns;
		KEY0_tb <= '0'; 
		wait;		
	end process;
end Behavior;

		
		
		