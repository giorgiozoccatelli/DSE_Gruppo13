 library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity digital_filter_tb is
end entity;

architecture behavioral of digital_filter_tb is

component digital_filter is
	 port (clk, rst, start: in std_logic;
	 data_in: in signed (7 downto 0);
	 done: out std_logic;
	 add: buffer unsigned (9 downto 0);
	 u_sat: out signed (7 downto 0));
end component;

file file_input: text;
signal clk, rst, start: std_logic;
signal data_in: signed (7 downto 0);
signal done: std_logic;
signal add: unsigned (9 downto 0);
signal u_sat: signed (7 downto 0);
begin

test: digital_filter port map (clk => clk, rst => rst, start => start, data_in => data_in,
 done => done, add => add, u_sat => u_sat);


process
 begin
 clk <= '0';
 wait for 1 ns;
 clk <= '1';
  wait for 1 ns;
end process;
process

 variable v_iline, v_oline: line;
 variable v_data_in, v_u_sat: std_logic_vector (7std_logic_vector downto 0);

 begin

 file_open (file_input, "file_input.txt", read_mode);
 rst <= '0';
 wait for 2 ns;
 start <= '1';
 rst <= '1';
 wait for 2 ns;
 while not endfile (file_input) loop 
 readline (file_input, v_iline);
 read (v_iline, v_data_in);

 data_in <= signed (v_data_in);
 wait for 2 ns;
 end loop;

 file_close (file_input);

 wait for 16394 ns - 2052 ns;
 start <= '0';

 wait;
end process;
end architecture;