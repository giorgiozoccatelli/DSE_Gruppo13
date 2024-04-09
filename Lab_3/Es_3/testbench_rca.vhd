LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity testbench_rca is 
end entity;

architecture behavior of testbench_rca is 

component top_entity is
	port ( a, b : in std_logic_vector(15 downto 0);
			 s : out std_logic_vector(15 downto 0);
			 Clk, Rst : in std_logic;
			 ovf : out std_logic
		  );
end component;

signal a_tb, b_tb: std_logic_vector(15 downto 0);
signal Rst_tb, Clk_tb: std_logic;

begin
		dut: top_entity PORT MAP (a => a_tb, b => b_tb, Rst => Rst_tb, Clk => Clk_tb);
		
	process
	begin
	
		a_tb <= "0011010101110011";	--Caso 1 (negative result, no overflow)
		b_tb <= "1100001010100010";
		Rst_tb <= '0'; 
		Clk_tb <= '0';
		wait for 20 ns;
		Rst_tb <= '1'; -- Disattivo reset 
		wait for 20 ns;
		Clk_tb <= '1'; --Attivo clock (ciclo 1)
		wait for 20 ns;
		Clk_tb <= '0'; --Disattivo clock 
		wait for 20 ns;
		Clk_tb <= '1'; --Attivo clock (ciclo 2)
		wait for 20 ns;
		Clk_tb <= '0'; --Disattivo clock
		wait for 20 ns;
		Rst_tb <= '0'; --Attivo reset
		wait for 20 ns;
		
		a_tb <= "1101010100000111";	--Caso 2: (negative result, no overflow)
		b_tb <= "1100111101111101"; 
		Rst_tb <= '0'; 
		Clk_tb <= '0';
		wait for 20 ns;
		Rst_tb <= '1'; -- Disattivo reset 
		wait for 20 ns;
		Clk_tb <= '1'; --Attivo clock (ciclo 1)
		wait for 20 ns;
		Clk_tb <= '0'; --Disattivo clock 
		wait for 20 ns;
		Clk_tb <= '1'; --Attivo clock (ciclo 2)
		wait for 20 ns;
		Clk_tb <= '0'; --Disattivo clock
		wait for 20 ns;
		Rst_tb <= '0'; --Attivo reset
		wait for 20 ns;
		
		a_tb <= "0000101000011110";	--Caso 3: (risultato positivo, no overflow)
		b_tb <= "0100010101010000"; 
		Rst_tb <= '0'; 
		Clk_tb <= '0';
		wait for 20 ns;
		Rst_tb <= '1'; -- Disattivo reset 
		wait for 20 ns;
		Clk_tb <= '1'; --Attivo clock (ciclo 1)
		wait for 20 ns;
		Clk_tb <= '0'; --Disattivo clock 
		wait for 20 ns;
		Clk_tb <= '1'; --Attivo clock (ciclo 2)
		wait for 20 ns;
		Clk_tb <= '0'; --Disattivo clock
		wait for 20 ns;
		Rst_tb <= '0'; --Attivo reset
		wait for 20 ns;
		
		a_tb <= "0111111111111111";	--Caso 3: (risultato positivo, overflow)
		b_tb <= "0100010101010000"; 
		Rst_tb <= '0'; 
		Clk_tb <= '0';
		wait for 20 ns;
		Rst_tb <= '1'; -- Disattivo reset 
		wait for 20 ns;
		Clk_tb <= '1'; --Attivo clock (ciclo 1)
		wait for 20 ns;
		Clk_tb <= '0'; --Disattivo clock 
		wait for 20 ns;
		Clk_tb <= '1'; --Attivo clock (ciclo 2)
		wait for 20 ns;
		Clk_tb <= '0'; --Disattivo clock
		wait for 20 ns;
		Rst_tb <= '0'; --Attivo reset
		wait;

	end process;
end behavior;
