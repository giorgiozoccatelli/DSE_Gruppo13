 library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity  overflow is 
	port ( a, b : in signed(15 downto 0);
			 sum : in signed(15 downto 0);
			 decision : out std_logic
			);
end overflow;

architecture behavior of overflow is
begin
	
	decision <= (a(3) and b(3) and not sum(3)) or (not a(3) and not b(3) and sum(3)); --overflow check
	
end behavior;