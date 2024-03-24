library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity converter is
    Port (
        SW : in unsigned(3 downto 0);  
        m : out std_logic_vector(3 downto 0);  
        z : out std_logic  
    );
end converter;

architecture Behavioral of converter is
begin
    process(SW)
    begin
        if to_integer(SW) > 9 then
            z <= '1';  
            case SW is
                when "1010" => m <= "0000";  -- m = 0
                when "1011" => m <= "0001";  -- m = 1
                when "1100" => m <= "0010";  -- m = 2
                when "1101" => m <= "0011";  -- m = 3
                when "1110" => m <= "0100";  -- m = 4
                when "1111" => m <= "0101";  -- m = 5
					 when others => m <= "1111";
            end case;
        else
            z <= '0'; 
            m <= std_logic_vector(SW);  
        end if;
    end process;
end Behavioral;
