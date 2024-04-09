LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY display_hexadecimal IS
    PORT (
        a, b: IN std_logic_vector(3 downto 0);
		  s: IN std_logic_vector(7 downto 0);
        a_out, b_out, s1_out, s2_out: OUT std_logic_vector(0 to 6)
    );
END display_hexadecimal;

ARCHITECTURE behavior OF display_hexadecimal IS
BEGIN
	process(a, b, s)
	begin 

		case a is
			when "1000" => -- 8
				a_out <= "0000000"; 
			when "1001" => -- 9
				a_out <= "0000100";
			when "1010" => -- 10 (A)
				a_out <= "0001000";
			when "1011" => -- 11 (B)
				a_out <= "0000000";
			when "1100" => -- 12 (C)
				a_out <= "0110001";
			when "1101" => -- 13 (D)
				a_out <= "0000001";
			when "1110" => -- 14 (E)
				a_out <= "0110000";
			when "1111" => -- 15 (F)
				a_out <= "0111000";
			when "0111" => -- 7;
				a_out <= "0001111";
			when "0110" => -- 6
				a_out <= "0100000";
			when "0101" => -- 5
				a_out <= "0100100";
			when "0100" => -- 4
				a_out <= "1001100";
			when "0011" => -- 3
				a_out <= "0000110";
			when "0010" => -- 2
				a_out <= "0010010";
			when "0001" => -- 1
				a_out <= "1001111";
			when "0000" => -- 0
				a_out <= "0000001";
			when others =>
				a_out <= (others => '1');
		end case;
		
		case b is
			when "1000" => -- 8
				b_out <= "0000000"; 
			when "1001" => -- 9
				b_out <= "0000100";
			when "1010" => -- 10 (A)
				b_out <= "0001000";
			when "1011" => -- 11 (B)
				b_out <= "0000000";
			when "1100" => -- 12 (C)
				b_out <= "0110001";
			when "1101" => -- 13 (D)
				b_out <= "0000001";
			when "1110" => -- 14 (E)
				b_out <= "0110000";
			when "1111" => -- 15 (F)
				b_out <= "0111000";
			when "0111" => -- 7;
				b_out <= "0001111";
			when "0110" => -- 6
				b_out <= "0100000";
			when "0101" => -- 5
				b_out <= "0100100";
			when "0100" => -- 4
				b_out <= "1001100";
			when "0011" => -- 3
				b_out <= "0000110";
			when "0010" => -- 2
				b_out <= "0010010";
			when "0001" => -- 1
				b_out <= "1001111";
			when "0000" => -- 0
				b_out <= "0000001";
			when others =>
				b_out <= (others => '1');
		end case;
			
		
		case s is
			when "00000000" => -- 0
				s1_out <= "0000001"; 
				s2_out <= "0000001";
			when "00000001" => -- 1
				s1_out <= "0000001";
				s2_out <= "1001111";
			when "00000010" => -- 2
				s1_out <= "0000001";
				s2_out <= "0010010";
			when "00000011" => -- 3
				s1_out <= "0000001";
				s2_out <= "0000110";
			when "00000100" => -- 4
				s1_out <= "0000001";
				s2_out <= "1001100";
			when "00000101" => -- 5
				s1_out <= "0000001";
				s2_out <= "0100100";
			when "00000110" => -- 6
				s1_out <= "0000001";
				s2_out <= "0100000";
			when "00000111" => -- 7
				s1_out <= "0000001";
				s2_out <= "0001111";
			when "00001000" => -- 8
				s1_out <= "0000001";
				s2_out <= "0000000";
			when "00001001" => -- 9
				s1_out <= "0000001";
				s2_out <= "0000100";
			when "00001010" => -- 10
				s1_out <= "1001111";
				s2_out <= "0000001";
			when "00001011" => -- 11
				s1_out <= "1001111";
				s2_out <= "1001111";
			when "00001100" => -- 12
				s1_out <= "1001111";
				s2_out <= "0010010";
			when "00001101" => -- 13
				s1_out <= "1001111";
				s2_out <= "0000110";
			when "00001110" => -- 14
				s1_out <= "1001111";
				s2_out <= "1001100";
			when "00001111" => -- 15
				s1_out <= "1001111";
				s2_out <= "0100100";
			when "00010000" => -- 16
				s1_out <= "1001111";
				s2_out <= "0100000";
			when "00010001" => -- 17
				s1_out <= "1001111";
				s2_out <= "0001111";
			when "00010010" => -- 18
				s1_out <= "1001111";
				s2_out <= "0000000";
			when "00010011" => -- 19
				s1_out <= "1001111";
				s2_out <= "0000100";
			when "00010100" => -- 20
				s1_out <= "1001111";
				s2_out <= "0000001";
			when others =>
				s1_out <= (others => '1');
				s2_out <= (others => '1');
		end case;
	end process;
END behavior;