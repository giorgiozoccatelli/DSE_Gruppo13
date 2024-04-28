library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_1to5 is
	 port (clk, rst, en: in std_logic;
			rep: out std_logic);
end entity;

architecture behavior of counter_1to5 is
begin
	process(clk)
	variable n: unsigned (2 downto 0);
	begin
		if clk'event AND clk = '1' then
			 if rst = '0' then
			 n := "000";
			 else
				if n = "101" then -- Check for count reaching 5
					n := "000";  
				else
					n := n + ("00" & en);  
				end if;
		    end if;
		end if;
		rep <= (n(0) and n(1));
	end process;
end behavior; 