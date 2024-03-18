library ieee;
use ieee.std_logic_1164.all;

entity lab_2_1 is
	port (SW: IN std_logic_vector(2 downto 0);
			HEX0: OUT std_logic_vector(0 to 6)
			);
end entity lab_2_1;

architecture behavior of lab_2_1 is
	begin 
		process(Sw)
		begin
			if SW(2 downto 0) = "000" then
				HEX0(0) <= '1';
				HEX0(1) <= '0';
				HEX0(2) <= '0';
				HEX0(3) <= '1';
				HEX0(4) <= '0';
				HEX0(5) <= '0';
				HEX0(6) <= '0';
			elsif SW(2 downto 0) = "001" then
				HEX0(0) <= '0';
				HEX0(1 TO 2) <= "11";
				HEX0(3 TO 6) <= "0000";
			elsif SW(2 downto 0) = "010" then
				HEX0(0 to 2) <= "111";
				HEX0(3 to 5) <= "000";
				HEX0(6) <= '1';
			elsif SW(2 downto 0) = "011" then
				HEX0(0 to 5) <= "000000";
				HEX0(6) <= '1';
			else
				HEX0(0 to 6) <= "1111111";
			end if;
		end process;
end behavior;

			
				
