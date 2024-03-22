LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
	PORT ( SW: IN STD_LOGIC_VECTOR(1 downto 0);
			output_mux : OUT STD_LOGIC_VECTOR(14 downto 0));
END mux;

ARCHITECTURE Behavior OF mux IS
	begin
		process(SW)
		begin
			if SW(1 downto 0) = "00" then
				output_mux <= "000001010010011"; -- HELLO
			elsif SW(1 downto 0) = "01" then
				output_mux <= "100001101101011"; -- CEPPO
			elsif SW(1 downto 0) = "10" then
				output_mux <= "100001010010011"; -- CELLO
			elsif SW(1 downto 0) = "11" then
				output_mux <= "110001101101011"; -- FEPPO
			end if;
	end process;
END Behavior;

