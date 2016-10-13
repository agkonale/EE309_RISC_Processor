library ieee;
use ieee.std_logic_1164.all;

package ALU_Components is
  
component FULL_ADDER is
	port (A, B, Cin: in std_logic; S,Cout: out std_logic);
end component;

component NAND_2 is
	port(x1,x0: in bit;
		s0: out bit);
end component;


end ALU_Components;

--package body MyFsmPack is
 
--end package body;
