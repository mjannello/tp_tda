library IEEE;
use IEEE.std_logic_1164.all;

entity tb_pitstop is
end;



architecture beh of tb_pitstop is

	signal clk,rst : std_logic:='0';
	signal Q2,Q1,Q0: std_logic;
	signal x,y,Q_pit:std_logic;
	
	component cont_3_bits is
		port( 	clk: in std_logic;
			rst: in std_logic;
			en: in std_logic;
			Q2: out std_logic;
			Q1: out std_logic;
			Q0: out std_logic);
	end component;
	
	component pit is
		port(	X: in std_logic;
				Y: in std_logic;
				Q: out std_logic);
	end component;
	
	
begin
	DUT: cont_3_bits port map (clk,rst,Q_pit,Q2,Q1,Q0);
	p: pit port map (x,y,Q_pit);
	
	
	--y <= '0', '1' after 10 ns, '0' after 30 ns, '1' after 60 ns, '0' after 80 ns;
	--x <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 50 ns, '0' after 70 ns;
    y <= '0', '1' after 10 ns, '0' after 130 ns;
	x <= '0', '1' after 20 ns, '0' after 600 ns;
	clk <= not clk after 10 ns;
	--en <='1' after 2 ns;
	--rst <= '0','1' after 2 ns,'0' after 4 ns;
	
	
end;
