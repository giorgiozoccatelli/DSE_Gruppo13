library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--counter 0 to 1023 
entity counter is
	 port (clk, rst, en: in std_logic;
	 cnt: buffer unsigned (9 downto 0));
end entity;

architecture behavior of counter is
begin
	process (clk, rst)
	begin
	if rst = '0' then
		cnt <= (others => '0');
	elsif clk'event and clk = '1' then
		if en = '1' then
			cnt <= cnt + 1;
		end if;
	end if;
	end process;
end behavior; 
