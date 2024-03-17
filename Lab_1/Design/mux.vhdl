library ieee;
use ieee.std_logic_1164.all;

entity mux is 
	generic (
		tpd : time := 2 ns);
		
	port ( a, b: in std_logic;
			    s: in std_logic;
				 y: out std_logic);

end entity mux;

architecture behavior of mux is
begin 

process (a,b,s) is
	begin

		if (s = '0') then 
			y <= a after tpd;
		else 
			y <= b after tpd;
		end if;
		
	end process;
		
end architecture behavior;
