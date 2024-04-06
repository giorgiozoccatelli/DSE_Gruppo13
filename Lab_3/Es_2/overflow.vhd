library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity  overflow is 
	port ( sum : in signed(15 downto 0);
			 decision : out std_logic
			);
end overflow;

architecture behavior of overflow 
begin
	process(sum)
	begin
	
		if (sum > 2**16-1) then
			decision <= '1';	--overflow presente => LEDR9 acceso
		else 
			decision <= '0';	--overflow assente => LEDR9 spento
		end if;
	
	end process;
	
end behavior;