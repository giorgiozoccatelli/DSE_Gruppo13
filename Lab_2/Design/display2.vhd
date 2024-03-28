library ieee;
use ieee.std_logic_1164.all;

entity display2 is
	port(m, z : in std_logic_vector(3 downto 0);
		  HEX0, HEX1 : out std_logic_vector(0 to 6)
		  );
end display2;

architecture behavioral of display2 is
	begin 
	process(z,m)
		begin
		
		case z is
			when "0000" => --0
				HEX1 <= "1111111";
			when "0001" => --1
				HEX1 <= "1001111";
			when "0010" => --2
				HEX1 <= "0010010";
			when "0011" => --3
				HEX1 <= "0000110";
			when "0100" => --4
				HEX1 <= "1001100";
			when "0101" => --5
				HEX1 <= "0100100";
			when "0110" => --6
				HEX1 <= "0100000";
			when "0111" => --7
				HEX1 <= "0001111";
			when "1000" => --8
				HEX0 <= "0000000";
			when "1001" => --9
				HEX0 <= "0000100";
			when others =>
				HEX1 <= "1111111";
		end case;
		
		case m is 
			when "0000" => --0
				HEX0 <= "1111111";
			when "0001" => --1
				HEX0 <= "1001111";	
			when "0010" => --2
				HEX0 <= "0010010";
			when "0011" => --3
				HEX0 <= "0000110";
			when "0100" => --4
				HEX0 <= "1001100";
			when "0101" => --5
				HEX0 <= "0100100";
			when "0110" => --6
				HEX0 <= "0100000";
			when "0111" => --7
				HEX0 <= "0001111";
			when "1000" => --8
				HEX0 <= "0000000";
			when "1001" => --9
				HEX0 <= "0000100";
			when others =>
				HEX0 <= "1111111";
		end case;
		
	end process;
end behavioral;

			