--16-bit synchronous counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is 
	port ( clk : in std_logic;
			 rst : in std_logic;
			 Q : out std_logic_vector(15 downto 0)
		  );
end counter;

architecture behavior of counter is

signal Q_data : unsigned(15 downto 0);
	
	begin
		
		process(clk, Q_data)
		
		begin
		
			if (rst <= '0') then
				Q_data <= (others => '0');	--from the beginning 
			elsif (clk'event and clk = '1') then
				Q_data <= Q_data + 1;
			end if;
		
		end process;
		
	Q <= std_logic_vector(Q_data);
end behavior;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	