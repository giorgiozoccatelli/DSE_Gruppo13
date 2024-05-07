library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity asm is
	 port (clk, rst, start: in std_logic;
	 add: in unsigned (9 downto 0);
	 flag_sat: in std_logic_vector (1 downto 0); 
	 done, c_i, rwn, csa, csb: out std_logic;
	 cnt_en, en_term1, en_term2, en_term3, en_term4, en_partial1, en_partial2, en_finalsum: out std_logic;
	 sel_sat: out std_logic_vector (1 downto 0));
end entity;

architecture behavior of asm is
type state_type is (IDLE, WR_MEM_A, STOP_WR_A, term_1, term_2, term_3, term_4, partial_1, partial_2, final_sum, SAT_P, NO_SAT, SAT_N, WR_MEM_B, DONE_STATE);
signal current_state, next_state: state_type;

begin
	process (current_state, start, add, flag_sat)
	begin
	
	case current_state is
	when IDLE => if start = '1' then
	 next_state <= WR_MEM_A;
	 else
	 next_state <= IDLE;
	 end if;
	when WR_MEM_A =>if add = "1111111111" then
	 next_state <= STOP_WR_A;
	 else
	 next_state <= WR_MEM_A;
	 end if;

	when STOP_WR_A => 
		next_state <= term_1;
	when term_1 => 
		next_state <= term_2;
	when term_2 => 
		next_state <= term_3;
	when term_3 => 
		next_state <= term_4;
	when term_4 => 
		next_state <= partial_1;
	when partial_1 =>
		next_state <= partial_2;
	when partial_2 =>
		next_state <= final_sum;

	when final_sum => 
	 if flag_sat = "10" then
	 next_state <= SAT_P;
	 elsif flag_sat = "11" then
	 next_state <= SAT_N;
	 else
	 next_state <= NO_SAT;
	 end if;
	when SAT_P => next_state <= WR_MEM_B;
	when SAT_N => next_state <= WR_MEM_B;
	when NO_SAT => next_state <= WR_MEM_B;

	when WR_MEM_B => if add = "1111111111" then
	 next_state <= DONE_STATE;
	 else
	 next_state <= term_1;
	 end if;
	 
	when others => if start = '0' then
	 next_state <= IDLE;
	 else
	 next_state <= DONE_STATE;
	 end if;
	end case;
	end process;

	process(clk, rst)
	begin
	if rst = '0' then
	 current_state <= IDLE;
	else
	 if clk'event and clk ='1' then
	 current_state <= next_state;
	 end if;
	end if;

	end process;

	process(current_state)
	begin
	 sel_big <= "00"; sel_pid <= "00"; sel_pu <= '0'; sel_sat <= "00"; csa <= '1'; csb <= '0'; cnt_en <= '0';
	 c_i <= '0'; en_term1 <= '0';en_term2 <= '0';en_term3 <= '0';en_term4 <= '0';en_partial1 <= '0';en_partial2 <= '0';
	 en_finalsum <= '0' ;rwn <= '1'; done <= '0';
	 
	 case current_state is
	 when IDLE => rwn <= '0';
	 when WR_MEM_A => rwn <= '0'; cnt_en <= '1';
	 when STOP_WR_A =>
	 
	 when term_1 => en_term1 <= '1'; 
	 when term_2 => en_term2 <= '1'; 
	 when term_3 => en_term3 <= '1'; 
	 when term_4 => en_term4 <= '1'; 
	 when partial_1 => en_partial1 <= '1'; 
	 when partial_2 => en_partial2 <= '1'; 
	 when final_sum => en_finalsum <= '1'; 
	 
	 when SAT_P => sel_sat <= "10"; rwn <= '0'; csa <= '0'; csb <= '1'; cnt_en <= '1'; sel_big <= "11";
	 sel_pu <= '1';
	 when SAT_N => sel_sat <= "11"; rwn <= '0'; csa <= '0'; csb <= '1'; cnt_en <= '1'; sel_big <= "11";
	 sel_pu <='1';
	 when NO_SAT => sel_sat(1) <= '0'; rwn <= '0'; csa <= '0'; csb <= '1'; cnt_en <= '1'; sel_big <= "11";
	 sel_pu<= '1';
	 when WR_MEM_B => csa <= '1'; csb <= '0'; 
	 when others => done <= '1';
	 end case;
	 end process;
	 
end architecture;  