library IEEE;
use IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.all;


entity delay_converter is
  port (
    switches : in std_logic_vector(7 downto 0); 
    delay_ms : out integer range 0 to 8000 -- 8000: max delay in ms  
  );
end entity delay_converter;

architecture Behavior of delay_converter is
begin
    process(switches)
        variable temp_value : INTEGER := 0;
    begin
        for i in switches'range loop
            if switches(i) = '1' then
                temp_value := temp_value + 1000;
            end if;
        end loop;
        delay_ms <= temp_value;
    end process;
end Behavior;
