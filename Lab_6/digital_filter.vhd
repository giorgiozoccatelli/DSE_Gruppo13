library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity digital_filter is
 port (clk, rst, start: in std_logic;
 data_in: in signed (7 downto 0);
 done: out std_logic;
 add: buffer unsigned (9 downto 0);
 u_sat: out signed (7 downto 0));
end entity;

architecture structural of digital_filter is

signal flag_sat: std_logic_vector (1 downto 0);
signal rwn, csa, csb, sel_pu, cnt_en, en_i, en_p, en_d, en_u1, en_u, en_e, c_i: std_logic;
signal sel_big, sel_pid, sel_sat: std_logic_vector (1 downto 0);

component datapath is
	port (clk, rst, rwn, csa, csb, c_i: in std_logic;
	 cnt_en, en_i, en_p, en_d, en_u1, en_e, sel_pu: in std_logic;
	 sel_big, sel_pid, sel_sat: in std_logic_vector (1 downto 0);
	 data_in: in signed (7 downto 0);
	 flag_sat: out std_logic_vector (1 downto 0);
	 add: buffer unsigned (9 downto 0);
	 u_sat: buffer signed (7 downto 0));
end component;

component asm is
	 port (clk, rst, start: in std_logic;
	 add: in unsigned (9 downto 0);
	 flag_sat: in std_logic_vector (1 downto 0);
	 done, sel_pu, c_i, rwn, csa, csb: out std_logic;
	 cnt_en, en_i, en_p, en_d, en_u1, en_e: out std_logic;
	 sel_big, sel_pid, sel_sat: out std_logic_vector (1 downto 0));
end component;

begin

fsm: asm port map (clk => clk, rst => rst, start => start, add => add, flag_sat => flag_sat, done => done,
 sel_pu => sel_pu, rwn => rwn, csa => csa, csb => csb, cnt_en => cnt_en, en_i => en_i,
 en_p => en_p, en_d => en_d, en_u1 => en_u1, en_e => en_e, sel_big => sel_big, 
 sel_pid => sel_pid, sel_sat => sel_sat, c_i => c_i); 
 
 dp:datapath port map (clk => clk, rst => rst, add => add, flag_sat => flag_sat, data_in => data_in,
 sel_pu => sel_pu, rwn => rwn, csa => csa, csb => csb, cnt_en => cnt_en, en_i => en_i,
 en_p => en_p, en_d => en_d, en_u1 => en_u1, en_e => en_e, u_sat => u_sat,
 sel_big => sel_big, sel_pid => sel_pid, sel_sat => sel_sat, c_i => c_i);

end architecture; 
 