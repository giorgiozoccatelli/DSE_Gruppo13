LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY fourbit_rca IS
    PORT (
        a_tot: IN signed(3 DOWNTO 0);
		  b_tot: IN signed(3 DOWNTO 0);
		  carry_in: IN std_logic;
        sum_tot: OUT signed(3 DOWNTO 0);
        carry_out: OUT std_logic
    );
END fourbit_rca;

ARCHITECTURE behavior OF fourbit_rca IS
	COMPONENT full_adder IS
		PORT (
			a, b: IN std_logic;
         carry_in: IN std_logic;
         carry_out, sum: OUT std_logic
        );
	END COMPONENT;
	 

SIGNAL carry: std_logic_vector(2 DOWNTO 0);

BEGIN
    FA0: full_adder PORT MAP(a_tot(0), b_tot(0), carry_in, carry(0), sum_tot(0));
    FA1: full_adder PORT MAP(a_tot(1), b_tot(1), carry(0), carry(1), sum_tot(1));
    FA2: full_adder PORT MAP(a_tot(2), b_tot(2), carry(1), carry(2), sum_tot(2));
    FA3: full_adder PORT MAP(a_tot(3), b_tot(3), carry(2), carry_out, sum_tot(3));
	 

END behavior;
