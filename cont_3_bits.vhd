library IEEE;
use IEEE.std_logic_1164.all;

entity cont_3_bits is
	port( 	clk: in std_logic;
		rst: in std_logic;
		en: in std_logic;
		Q2: out std_logic;
		Q1: out std_logic;
		Q0: out std_logic);
end;

architecture beh of cont_3_bits is
	signal D2,D1,D0 : std_logic;
	signal Q2_aux,Q1_aux,Q0_aux : std_logic;
	component FF_D is
		port( 	D: in std_logic;
			clk: in std_logic;
			rst: in std_logic;
			en: in std_logic;
			Q: out std_logic);
	end component;
begin
	D2 <= (Q2_aux and not Q1_aux) or (not Q2_aux and Q1_aux and Q0_aux) or(Q2_aux and not Q0_aux);
	D1 <= Q1_aux xor Q0_aux;
	D0 <= not Q0_aux;
	FF2: FF_D port map (D2,clk,rst,en,Q2_aux);
	FF1: FF_D port map (D1,clk,rst,en,Q1_aux);
	FF0: FF_D port map (D0,clk,rst,en,Q0_aux);
	Q2<= Q2_aux;
	Q1<= Q1_aux;
	Q0<= Q0_aux;
end; 
