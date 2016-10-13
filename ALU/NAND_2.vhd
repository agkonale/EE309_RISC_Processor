library ieee;
use ieee.std_logic_1164.all;

entity NAND_2 is
	port(x1,x0: in bit;
		y: out bit);
end entity;

architecture Behave of NAND_2 is
begin
	y <= x1 nand x0;
	
end Behave;
