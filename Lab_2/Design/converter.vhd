library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter is
	port (SW : in unsigned(3 downto 0);
			 m : out std_logic_vector(3 downto 0);
          z : out std_logic
         );
end converter;

architecture behavior of converter is
begin
process(SW)
    begin
		
		case to_integer(SW) is
			when 0 to 9 =>
				z <= '0';
				m <= std_logic_vector(to_unsigned(to_integer(SW), 4));
			when 10 to 19 =>
				z <= '1';
				m <= std_logic_vector(to_unsigned(to_integer(SW) - 10, 4));
			when others =>
				z <= '1';
		end case;

   end process;
end behavior;	
            m <= std_logic_vector(SW);  
        end if;
    end process;
end Behavioral;

