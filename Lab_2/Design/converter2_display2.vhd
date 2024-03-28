library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter2_display2 is 
	port ( SW : in unsigned(5 downto 0);
			 HEX0, HEX1 : out std_logic_vector(0 to 6)
			);
end converter2_display2;

architecture behavior of converter2_display2 is

	component converter2 is
		port (SW : in unsigned(5 downto 0);
			 m : out std_logic_vector(3 downto 0);
          z : out std_logic_vector(3 downto 0)
         );
	end component;
	
	component display2 is
		port(m, z : in std_logic_vector(3 downto 0);
		  HEX0, HEX1 : out std_logic_vector(0 to 6)
		  );
	end component;
	
	signal a1, a2 : std_logic_vector(3 downto 0);
	
	begin
	
	converter20 : converter2 port map(SW, a1, a2);
	display20 : display2 port map(a1, a2, HEX0, HEX1);
	
end behavior;