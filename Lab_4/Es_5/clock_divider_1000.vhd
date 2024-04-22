library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity Clock_Divider_1000 is
	port ( clk,reset: in std_logic;
		   clock_out_1000: out std_logic);
	end Clock_Divider_1000;
  
architecture behavior of Clock_Divider_1000 is
  
signal count: integer:=0;
begin 
process(clk,reset)
variable tmp : std_logic := '0';
begin
	if(reset='1') then
		count <= 0;
		tmp:='0';
	elsif(clk'event and clk='1') then
		count <=count+1;
	if (count = 999) then
		tmp := NOT tmp;
		count <= 0;
	end if;
	end if;
clock_out_1000 <= tmp;
end process;
end behavior;

