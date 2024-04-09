library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity  overflow is 
	port ( cout : in std_logic;
			 sum : in signed(15 downto 0);
			 decision : out std_logic
			);
end overflow;

architecture behavior of overflow is
begin
	
	decision <= cout xor sum(15); --overflow check
	
end behavior;