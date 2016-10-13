library ieee;
use ieee.std_logic_1164.all;

entity NAND_2 is
	port(x1,x0: in bit;
		s0: out bit);
end entity;

architecture Behave of NAND_2 is
begin
	s0 <= x1 nand x0;
	
end Behave;
