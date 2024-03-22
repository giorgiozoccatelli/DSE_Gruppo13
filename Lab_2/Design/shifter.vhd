LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shifter IS
	PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0);
		SW: IN STD_LOGIC_VECTOR(4 downto 2);
		output : OUT STD_LOGIC_VECTOR(14 downto 0));
END shifter;

ARCHITECTURE Behavior OF shifter IS
	begin
	process(input, SW)
		begin
		if input = "000001010010011" then -- 1° caso HELLO
			if SW(4 downto 2) = "000" then
				output <= "000001010010011"; -- caso HELLO
			elsif SW(4 downto 2) = "001" then
				output <= "001010010011000"; -- caso ELLOH
			elsif SW(4 downto 2) = "010" then
				output <= "010010011000001"; -- caso LLOHE
			elsif SW(4 downto 2) = "011" then
				output <= "010011000001010"; -- caso LOHEL
			elsif SW(4 downto 2) = "110" then
				output <= "011000001010010"; -- caso OHELL
			end if;
		elsif input = "100001101101011" then --2° caso CEPPO
			if SW(4 downto 2) = "000" then
				output <= "100001101101011"; -- caso CEPPO
			elsif SW(4 downto 2) = "001" then
				output <= "001101101011100"; -- caso EPPOC
			elsif SW(4 downto 2) = "010" then
				output <= "101101011100001"; -- caso PPOCE
			elsif SW(4 downto 2) = "011" then
				output <= "101011100001101"; -- caso POCEP
			elsif SW(4 downto 2) = "110" then
				output <= "011100001101101"; -- caso OCEPP
			end if;
		elsif input = "100001010010011" then --3° caso CELLO
			if SW(4 downto 2) = "000" then
				output <= "100001010010011"; -- caso CELLO
			elsif SW(4 downto 2) = "001" then
				output <= "001010010011100"; -- caso ELLOC
			elsif SW(4 downto 2) = "010" then
				output <= "010010011100001"; -- caso LLOCE
			elsif SW(4 downto 2) = "011" then
				output <= "010011100001010"; -- caso LOCEL
			elsif SW(4 downto 2) = "110" then
				output <= "011100001010010"; -- caso OCELL
			end if;
		elsif input = "110001101101011" then --caso FEPPO
			if SW(4 downto 2) = "000" then
				output <= "110001101101011"; -- 4° caso FEPPO
			elsif SW(4 downto 2) = "001" then
				output <= "001101101011110"; -- caso EPPOF
			elsif SW(4 downto 2) = "010" then
				output <= "101101011110001"; -- caso PPOFE
			elsif SW(4 downto 2) = "011" then
				output <= "101011110001101"; -- caso POFEP
			elsif SW(4 downto 2) = "110" then
				output <= "011110001101101"; -- caso OFEPP
			end if;
		end if;
	end process;
END Behavior;
