LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY display_hexadecimal IS
    PORT (
        a_in, b_in, c_in: IN signed(3 downto 0);
        a_out, b_out, c_out, sign_a, sign_b, sign_c: OUT std_logic_vector(0 to 6)
    );
END display_hexadecimal;

ARCHITECTURE behavior OF display_hexadecimal IS
BEGIN
	process(a_in, b_in, c_in)
	begin 
		if (a_in >= 0) then -- Decisione sul segno a
			sign_a <= "1111111";
		else 
			sign_a <= "1111110";
		end if;
	
		if (b_in >= 0) then -- Decisione sul segno b
			sign_b <= "1111111";
		else 
			sign_b <= "1111110";
		end if;
		
		if (c_in >= 0) then -- Decisione sul segno c
			sign_c <= "1111111";
		else 
			sign_c <= "1111110";
		end if;

		case a_in is
			when "0000" => -- 0
				a_out <= "0000001";
			when "0001" => -- 1
				a_out <= "1001111";
			when "0010" => -- 2
				a_out <= "0010010";
			when "0011" => -- 3
				a_out <= "0000110";
			when "0100" => -- 4
				a_out <= "1001100";
			when "0101" => -- 5
				a_out <= "0100100";
			when "0110" => -- 6
				a_out <= "0100000";
			when "0111" => -- 7
				a_out <= "0001111";
			when "1000" => -- -8
				a_out <= "0000000";
			when "1001" => -- -7
				a_out <= "0001111";
			when "1010" => -- -6
				a_out <= "0001111";
			when "1011" => -- -5
				a_out <= "0100100";
			when "1100" => -- -4
				a_out <= "1001100";
			when "1101" => -- -3
				a_out <= "0000110";
			when "1110" => -- -2
				a_out <= "0010010";
			when "1111" => -- -1
				a_out <= "1001111";
			when others =>
				a_out <= "1111111";
		end case;
		
		case b_in is
			when "0000" => -- 0
				b_out <= "0000001";
			when "0001" => -- 1
				b_out <= "1001111";
			when "0010" => -- 2
				b_out <= "0010010";
			when "0011" => -- 3
				b_out <= "0000110";
			when "0100" => -- 4
				b_out <= "1001100";
			when "0101" => -- 5
				b_out <= "0100100";
			when "0110" => -- 6
				b_out <= "0100000";
			when "0111" => -- 7
				b_out <= "0001111";
			when "1000" => -- -8
				b_out <= "0000000";
			when "1001" => -- -7
				b_out <= "0001111";
			when "1010" => -- -6
				b_out <= "0001111";
			when "1011" => -- -5
				b_out <= "0100100";
			when "1100" => -- -4
				b_out <= "1001100";
			when "1101" => -- -3
				b_out <= "0000110";
			when "1110" => -- -2
				b_out <= "0010010";
			when "1111" => -- -1
				b_out <= "1001111";
			when others =>
				b_out <= "1111111";
		end case;
		
		if (c_in >= -8) and (c_in <= 7) then
		case c_in is
				when "0000" => -- 0
					c_out <= "0000001";
				when "0001" => -- 1
					c_out <= "1001111";
				when "0010" => -- 2
					c_out <= "0010010";
				when "0011" => -- 3
					c_out <= "0000110";
				when "0100" => -- 4
					c_out <= "1001100";
				when "0101" => -- 5
					c_out <= "0100100";
				when "0110" => -- 6
					c_out <= "0100000";
				when "0111" => -- 7
					c_out <= "0001111";
				when "1000" => -- -8
					c_out <= "0000000";
				when "1001" => -- -7
					c_out <= "0001111";
				when "1010" => -- -6
					c_out <= "0001111";
				when "1011" => -- -5
					c_out <= "0100100";
				when "1100" => -- -4
					c_out <= "1001100";
				when "1101" => -- -3
					c_out <= "0000110";
				when "1110" => -- -2
					c_out <= "0010010";
				when "1111" => -- -1
					c_out <= "1001111";
				when others =>
					c_out <= "1111111";
			end case;
		else 
			case c_in is
				when "1000" => -- 8
					c_out <= "0000000"; 
				when "1001" => -- 9
					c_out <= "0000100";
				when "1010" => -- 10 (A)
					c_out <= "0001000";
				when "1011" => -- 11 (B)
					c_out <= "0000000";
				when "1100" => -- 12 (C)
					c_out <= "0110001";
				when "1101" => -- 13 (D)
					c_out <= "0000001";
				when "1111" => -- 14 (E)
					c_out <= "0110000";
				when others =>
					c_out <= "1111111";
			end case;
		end if;
	end process;
END behavior;