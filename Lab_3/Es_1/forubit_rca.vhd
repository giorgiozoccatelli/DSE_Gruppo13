LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY fourbit_rca IS
    PORT (
        SW: IN std_logic_vector(8 DOWNTO 0); 
		  KEY0, KEY1: IN std_logic;
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT std_logic_vector(0 to 6);
		  LEDR9 : OUT std_logic
    );
END fourbit_rca;

ARCHITECTURE behavior OF fourbit_rca IS
		
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
		
	COMPONENT full_adder is
		    PORT (
        a, b: IN std_logic;
        carry_in: IN std_logic;
        carry_out, sum: OUT std_logic
    );
		END COMPONENT;
	
	
SIGNAL update_a, update_b, update_sum, sum_display: signed(3 DOWNTO 0);
SIGNAL carry_out0, decision_tmp: std_logic;
SIGNAL carry: std_logic_vector(3 downto 0);

BEGIN
	 FA0: full_adder PORT MAP(SW(4), SW(0), SW(8), carry(0), update_sum(0));
    FA1: full_adder PORT MAP(SW(5), SW(1), carry(0), carry(1), update_sum(1));
    FA2: full_adder PORT MAP(SW(6), SW(2), carry(1), carry(2), update_sum(2));
    FA3: full_adder PORT MAP(SW(7), SW(3), carry(2), carry(3), update_sum(3));
	
	reg_a: regn GENERIC MAP(4)
					PORT MAP(R => signed(SW(7 DOWNTO 4)), Clock => KEY1, Resetn => KEY0, Q=> update_a); 
	reg_b: regn GENERIC MAP(4)
					PORT MAP(R => signed(SW(3 DOWNTO 0)), Clock => KEY1, Resetn => KEY0, Q=> update_b); 
	reg_sum: regn GENERIC MAP(4)
					PORT MAP(R => update_sum, Clock => KEY1, Resetn => KEY0, Q=> sum_display); 
	display_a_b_sum: display_hexadecimal PORT MAP(a_in => update_a, b_in => update_b, c_in => sum_display, 
	                                 sign_a => HEX5, a_out => HEX4, sign_b => HEX3, b_out => HEX2,
												sign_c => HEX1, c_out=> HEX0);
	overflow0: overflow_check PORT MAP (sum => sum_display, decision => decision_tmp);
	flipflop0: flipflop PORT MAP (D => decision_tmp, Clock => KEY1, Resetn => KEY0, Q=> LEDR9);
	 
END behavior;
