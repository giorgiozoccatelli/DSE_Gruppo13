LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder IS
	PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4: OUT STD_LOGIC_VECTOR(6 downto 0));
END decoder;

ARCHITECTURE Behavior OF decoder IS
	begin
	process(input)
		begin
			if input = "000001010010011" then --Configurazione "HELLO"
				HEX0(6 downto 0) <= "1000000"; --O
				HEX1(6 downto 0) <= "1000111"; --L
				HEX2(6 downto 0) <= "1000111"; --L
				HEX3(6 downto 0) <= "0000110"; --E
				HEX4(6 downto 0) <= "0001001"; --H
			elsif input = "001010010011000" then --Configurazione "ELLOH"
				HEX0(6 downto 0) <= "0001001";
				HEX1(6 downto 0) <= "1000000";
				HEX2(6 downto 0) <= "1000111";
				HEX3(6 downto 0) <= "1000111";
				HEX4(6 downto 0) <= "0000110";
			elsif input = "010010011000001" then --Configurazione "LLOHE"
				HEX0(6 downto 0) <= "0000110";
				HEX1(6 downto 0) <= "0001001";
				HEX2(6 downto 0) <= "1000000";
				HEX3(6 downto 0) <= "1000111";
				HEX4(6 downto 0) <= "1000111";
			elsif input = "010011000001010" then --Configurazione "LOHEL"
				HEX0(6 downto 0) <= "1000111";
				HEX1(6 downto 0) <= "0000110";
				HEX2(6 downto 0) <= "0001001";
				HEX3(6 downto 0) <= "1000000";	
				HEX0(6 downto 0) <= "1000111";		
			elsif input = "011000001010010" then --Configurazione "OHELL"
				HEX0(6 downto 0) <= "1000111"; 
				HEX1(6 downto 0) <= "1000111"; 
				HEX2(6 downto 0) <= "0000110"; 
				HEX3(6 downto 0) <= "0001001";	
				HEX4(6 downto 0) <= "1000000";		
		end if;		
	end process;
END Behavior;