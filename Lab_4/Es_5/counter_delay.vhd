library IEEE;
use IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.all;


entity counter_delay is
  port (
    clk : in std_logic;
    reset : in std_logic;
	 delay_ms : in integer;
	 start_sample: out std_logic
  );
end entity counter_delay;

architecture Behavior of counter_delay is
begin
  process(clk, reset)
  variable count : integer range 0 to 8000;
  begin
    if (clk'event and clk = '1') then
      if reset = '1' then
        count := 0;
		else
        if count = delay_ms-1 then
			  count := 0;
			  start_sample <= '1';
		  else
			  count := count + 1;
			  start_sample <= '0';
		  end if;
      end if;
    end if;
  end process;
end architecture Behavior;
