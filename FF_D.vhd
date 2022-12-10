library IEEE;
use IEEE.std_logic_1164.all;

entity FF_D is
	port( 	D: in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		en: in std_logic;
		Q: out std_logic);
end;

architecture beh of FF_D is

begin
	process (clk,rst,en)
	begin
			if rst = '1' or en='0' then
				Q <= '0';
			elsif (rising_edge (clk) and en = '1') then
				Q <= D;
			end if;

	end process;

--	Q <= '0' when rst ='1' else D when rising_edge (clk);

end; 

