library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity converter2 is
	port (SW : in unsigned(5 downto 0);
			 m : out std_logic_vector(3 downto 0);
          z : out std_logic_vector(3 downto 0)
         );
end converter2;

architecture behavior of converter2 is
begin
process(SW)
    begin
			
		  case SW(5 downto 3) is
          when "111" =>
              z <= "0111"; --z=7
          when "110" =>
              z <= "0110"; --z=6
          when "101" =>
              z <= "0101"; --z=5
          when "100" =>
              z <= "0100"; --z=4
          when "011" =>
              z <= "0011"; --z=3
          when "010" =>
              z <= "0010"; --z=2
          when "001" =>
              z <= "0001"; --z=1
          when "000" =>
              z <= "0000"; --z=0
			 when others =>
				  z <= "1111"; 
			 end case;
       
        case SW(2 downto 0) is
          when "111" =>
              m <= "0111"; --m=7
          when "110" =>
              m <= "0110"; --m=6
          when "101" =>
              m <= "0101"; --m=5
          when "100" =>
              m <= "0100"; --m=4
          when "011" =>
              m <= "0011"; --m=3
          when "010" =>
              m <= "0010"; --m=2
          when "001" =>
              m <= "0001"; --m=1
          when "000" =>
              m <= "0000"; --m=0
			 when others =>
				  m <= "1111"; 
			 end case;
			 
   end process;
end behavior;	
		