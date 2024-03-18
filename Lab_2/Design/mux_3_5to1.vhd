LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_3_5to1 IS
	PORT ( SW: IN STD_LOGIC_VECTOR(1 downto 0);
			output : OUT STD_LOGIC_VECTOR(14 downto 0));
END mux_3_5to1;

ARCHITECTURE Behavior OF mux_3_5to1 IS
	begin
		process(SW)
		begin
			if SW(1 downto 0) = "00" then
				output <= "000001010010011"; -- HELLO
			elsif SW(1 downto 0) = "01" then
				output <= "100001101101011"; -- CEPPO
			elsif SW(1 downto 0) = "10" then
				output <= "100001010010011"; -- CELLO
			elsif SW(1 downto 0) = "11" then
				output <= "110001101101011"; -- FEPPO
			end if;
	end process;
END Behavior;


