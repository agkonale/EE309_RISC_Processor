library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ALU_Components.all;


entity testbench_NAND_16 is
end entity testbench_NAND_16;


architecture test of testbench_NAND_16 is

signal  X0,X1: std_logic_vector(15 downto 0);
signal Y :std_logic_vector(15 downto 0);

begin 
	N1: NAND_16 port map (X1=>X1, X0=>X0, Y=>Y);
	
	testcase :process is
	begin
	
		X0<= "1111111111111111";
		X1<= "1111111100000000";
		
		wait for 10 ns;

		X0<= "1111111111111111";
		X1<= "1111111100000111";
		
		wait for 10 ns;
			
		wait;
	end process testcase;

end architecture test;
