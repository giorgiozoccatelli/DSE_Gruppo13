LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder IS
	PORT ( input_decoder : IN STD_LOGIC_VECTOR(14 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4: OUT STD_LOGIC_VECTOR(6 downto 0));
END decoder;

ARCHITECTURE Behavior OF decoder IS
	begin
	process(input_decoder)
		begin
			if input_decoder = "000001010010011" then --Configurazione "HELLO"
				HEX0(6 downto 0) <= "1000000"; --O
				HEX1(6 downto 0) <= "1000111"; --L
				HEX2(6 downto 0) <= "1000111"; --L
				HEX3(6 downto 0) <= "0000110"; --E
				HEX4(6 downto 0) <= "0001001"; --H
			elsif input_decoder = "001010010011000" then --Configurazione "ELLOH"
				HEX0(6 downto 0) <= "0001001";
				HEX1(6 downto 0) <= "1000000";
				HEX2(6 downto 0) <= "1000111";
				HEX3(6 downto 0) <= "1000111";
				HEX4(6 downto 0) <= "0000110";
			elsif input_decoder = "010010011000001" then --Configurazione "LLOHE"
				HEX0(6 downto 0) <= "0000110";
				HEX1(6 downto 0) <= "0001001";
				HEX2(6 downto 0) <= "1000000";
				HEX3(6 downto 0) <= "1000111";
				HEX4(6 downto 0) <= "1000111";
			elsif input_decoder = "010011000001010" then --Configurazione "LOHEL"
				HEX0(6 downto 0) <= "1000111";
				HEX1(6 downto 0) <= "0000110";
				HEX2(6 downto 0) <= "0001001";
				HEX3(6 downto 0) <= "1000000";	
				HEX4(6 downto 0) <= "1000111";		
			elsif input_decoder = "011000001010010" then --Configurazione "OHELL"
				HEX0(6 downto 0) <= "1000111"; 
				HEX1(6 downto 0) <= "1000111"; 
				HEX2(6 downto 0) <= "0000110"; 
				HEX3(6 downto 0) <= "0001001";	
				HEX4(6 downto 0) <= "1000000";
			elsif input_decoder = "100001101101011" then --Configurazione "CEPPO"
				HEX0(6 downto 0) <= "1000000";
				HEX1(6 downto 0) <= "0001100";
				HEX2(6 downto 0) <= "0001100";
				HEX3(6 downto 0) <= "0000110";
				HEX4(6 downto 0) <= "1000110";
			elsif input_decoder = "001101101011100" then --Confirugazione "EPPOC"
				HEX0(6 downto 0) <= "1000110";	
				HEX1(6 downto 0) <= "1000000";
				HEX2(6 downto 0) <= "0001100";
				HEX3(6 downto 0) <= "0001100";
				HEX4(6 downto 0) <= "0000110";
			elsif input_decoder = "101101011100001" then --Configurazione "PPOCE"
				HEX0(6 downto 0) <= "0000110";
				HEX1(6 downto 0) <= "1000110";	
				HEX2(6 downto 0) <= "1000000";
				HEX3(6 downto 0) <= "0001100";
				HEX4(6 downto 0) <= "0001100";
			elsif input_decoder = "101011100001101" then --Configurazione "POCEP"
				HEX0(6 downto 0) <= "0001100";
				HEX1(6 downto 0) <= "0000110";
				HEX2(6 downto 0) <= "1000110";	
				HEX3(6 downto 0) <= "1000000";
				HEX4(6 downto 0) <= "0001100";
			elsif input_decoder = "011100001101101" then --Configurazione "OCEPP"
				HEX0(6 downto 0) <= "0001100";
				HEX1(6 downto 0) <= "0001100";
				HEX2(6 downto 0) <= "0000110";
				HEX3(6 downto 0) <= "1000110";	
				HEX4(6 downto 0) <= "1000000";
			elsif input_decoder = "100001010010011" then --Configurazione "CELLO"
				HEX0(6 downto 0) <= "1000000";
				HEX1(6 downto 0) <= "1000111";
				HEX2(6 downto 0) <= "1000111";
				HEX3(6 downto 0) <= "0000110";	
				HEX4(6 downto 0) <= "1000110";
			elsif input_decoder = "001010010011100" then --Configurazione "ELLOC"
				HEX0(6 downto 0) <= "1000110";	
				HEX1(6 downto 0) <= "1000000";
				HEX2(6 downto 0) <= "1000111";
				HEX3(6 downto 0) <= "1000111";
				HEX4(6 downto 0) <= "0000110";	
			elsif input_decoder = "010010011100001" then --Configurazione "LLOCE"
				HEX0(6 downto 0) <= "0000110";
				HEX1(6 downto 0) <= "1000110";	
				HEX2(6 downto 0) <= "1000000";
				HEX3(6 downto 0) <= "1000111";
				HEX4(6 downto 0) <= "1000111";
			elsif input_decoder = "010011100001010" then --Configurazione "LOCEL"
				HEX0(6 downto 0) <= "1000111";
				HEX1(6 downto 0) <= "0000110";
				HEX2(6 downto 0) <= "1000110";	
				HEX3(6 downto 0) <= "1000000";
				HEX4(6 downto 0) <= "1000111";
			elsif input_decoder = "011100001010010" then --Configurazione "OCELL"
				HEX0(6 downto 0) <= "1000111";
				HEX1(6 downto 0) <= "1000111";
				HEX2(6 downto 0) <= "0000110";
				HEX3(6 downto 0) <= "1000110";	
				HEX4(6 downto 0) <= "1000000";
			elsif input_decoder = "110001101101011" then --Configurazione "FEPPO"
				HEX0(6 downto 0) <= "1000000";
				HEX1(6 downto 0) <= "0001100";
				HEX2(6 downto 0) <= "0001100";
				HEX3(6 downto 0) <= "0000110";
				HEX4(6 downto 0) <= "0001110";
			elsif input_decoder = "001101101011110" then --Configurazione "EPPOF"
				HEX0(6 downto 0) <= "0001110";
				HEX1(6 downto 0) <= "1000000";
				HEX2(6 downto 0) <= "0001100";
				HEX3(6 downto 0) <= "0001100";
				HEX4(6 downto 0) <= "0000110";
			elsif input_decoder = "101101011110001" then --Configurazione "PPOFE"
				HEX0(6 downto 0) <= "0000110";	
				HEX1(6 downto 0) <= "0001110";
				HEX2(6 downto 0) <= "1000000";
				HEX3(6 downto 0) <= "0001100";
				HEX4(6 downto 0) <= "0001100";
			elsif input_decoder = "101011110001101" then --Configurazione "POFEP"
				HEX0(6 downto 0) <= "0001100";				
				HEX1(6 downto 0) <= "0000110";	
				HEX2(6 downto 0) <= "0001110";
				HEX3(6 downto 0) <= "1000000";
				HEX4(6 downto 0) <= "0001100";				
			elsif input_decoder = "011110001101101" then --Configurazione "OFEPP"
				HEX0(6 downto 0) <= "0001100";
				HEX1(6 downto 0) <= "0001100";				
				HEX2(6 downto 0) <= "0000110";	
				HEX3(6 downto 0) <= "0001110";
				HEX4(6 downto 0) <= "1000000";
			else --Configurazioni proibite
				HEX0(6 downto 0) <= "0000000";
				HEX1(6 downto 0) <= "0000000";				
				HEX2(6 downto 0) <= "0000000";	
				HEX3(6 downto 0) <= "0000000";
				HEX4(6 downto 0) <= "0000000";
		end if;		
	end process;
END Behavior;
