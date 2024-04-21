library ieee;
use ieee.std_logic_1164.all;

entity display_counter is 
	port (number: in std_logic_vector(0 to 15);
			display0, display1, display2, display3: out std_logic_vector(0 to 6)
	);
end display_counter;

architecture behavior of display_counter is 
begin 
	process(number)
	begin
		case number is
			when "0000000000000000" => --0
				display0 <= "0000001"; 
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000000001" =>	--1
				display0 <= "1001111"; 
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000000010" => --2
				display0 <= "0010010";
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000000011" =>	--3
				display0 <= "0000110";
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000000100" => --4
				display0 <= "1001100";
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000000101" =>	--5
				display0 <= "0100100";
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000000110" => --6
				display0 <= "0100000";
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000000111" =>	--7
				display0 <= "0001111";
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000001000" => --8
				display0 <= "0000000";
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000001001" =>	--9
				display0 <= "0000100";
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000001010" => --10
				display0 <= "0001000"; --A
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000001011" => --11
				display0 <= "0000000"; --B
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000001100" =>	--12
				display0 <= "0110001"; --C
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000001101" => --13
				display0 <= "0000001"; --D
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000001110" =>	--14
				display0 <= "0110000"; --E
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when "0000000000001111" => --15
				display0 <= "0111000";--F
				display1 <= "1111111";
				display2 <= "1111111";
				display3 <= "1111111";
			when others =>
				display0 <= (others => '1'); --the counter should increment itself and display the value of both HEX0 and HEX1 after number "15"
				display1 <= (others => '1');
				display2 <= (others => '1');
				display3 <= (others => '1');
			end case;
			
	end process;
end behavior;	