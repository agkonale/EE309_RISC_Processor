library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ALU_Components.all;

entity testbench is
end entity testbench;


architecture test of testbench is


signal A,B,Cin,S,Cout :std_logic;

begin 
	FA1: FULL_ADDER port map (A, B, Cin, S,Cout);
	
	testcase :process is
	begin
	
		A<= '1';
		B<= '0';
		Cin<= '0';
		wait for 10 ns;

		A<= '1';
		B<= '1';
		Cin<= '0';
		wait for 10 ns;

		
			
		wait;
	end process testcase;

end architecture test;
