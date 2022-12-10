library ieee;
use ieee.std_logic_1164.all;

entity pit is
 	port(	X: in std_logic;
 			Y: in std_logic;
 			Q: out std_logic);

end pit;

architecture arq of pit is
	signal s1: std_logic;
	signal s2: std_logic;

begin
	s1 <= (Y and (not s2)) or (Y and s1) or (X and s1);
	s2 <= (Y and s2 and (not s1)) or (X and Y) or (X and (not s1));
	Q <= s1 and s2;
end arq;