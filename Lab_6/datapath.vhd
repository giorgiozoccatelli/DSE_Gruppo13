library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
	port (clk, rst, rwn, csa, csb, c_i: in std_logic;
	 cnt_en, en_i, en_p, en_d, en_u1, en_e, sel_pu: in std_logic;
	 sel_big, sel_pid, sel_sat: in std_logic_vector (1 downto 0);
	 data_in: in signed (7 downto 0);
	 flag_sat: out std_logic_vector (1 downto 0);
	 add: buffer unsigned (9 downto 0);
	 u_sat: buffer signed (7 downto 0));
end entity;

architecture structure of datapath is
signal data, rege_to_mux, mux_to_c2: signed (7 downto 0);
-- memory output, reg_e output, data to be 2's complemented
signal mux4_to_add, mux_to_mux, mux2_to_add, c2_to_mux, in_regd, in_regp: signed (19 downto 0);
-- addendum from mux4, intermediate signal, addendum from mux2, 2's complemented data(-1), reg_d input, reg_p input
signal add_to_reg, p, i, d, u1, in4_i, in4_p, in4_d, in4_mux: signed (19 downto 0);
-- sum result, p contribute, i contribute, d contribute, u1 contribute, i line to adder, p line to adder, d line to adder, p or d line to adder
signal ext_c2, ext_d: signed (11 downto 0);
-- sign selector for c2 sign extension
signal ext_i: signed (10 downto 0);
signal ext_p: signed (7 downto 0);
signal sel_c2: std_logic;
signal ext_regp: signed (1 downto 0);
signal ext_regd: signed (0 downto 0);
-- signals for sign extensions

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
 port (a, b: in signed (8 downto 0);
 cin: in std_logic;
 sum: out signed (8 downto 0));
end component;

component saturation is
 port (i: in signed (8 downto 0);
 sel: in std_logic_vector (1 downto 0);
 flag: out std_logic_vector (1 downto 0);
 o: out signed (7 downto 0));
end component;

begin

counter_address: counter port map(clk => clk, rst => rst, en => cnt_en, cnt => add);
-- address counter

mem_a: memory port map (address => add, data_in => data_in, rwn => rwn, clk => clk, cs => csa, data_out =>
data);
-- mem_A

reg_e: regn generic map (n => 8) port map (d => data, clk => clk, rst => rst, en => en_e, q => rege_to_mux);
-- register for previous address error

mux_pid1: mux_2to1 generic map (n => 8) port map (x => data, y => rege_to_mux, sel => sel_pid(1), o =>
mux_to_c2);

sel_c2 <= not mux_to_c2(7);
mux_c2: mux_2to1 generic map (n => 12) port map (x => "000000000000", y => "111111111111", sel =>
sel_c2, o => ext_c2);

c2_to_mux <= ext_c2&(not mux_to_c2);
mux_pid0: mux_2to1 generic map (n => 20) port map (x => i, y => c2_to_mux, sel => sel_pid(0), o =>
mux_to_mux);

mux_pu1: mux_2to1 generic map (n => 20) port map (x => mux_to_mux, y => u1, sel => sel_pu, o => mux2_to_add);
-- 2's complementation branch, summation increment and partial sum contributes

mux_i: mux_2to1 generic map (n => 11) port map (x => "00000000000", y => "11111111111", sel => data (7), o => ext_i);

in4_i <= ext_i & data & '0';
-- incremental contribution
mux_p: mux_2to1 generic map (n => 8) port map (x => "00000000", y => "11111111", sel => data (7), o =>ext_p);

in4_p <= ext_p & data & "0000";
-- proportional contribution
mux_d: mux_2to1 generic map (n => 12) port map (x => "000000000000", y => "111111111111", sel => data(7), o => ext_d);

in4_d <= ext_d & data ; 
-- differential contribution

mux_pu0: mux_2to1 generic map (n => 20) port map (x => p , y => d, sel => sel_pu, o => in4_mux);
mux_big: mux_4to1 generic map (n => 20) port map (w => in4_i, x => in4_p, y => in4_d, z => in4_mux, sel =>
sel_big, o => mux4_to_add);
-- single contributes and partial sum

sum: adder port map (a => mux4_to_add, b => mux2_to_add, cin => c_i, sum => add_to_reg);
-- sum

mux_regp: mux_2to1 generic map (n => 2) port map (x => "00", y => "11", sel => add_to_reg (19), o =>ext_regp);

in_regp <= ext_regp & add_to_reg (19 downto 2);

reg_p: regn generic map (n => 20) port map (clk => clk, rst => rst, en => en_p, d => in_regp, q => p);
-- proportional registers
reg_i: regn generic map (n => 20) port map (clk => clk, rst => rst, en => en_i, d => add_to_reg, q => i);
-- incremental register
mux_regd: mux_2to1 generic map (n => 1) port map (x => "0", y => "1", sel => add_to_reg (19), o =>ext_regd);

in_regd <= ext_regd & add_to_reg (19 downto 1);

reg_d: regn generic map (n => 20) port map (clk => clk, rst => rst, en => en_d, d => in_regd, q => d);
-- differential register
reg_u1: regn generic map (n => 20) port map (clk => clk, rst => rst, en => en_u1, d => add_to_reg, q => u1);
-- partial sum register
sat: saturation port map (i => add_to_reg, sel => sel_sat, flag => flag_sat, o => u_sat);
-- saturation circuit

mem_b: memory port map (address => add, data_in => u_sat, rwn => rwn, clk => clk, cs => csb);
-- mem_B

end architecture;