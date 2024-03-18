LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shifter IS
	PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0);
		SW: IN STD_LOGIC_VECTOR(2 downto 0);
		output : OUT STD_LOGIC_VECTOR(14 downto 0));
END shifter;

ARCHITECTURE Behavior OF shifter IS
	begin
	process(input, SW)
		begin
		if input = "000001010010011" then -- caso HELLO
			if SW(2 downto 0) = "000" then
				output <= "000001010010011"; -- caso HELLO
			elsif SW(2 downto 0) = "001" then
				output <= "001010010011000"; -- caso ELLOH
			elsif SW(2 downto 0) = "010" then
				output <= "010010011000001"; -- caso LLOHE
			elsif SW(2 downto 0) = "011" then
				output <= "010011000001010"; -- caso LOHEL
			elsif SW(2 downto 0) = "110" then
				output <= "011000001010010"; -- caso OHELL
			end if
		elsif input = "100001101101011" then --caso CEPPO
			if SW(2 downto 0) = "000" then
				output <= "100001101101011"; -- caso CEPPO
			elsif SW(2 downto 0) = "001" then
				output <= "001101101011100"; -- caso EPPOC
			elsif SW(2 downto 0) = "010" then
				output <= "101101011100001"; -- caso PPOCE
			elsif SW(2 downto 0) = "011" then
				output <= "101011100001101"; -- caso POCEP
			elsif SW(2 downto 0) = "110" then
				output <= "011100001101101"; -- caso OCEPP
			end if
			
	end process;
END Behavior;