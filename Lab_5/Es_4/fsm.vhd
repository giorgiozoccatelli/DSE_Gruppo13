library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm is
	 port(clk, rst, en, rep: in std_logic;
			reg: out unsigned (2 downto 0);
			sel: out std_logic);
end entity;

architecture behavior of fsm is

type state_type is (VOID, H, E, L, O, BLANK, ROLL);
signal current_state, next_state: state_type; 

begin
	process(current_state, en, rep)
	begin
		case current_state is
		when VOID => if en = '0' then
		 next_state <= VOID;
		 elsif en = '1' then
		 next_state <= H;
		 end if;
		when H => if en = '0' then
		 next_state <= H;
		 elsif en = '1' then
		 next_state <= E;
		 end if;
		when E => if en = '0' then
		 next_state <= E;
		 elsif en = '1' then
		 next_state <= L;
		 end if;
		when L => if en = '0' then
		 next_state <= L;
		 elsif (en = '1' and rep = '1') then
		 next_state <= L;
		 else
		 next_state <= O;
		 end if;
		when O => if en = '0' then
		 next_state <= O;
		 elsif en = '1' then
		 next_state <= BLANK;
		 end if;
		when BLANK => if en = '0' then
		 next_state <= BLANK;
		 elsif en = '1' then
		 next_state <= ROLL;
		 end if;
		when others => next_state <= ROLL;   
		end case;
	end process;
	
	process (clk)
	begin
		if clk'event and clk ='1' then
			 if rst = '0' then
			 current_state <= VOID; 
			  else
			 current_state <= next_state;
			 end if;
		end if;

	end process;
	
	process(current_state)
	begin
		 sel <= '0';
		 case current_state is
			 when VOID => 
				reg <= "100";
			 when H => 
				reg <= "000";
			 when E => 
				reg <= "001";
			 when L => 
				reg <= "010";
			 when O => 
				reg <= "011";
			 when BLANK => 
				reg <= "100"; 
			 when others => 
				reg <= "100"; 
			   sel <= '1';
		 end case;
	 end process;
end behavior;