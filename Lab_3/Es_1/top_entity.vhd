LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY top_entity IS
    PORT (
        SW: IN std_logic_vector(8 DOWNTO 0); 
		  KEY0, KEY1: IN std_logic;
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT std_logic_vector(0 to 6);
		  LEDR9 : OUT std_logic
    );
END top_entity;

ARCHITECTURE behavior OF top_entity IS
	COMPONENT fourbit_rca IS
		PORT (
        a_tot: IN signed(3 DOWNTO 0);
		  b_tot: IN signed(3 DOWNTO 0);
		  carry_in: IN std_logic;
        sum_tot: OUT signed(3 DOWNTO 0);
        carry_out: OUT std_logic
        );
	   END COMPONENT;
	
	
	 COMPONENT regn IS
		GENERIC ( N : integer:=4);
	   PORT (
		   R : IN SIGNED(N-1 DOWNTO 0);
	      Clock, Resetn : IN STD_LOGIC;
	      Q : OUT SIGNED(N-1 DOWNTO 0)
		   );
		END COMPONENT;
	
	COMPONENT display_hexadecimal is
		PORT (
        a_in, b_in, c_in: IN signed(3 downto 0);
        a_out, b_out, c_out, sign_a, sign_b, sign_c: OUT std_logic_vector(0 to 6)
			);
		END COMPONENT;		

	COMPONENT overflow_check is
    PORT (
        sum: IN signed(3 DOWNTO 0); 
		  decision: OUT std_logic
			);
		END COMPONENT;

	COMPONENT flipflop is
		PORT (
			D, Clock, Resetn : IN STD_LOGIC;
			Q : OUT STD_LOGIC);
		END COMPONENT;	
	
	
SIGNAL update_a, update_b, update_sum, sum_display: signed(3 DOWNTO 0);
SIGNAL carry_out0, decision_tmp: std_logic;

BEGIN
	fourbit_rca_0: fourbit_rca PORT MAP(update_a, update_b, SW(8), update_sum, carry_out0);
	reg_a: regn GENERIC MAP(4)
					PORT MAP(R => signed(SW(7 DOWNTO 4)), Clock => KEY1, Resetn => KEY0, Q=> update_a); 
	reg_b: regn GENERIC MAP(4)
					PORT MAP(R => signed(SW(3 DOWNTO 0)), Clock => KEY1, Resetn => KEY0, Q=> update_b); 
	reg_sum: regn GENERIC MAP(4)
					PORT MAP(R => update_sum, Clock => KEY1, Resetn => KEY0, Q=> sum_display); 
	display_a_b_sum: display_hexadecimal PORT MAP(a_in => update_a, b_in => update_b, c_in => sum_display, 
	                                 sign_a => HEX5, a_out => HEX4, sign_b => HEX3, b_out => HEX2,
												sign_c => HEX1, c_out=> HEX0);
	overflow0: overflow_check PORT MAP (sum_display, decision_tmp);
	flipflop0: flipflop PORT MAP (decision_tmp, KEY1, KEY0, LEDR9);
	 
END behavior;
