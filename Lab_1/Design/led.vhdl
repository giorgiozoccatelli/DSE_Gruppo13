LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY led IS
PORT ( SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)); 
END led;

ARCHITECTURE behavior OF led IS
BEGIN
LEDR <= SW;
END behavior;