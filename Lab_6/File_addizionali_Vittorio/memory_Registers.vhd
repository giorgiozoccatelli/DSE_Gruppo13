
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity memory_registers is
    port (
        clk, rst, en_m : in  std_logic;
        data_in : in signed(7 downto 0);
        data_out_1 : out signed(7 downto 0);
        data_out_2 : out signed(7 downto 0);
        data_out_3 : out signed(7 downto 0)
    );
end memory_Registers;

architecture Behavioral of memory_registers is
    signal reg_1 : signed(7 downto 0);
    signal reg_2 : signed(7 downto 0);
    signal reg_3 : signed(7 downto 0);
begin
    process(clk, rst, en_m)
    begin
        if rst = '1' then
            reg_1 <= (others => 'Z');
            reg_2 <= (others => 'Z');
            reg_3 <= (others => 'Z');
        elsif rising_edge(clk) then
				if en_m ='1' then
						 reg_1 <= data_in;
						 reg_2 <= reg_1;
						 reg_3 <= reg_2;
				 else
					reg_1 <= (others => 'Z');
					reg_2 <= (others => 'Z');
					reg_3 <= (others => 'Z');				
				end if;
        end if;
    end process;

    data_out_1 <= reg_1;
    data_out_2 <= reg_2;
    data_out_3 <= reg_3;
end Behavioral;
