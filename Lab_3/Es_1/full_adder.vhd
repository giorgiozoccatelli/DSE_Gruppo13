LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY full_adder IS
    PORT (
        a, b: IN std_logic;
        carry_in: IN std_logic;
        carry_out, sum: OUT std_logic
    );
END full_adder;

ARCHITECTURE behavior OF full_adder IS
BEGIN
    sum <= (a XOR b) XOR carry_in; 
    carry_out <= (a AND b) OR (carry_in AND (a XOR b)); 
END behavior;
