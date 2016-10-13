library ieee;
use ieee.std_logic_1164.all;


entity COMPARATOR is
   port (X1,X0: in std_logic_vector(15 downto 0); Z: out std_logic);
end entity;


architecture Behave of COMPARATOR is
begin

	process(X1,X0) is
		begin
		if X1 = X0 then
			Z <= '1';
		else 
			Z <= '0';
		end if;
	end process;
	
end Behave;



