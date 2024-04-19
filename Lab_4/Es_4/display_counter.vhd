library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_counter is 
	Port (number: IN std_logic_vector(0 to 4);
			display: OUT std_logic_vector(0 to 6)
	);
end display_counter;

architecture behavior of display_counter is 
begin 
	process(number)
	begin
		case number is
			when "00000" => -- 0
				display <= "0000001";
			when "10000" => -- 1
				display <= "1001111";
			when "11000" => -- 2
				display <= "0010010";
			when "11100" => -- 3
				display <= "0000110";
			when "11110" => -- 4
				display <= "1001100";
			when "11111" => -- 5
				display <= "0100100";
			when "01111" => -- 6
				display <= "0100000";
			when "00111" => -- 7
				display <= "0001111";
			when "00011" => -- 8
				display <= "0000000";
			when "00001" => -- 9
				display <= "0000100";
			when others =>
				display <= (others => '1');
		end case;
	end process; 
end behavior;
