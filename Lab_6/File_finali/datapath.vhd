library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
	port (clk, rst, rwn, csa, csb, c_i: in std_logic;
	 cnt_en, en_m_1,en_m_2,en_m_3, en_term_1, en_term_2, en_term_3, en_term_4, en_partial_1, en_partial_2, en_final_sum: in std_logic;
	 sel_sat: in std_logic_vector(1 downto 0);
	 data_in: in signed (7 downto 0);
	 flag_sat: out std_logic_vector (1 downto 0);
	 add: buffer unsigned (9 downto 0);
	 u_sat: buffer signed (7 downto 0));
end entity;

architecture structure of datapath is

signal data: signed(7 downto 0);
signal data_out_1, data_out_2, data_out_3: signed(7 downto 0);
signal extended_data0_pos,extended_data0_neg: signed(10 downto 0); -- dato ciclo attuale esteso positivo o negativo
signal extended_data1_pos,extended_data1_neg: signed(10 downto 0); -- dato ciclo -1 esteso positivo o negativo
signal extended_data2_pos,extended_data2_neg: signed(10 downto 0); -- dato ciclo -2 esteso positivo o negativo
signal extended_data3_pos,extended_data3_neg: signed(10 downto 0); -- dato ciclo -3 esteso positivo o negativo
signal data_divisibile_2_pos, data_divisibile_2_neg: signed(10 downto 0); -- dato divisibile per 2
signal not_data_pos1,data_shift_pos1, final_1_pos, not_data_neg1, final_1_neg, inter_1_neg,final_1: signed(10 downto 0); -- segnali primo addendo
signal not_data_pos2,data_shift_pos2, final_2_pos, not_data_neg2, inter_2_neg, final_2_neg, final_2: signed(10 downto 0); -- segnali secondo addendo
signal inter_3, final_3: signed(10 downto 0); --segnali terzo addendo
signal data_divisibile_4_pos, data_divisibile_4_neg:signed(10 downto 0); --dato divisibile per 4
signal final_4_pos, final_4_neg, final_4: signed(10 downto 0); --segnali quarto addendo

signal term1, term2, term3, term4 : signed(10 downto 0);
signal sum_partial1, sum_partial2, partial1, partial2 : signed(10 downto 0);
signal add_to_reg, final_sum : signed(10 downto 0);


component regn is
 generic (n: integer);
 port (d: in signed (n-1 downto 0);
 clk, rst, en: in std_logic;
 q: out signed (n-1 downto 0));
end component; 

component counter is
 port (clk, rst, en: in std_logic;
 cnt: buffer unsigned (9 downto 0));
end component;

component mux_2to1 is
 generic (n: integer);
 port (x, y: in signed (n-1 downto 0);
 sel: in std_logic;
 o: out signed (n-1 downto 0));
end component;

component mux_4to1 is
 generic (n: integer);
 port (w, x, y, z: in signed (n-1 downto 0);
 sel: in std_logic_vector (1 downto 0);
 o: out signed (n-1 downto 0));
end component;

component memory is
 port (address: in unsigned (9 downto 0);
 data_in: in signed (7 downto 0);
 rwn, clk, cs: in std_logic;
 data_out: out signed (7 downto 0));
end component;

component adder is
 port (a, b: in signed (10 downto 0);
 cin: in std_logic;
 sum: out signed (10 downto 0));
end component;

component saturation is
 port (i: in signed (10 downto 0);
 sel: in std_logic_vector (1 downto 0);
 flag: out std_logic_vector (1 downto 0);
 o: out signed (7 downto 0));
end component;

component memory_registers is
 port (clk, rst, en_m_1,en_m_2,en_m_3 : in  std_logic; 
 data_in : in signed(7 downto 0);
 data_out_1 : out signed(7 downto 0);
 data_out_2 : out signed(7 downto 0);
 data_out_3 : out signed(7 downto 0));
end component;

begin

counter_address: counter port map(clk => clk, rst => rst, en => cnt_en, cnt => add);


mem_a: memory port map (address => add, data_in => data_in, rwn => rwn, clk => clk, cs => csa, data_out =>data);

memories: memory_registers port map(clk=>clk,rst=>rst,en_m_1=>en_m_1,en_m_2=>en_m_2,en_m_3=>en_m_3,data_in=>data,
data_out_1=>data_out_1,data_out_2=>data_out_2,data_out_3=>data_out_3);

extended_data0_pos <= "000" & data; 
extended_data0_neg <= "111" & data;

data_divisibile_2_pos <= extended_data0_pos(10 downto 1) & '0';
data_shift_pos1 <= '0' & data_divisibile_2_pos(10 downto 1);
not_data_pos1 <= not data_shift_pos1;
data_add_pos1 :  adder port map(a=>not_data_pos1, b=> "00000000001", cin=>c_i, sum=>final_1_pos);

data_divisibile_2_neg <= extended_data0_neg(10 downto 1) & '0';
not_data_neg1 <= not data_divisibile_2_neg;
data_add_neg1 : adder port map(a=>not_data_neg1,b=>"00000000001", cin=>c_i, sum=>inter_1_neg);
final_1_neg <= '0' & inter_1_neg(10 downto 1);
 
mux_sign1: mux_2to1 generic map(n => 11) port map(x=>final_1_pos,y=>final_1_neg, sel=>data(7), o=>final_1); --primo addendo  

reg_term1: regn generic map(n => 11) port map( d => final_1, clk => clk, rst => rst, en => en_term_1, q => term1);


extended_data1_pos <= "000" & data_out_1;
extended_data1_neg <= "111" & data_out_1;

data_shift_pos2 <= extended_data1_pos(9 downto 0) & '0';
not_data_pos2 <= not data_shift_pos2;
data_add_pos2 : adder port map(a=> not_data_pos2, b=>"00000000001", cin =>c_i, sum=>final_2_pos);

not_data_neg2 <= not extended_data1_neg;
data_add_neg2 : adder port map(a=>not_data_neg2, b=>"00000000001", cin=>c_i, sum=>inter_2_neg);
final_2_neg <= inter_2_neg(9 downto 0) & '0';

mux_sign2: mux_2to1 generic map(n=>11) port map(x=>final_2_pos, y=>final_2_neg, sel=>data_out_1(7), o=>final_2); --secondo addendo 

reg_term2: regn generic map(n => 11) port map( d => final_2, clk => clk, rst => rst, en => en_term_2, q => term2);


extended_data2_pos <= "000" & data_out_2;
extended_data2_neg <= "111" & data_out_2;

mux_sign3: mux_2to1 generic map(n=>11) port map(x=>extended_data2_pos, y=>extended_data2_neg, sel=>data_out_2(7), o=>inter_3);
final_3 <= inter_3(8 downto 0) & "00"; -- terzo addendo

reg_term3: regn generic map(n => 11) port map( d => final_3, clk => clk, rst => rst, en => en_term_3, q => term3);


extended_data3_pos <= "000" & data_out_3;
extended_data3_neg <= "111" & data_out_3;

data_divisibile_4_pos <= extended_data3_pos(10 downto 2) & "00";
final_4_pos <= "00" & data_divisibile_4_pos(10 downto 2);

data_divisibile_4_neg <= extended_data3_neg(10 downto 2) & "00";
final_4_neg <= "11" & data_divisibile_4_neg(10 downto 2);

mux_sign_4: mux_2to1 generic map(n=>11) port map(x=>final_4_pos, y=>final_4_neg, sel=>data_out_3(7), o=>final_4); -- quarto addendo

reg_term4: regn generic map(n => 11) port map( d => final_4, clk => clk, rst => rst, en => en_term_4, q => term4);


adder_partial_1: adder port map( a => term1, b => term2, cin => '0', sum => sum_partial1); --prima somma parziale
reg_partial1: regn generic map(n => 11) port map( d => sum_partial1, clk => clk, rst => rst, en => en_partial_1, q => partial1);


adder_partial_2: adder port map( a => term3, b => term4, cin => '0', sum => sum_partial2); --seconda somma parziale
reg_partial2: regn generic map(n => 11) port map( d => sum_partial2, clk => clk, rst => rst, en => en_partial_2, q => partial2);


adder_final_sum: adder port map( a => partial1, b => partial2, cin => '0', sum => add_to_reg); --somma finale
reg_final_sum: regn generic map(n => 11) port map( d => add_to_reg, clk => clk, rst => rst, en => en_final_sum, q => final_sum);


sat: saturation port map (i => add_to_reg, sel => sel_sat, flag => flag_sat, o => u_sat);


mem_b: memory port map (address => add, data_in => u_sat, rwn => rwn, clk => clk, cs => csb);

end architecture;