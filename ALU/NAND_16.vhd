library ieee;
use ieee.std_logic_1164.all;


entity NAND_16 is
   port (X1,X0: in std_logic_vector(15 downto 0); Y: out std_logic_vector(15 downto 0));
end entity;


architecture Struct of NAND_16 is
begin
	Y <= X1 NAND X0;
end Struct;



