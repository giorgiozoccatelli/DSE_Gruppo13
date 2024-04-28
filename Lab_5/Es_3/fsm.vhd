library ieee;
use ieee.std_logic_1164.all;

entity fsm is
	port(clk, rst, w: in std_logic;
		z: out std_logic);
end entity;

architecture behavior of fsm is

type state_type is (A, B, C, D, E, F, G, H, I);
signal current_state, next_state: state_type;

begin
	process(current_state, w)
	begin
		case current_state is
			when A => 
			 if w = '0' then
			 next_state <= B;
			 else
			 next_state <= F;
			 end if;
			when B => 
			 if w = '0' then
			 next_state <= C;
			 else
			 next_state <= F;
			 end if;
			when C => 
			 if w = '0' then
			 next_state <= D;
			 else
			 next_state <= F;
			 end if;
			when D => 
			 if w = '0' then
			 next_state <= E;
			 else
			 next_state <= F;
			 end if;
			when E => 
			 if w = '0' then
			 next_state <= E;
			 else
			 next_state <= F;
			 end if;
			when F => 
			 if w = '0' then
			 next_state <= B;
			 else
			 next_state <= G;
			 end if;
			when G => 
			 if w = '0' then
			 next_state <= B;
			 else
			 next_state <= H;
			 end if;
			when H => 
			 if w = '0' then
			 next_state <= B;
			 else
			 next_state <= I;
			 end if;
			when others =>
			 if w = '0' then
			 next_state <= B;
			 else
			 next_state <= I;
			 end if;
		 end case;
	end process; 
	
	
	process (clk)
	begin
		if clk'event and clk ='1' then
			 if rst = '0' then
			 current_state <= A;
			 else
			 current_state <= next_state;
			 end if;
		end if;
	end process;

	process(current_state)
	begin
		case current_state is
			when A => 
				z <= '0';
			when B => 
				z <= '0';
			when C => 
				z <= '0';
			when D => 
				z <= '0';
			when E => 
				z <= '1';
			when F => 
				z <= '0';
			when G => 
				z <= '0';
			when H => 
				z <= '0';
			when I => 
				z <= '1';
		   when others =>
			   z <= '0';
		end case;
	end process;
end behavior; 