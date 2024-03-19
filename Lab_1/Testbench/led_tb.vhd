LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY led_tb IS
END led_tb;

ARCHITECTURE behavior OF led_tb IS
    COMPONENT led
        PORT(
            SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
            LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
        );
    END COMPONENT;
		
    SIGNAL SW_tb : STD_LOGIC_VECTOR(9 DOWNTO 0); 
    SIGNAL LEDR_tb : STD_LOGIC_VECTOR(9 DOWNTO 0); 
	 
BEGIN

    uut: led PORT MAP ( 
        SW => SW_tb,
        LEDR => LEDR_tb
    );
		
	PROCESS
   BEGIN
		
	  SW_tb <= "1010101010"; 
  
          WAIT FOR 20 ns;
	  
	  SW_tb <= "1111100000";
        
          WAIT FOR 20 ns;
		  
          SW_tb <= "0000011111";
		  			
        WAIT;
    END PROCESS;

END behavior;
