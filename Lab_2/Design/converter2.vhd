library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter2 is
	port (SW : in unsigned(5 downto 0);
			 m : out std_logic_vector(3 downto 0);
          z : out std_logic_vector(3 downto 0)
         );
end converter2;

architecture behavior of converter2 is
begin
process(SW)
    begin
		
		case to_integer(SW) is
			when 0 to 9 =>
				z <= "0000";
				m <= std_logic_vector(to_unsigned(to_integer(SW), 4));	-- m is std_logic_vector(3 downto 0), therefore a cast is needed in a way that the final dimension of m results to be 4
			when 10 to 19 =>
				z <= "0001";
				m <= std_logic_vector(to_unsigned(to_integer(SW) - 10, 4));
			when 20 to 29 =>
				z <= "0010";
				m <= std_logic_vector(to_unsigned(to_integer(SW) - 20, 4));	
			when 30 to 39 =>
				z <= "0011";
				m <= std_logic_vector(to_unsigned(to_integer(SW) - 30, 4));	
			when 40 to 49 =>
				z <= "0100";
				m <= std_logic_vector(to_unsigned(to_integer(SW) - 40, 4));
			when 50 to 59 =>
				z <= "0101";
				m <= std_logic_vector(to_unsigned(to_integer(SW) - 50, 4));
			when 60 to 63 =>
				z <= "0110";
				m <= std_logic_vector(to_unsigned(to_integer(SW) - 60, 4));
			when others =>
				z <= "1111";
		end case;

   end process;
end behavior;	
		