library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ALU_Components.all;


entity testbench_ADDER_16 is
end entity testbench_ADDER_16;


architecture test of testbench_ADDER_16 is

signal A,B,RESULT : std_logic_vector(15 downto 0);
signal Cin,Cout :std_logic;

begin 
	ADDER_1: ADDER_16 port map (A=>A, B=>B, Cin=>Cin, RESULT=>RESULT,Cout=>Cout);
	
	testcase :process is
	begin
	
		A<= "1111111111111111";
		B<= "1111111100000000";
		Cin<= '0';
		wait for 10 ns;

		A<= "1111111111111000";
		B<= "1111111100000000";
		Cin<= '0';
		wait for 10 ns;
			
		wait;
	end process testcase;

end architecture test;
