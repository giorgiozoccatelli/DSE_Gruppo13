library ieee;
use ieee.std_logic_1164.all;

entity hello_fsm_tb is
end entity;

architecture behavioral of hello_fsm_tb is

	component hello_fsm is
		 port ( KEY0, CLOCK_50: in std_logic;
		 HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(6 downto 0));
	end component;
	
signal KEY0, CLOCK_50: std_logic;
signal HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: std_logic_vector(6 downto 0);

begin
test : hello_fsm port map (KEY0, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	
	process
	begin
	CLOCK_50 <= '1';
	wait for 10 ns;
	CLOCK_50 <= '0';
	wait for 10 ns;
	end process;
	
	process
	begin
	KEY0 <= '0';
	wait for 2 us;
	KEY0 <= '1';
	wait for 20 us;
	KEY0 <= '0';
	wait for 2 us;
	KEY0 <= '1';
	wait ;
	end process;

end architecture;