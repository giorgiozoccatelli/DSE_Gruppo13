library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_entity is
	port ( a, b : in std_logic_vector(15 downto 0);
			 s : out std_logic_vector(15 downto 0);
			 Clk, Rst : in std_logic;
			 ovf : out std_logic
		  );
end top_entity;

architecture behavior of top_entity is 

	component sixteenbit_rca is 
	port ( a_tot, b_tot : in signed(15 downto 0);
			 carry_in : in std_logic;
			 s_tot : out signed(15 downto 0);
			 carry_out : out std_logic
		  );
	end component;
	
	component regn is
		generic ( N : integer:=16);
	   port (
		   R : in signed(N-1 downto 0);
	      Clock, Resetn : in STD_LOGIC;
	      Q : out signed(N-1 downto 0)
		   );
	end component;
        
	component overflow is
		port ( a, b : in signed(15 downto 0);
			 sum : in signed(15 downto 0);
			 decision : out std_logic
			);
	end component;
	
	component flipflop is 
		port ( D, Clock, Resetn : in STD_LOGIC;
				 Q : out STD_LOGIC);
	end component;	
		
	signal update_a, update_b, update_s, sum_out: signed(15 downto 0);	
	signal decision_tmp : std_logic;
	signal s_out : signed(15 downto 0);
	
	begin

	rca : sixteenbit_rca port map(a_tot => update_a, b_tot => update_b, carry_in => '0', s_tot => update_s);
	
	regA : regn port map(R => signed(a), Clock => Clk, Resetn => Rst, Q => update_a);
	regB : regn port map(R => signed(b), Clock => Clk, Resetn => Rst, Q => update_b);
	regS : regn port map(R => update_s, Clock => Clk, Resetn => Rst, Q => s_out);
	
	overflow0 : overflow port map(a => update_a, b => update_b, sum => sum_out, decision => decision_tmp);
	
	flipflop0 : flipflop port map(D => decision_tmp, Clock => Clk, Resetn => Rst, Q=> ovf);
	
end behavior;

