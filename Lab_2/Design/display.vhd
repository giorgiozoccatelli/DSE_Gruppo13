library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity display is
    Port ( m : in std_logic_vector(3 downto 0);  
           z : in std_logic;
			  HEX1, HEX0: out std_logic_vector(0 to 6)
    );
end display;

architecture behavior of display is
begin
	process(m, z)
	begin
		if z='0' then
			HEX1 <= "1111111";
			case m is
            when "0000" =>
                HEX0 <= "0000001"; -- 0 in formato 7 segmenti
            when "0001" =>
                HEX0 <= "1001111"; -- 1 in formato 7 segmenti
            when "0010" =>
                HEX0 <= "0010010"; -- 2 in formato 7 segmenti
            when "0011" =>
                HEX0 <= "0000110"; -- 3 in formato 7 segmenti
            when "0100" =>
                HEX0 <= "1001100"; -- 4 in formato 7 segmenti
            when "0101" =>
                HEX0 <= "0100100"; -- 5 in formato 7 segmenti
            when "0110" =>
                HEX0 <= "0100000"; -- 6 in formato 7 segmenti
            when "0111" =>
                HEX0 <= "0001111"; -- 7 in formato 7 segmenti
            when "1000" =>
                HEX0 <= "0000000"; -- 8 in formato 7 segmenti
            when "1001" =>
                HEX0 <= "0000100"; -- 9 in formato 7 segmenti
            when others =>
                HEX0 <= "1111111"; -- In caso di valore non valido, disattiva tutti i segmenti
			end case;
		else 
			HEX1 <= "1001111";
			case m is 
					when "0000" =>
                HEX0 <= "0000001"; -- 0 in formato 7 segmenti
            when "0001" =>
                HEX0 <= "1001111"; -- 1 in formato 7 segmenti
            when "0010" =>
                HEX0 <= "0010010"; -- 2 in formato 7 segmenti
            when "0011" =>
                HEX0 <= "0000110"; -- 3 in formato 7 segmenti
            when "0100" =>
                HEX0 <= "1001100"; -- 4 in formato 7 segmenti
            when "0101" =>
                HEX0 <= "0100100"; -- 5 in formato 7 segmenti
				when others =>
					HEX0 <= "1111111";  -- In caso di valore non valido, disattiva tutti i segmenti
			end case;
		end if;
	end process;
end behavior;