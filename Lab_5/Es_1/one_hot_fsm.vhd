library ieee;
use ieee.std_logic_1164.all;

entity one_hot_fsm is
	port ( KEY0 : in std_logic;	--clk
			 SW0 : in std_logic;		--rst
			 SW1 : in std_logic;		--input w			 
			 LEDR0 : out std_logic	--output z
		  );
end one_hot_fsm;

architecture behavior of one_hot_fsm is

signal current_state : std_logic_vector(8 downto 0);
signal future_state : std_logic_vector(8 downto 0);

	begin
	
	process(KEY0)
	
		begin
		
		if KEY0'event and KEY0 = '1' then
			if SW0 = '0' then
				 current_state <= "000000001";
			else
				current_state <= future_state;
			end if;
		end if;
		
	end process;
	
	
	future_state(0) <= '0';
		
	future_state(1) <= not(SW1) and (current_state(0) or current_state(5) or current_state(6) or current_state(7) or current_state(8));
	
	future_state(2) <= not(SW1) and current_state(1);
	
	future_state(3) <= not(SW1) and current_state(2);
	
	future_state(4) <= not(SW1) and (current_state(3) or current_state(4));
		
	future_state(5) <= SW1 and (current_state(0) or current_state(1) or current_state(2) or current_state(3) or current_state(4));
	
	future_state(6) <= SW1 and current_state(5);
	
	future_state(7) <= SW1 and current_state(6);
	
	future_state(8) <= SW1 and (current_state(7) or current_state(8));
	
	
	LEDR0 <= current_state(4) or current_state(8);
	
end behavior;
	
	
	
	
	
	
	
