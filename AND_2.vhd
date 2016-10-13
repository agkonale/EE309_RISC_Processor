library ieee;
use ieee.std_logic_1164.all;

entity AND_2 is
	port(x1,x0: in bit;
		s0: out bit);
end entity;

architecture Behave of AND_2 is
begin
	s0 <= x1 and x0;
	
end Behave;
