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

signal flag_sat, sel_sat: std_logic_vector (1 downto 0);
signal rwn, csa, csb, cnt_en, en_m_1,en_m_2,en_m_3, en_term_1, en_term_2, en_term_3, en_term_4, en_partial_1, en_partial_2, en_final_sum, c_i: std_logic;

component datapath is
	port (clk, rst, rwn, csa, csb, c_i: in std_logic;
		 cnt_en, en_m_1,en_m_2,en_m_3, en_term_1, en_term_2, en_term_3, en_term_4, en_partial_1, en_partial_2, en_final_sum: in std_logic;
		 sel_sat: in std_logic_vector(1 downto 0);
		 data_in: in signed (7 downto 0);
		 flag_sat: out std_logic_vector (1 downto 0);
		 add: buffer unsigned (9 downto 0);
		 u_sat: buffer signed (7 downto 0));
	end component;

component asm is
	 port (clk, rst, start: in std_logic; 
		 add: in unsigned (9 downto 0); 
		 flag_sat: in std_logic_vector (1 downto 0); 
		 done, c_i, rwn, csa, csb: out std_logic; 
		 cnt_en, en_m_1,en_m_2,en_m_3, en_term_1, en_term_2, en_term_3, en_term_4, en_partial_1, en_partial_2, en_final_sum: out std_logic;
		 sel_sat: out std_logic_vector (1 downto 0));
end component;

begin

fsm: asm port map (clk => clk, rst => rst, start => start, add => add, flag_sat => flag_sat, done => done,
 c_i => c_i, rwn => rwn, csa => csa, csb => csb, cnt_en => cnt_en, en_m_1 => en_m_1,en_m_2=>en_m_2,en_m_3=>en_m_3, en_term_1 => en_term_1, en_term_2 => en_term_2,
 en_term_3 => en_term_3, en_term_4 => en_term_4, en_partial_1 => en_partial_1, en_partial_2 => en_partial_2, 
 en_final_sum => en_final_sum, sel_sat => sel_sat); 
 
 dp:datapath port map (clk => clk, rst => rst, add => add, flag_sat => flag_sat, data_in => data_in,
 rwn => rwn, csa => csa, csb => csb,  c_i => c_i, cnt_en => cnt_en, en_m_1 => en_m_1,en_m_2=>en_m_2,en_m_3=>en_m_3, en_term_1 => en_term_1, en_term_2 => en_term_2,
 en_term_3 => en_term_3, en_term_4 => en_term_4, en_partial_1 => en_partial_1, en_partial_2 => en_partial_2, 
 en_final_sum => en_final_sum, u_sat => u_sat, sel_sat => sel_sat);

end architecture; 
 