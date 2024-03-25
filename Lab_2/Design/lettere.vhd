library ieee;
use ieee.std_logic_1164.all;

entity lettere is
	port (SW: IN std_logic_vector(2 downto 0);
			HEX0: OUT std_logic_vector(0 to 6)
			);
end entity lettere;

architecture behavior of lettere is
	begin 
		process(Sw)
		begin
			if SW(2 downto 0) = "000" then
				HEX0 <= "1001000";
			elsif SW(2 downto 0) = "001" then
				HEX0 <= "0110000";
			elsif SW(2 downto 0) = "010" then
				HEX0 <= "1110001";
			elsif SW(2 downto 0) = "011" then
				HEX0 <= "0000001";
			else
				HEX0 <= "1111111";
			end if;
		end process;
end behavior;
			
				
