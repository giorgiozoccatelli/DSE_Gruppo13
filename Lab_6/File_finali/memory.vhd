library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity memory is
port (address: in unsigned (9 downto 0);
	 data_in: in signed (7 downto 0);
	 rwn, clk, cs: in std_logic;
	 data_out: out signed (7 downto 0));
end entity;

architecture behavior of memory is

type ram_array is array (0 to 1023) of signed (7 downto 0);
signal ram: ram_array;

begin
	process(clk) is
	begin
	if clk = '1' and clk'event then
		if cs = '1' then
			if rwn = '0' then
				ram(to_integer(address)) <= data_in;
				data_out <= (others => 'Z');
			else
				data_out <= ram(to_integer(address)); 
			end if;
		else
			data_out <= (others => 'Z');
		end if;
	end if;
	end process;
end behavior; 