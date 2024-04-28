library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regn is
	port ( clk, en, rst: in std_logic;
			d : in std_logic_vector (6 downto 0);
			q0, q1, q2, q3, q4: buffer std_logic_vector (6 downto 0);
			q5 : out std_logic_vector (6 downto 0));
end entity;

architecture behavior of regn is
begin
	process(clk)
	begin
		if clk'event and clk ='1' then
			 if rst = '0' then
				 q0 <= ( others => '1'); 
				 q1 <= ( others => '1');
				 q2 <= ( others => '1'); 
				 q3 <= ( others => '1');
				 q4 <= ( others => '1'); 
				 q5 <= ( others => '1');
			 elsif en = '1' then
				 q0 <= d; 
				 q1 <= q0; 
				 q2 <= q1; 
				 q3 <= q2;
				 q4 <= q3; 
				 q5 <= q4; 
			 end if;
		end if;
	end process;
end behavior;