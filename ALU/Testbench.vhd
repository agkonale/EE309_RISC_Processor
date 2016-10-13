library ieee;
use ieee.std_logic_1164.all;

entity FULL_ADDER is
	port (A, B, Cin: in std_logic; S,Cout: out std_logic);
end entity;

architecture Struct of FULL_ADDER is
begin

	Cout <= (A and B) or (Cin and (A xor B));
	S <= A xor B xor Cin;
	
end Struct;




library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity testbench;


architecture test of testbench is

component FULL_ADDER is
	port (A, B, Cin: in std_logic; S,Cout: out std_logic);
end component;

signal A,B,Cin,S,Cout :std_logic;

begin 
	FA1: FULL_ADDER port map (A=>A, B=>B, Cin=>Cin, S=>S,Cout=>Cout);
	
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

		A<= '0';
		B<= '0';
		Cin<= '0';
		wait for 10 ns;

		A<= '0';
		B<= '1';
		Cin<= '0';
		wait for 10 ns;


		

		A<= '1';
		B<= '0';
		Cin<= '1';
		wait for 10 ns;

		A<= '1';
		B<= '1';
		Cin<= '1';
		wait for 10 ns;

		A<= '0';
		B<= '0';
		Cin<= '1';
		wait for 10 ns;

		A<= '0';
		B<= '1';
		Cin<= '1';
		wait for 10 ns;

		
			
		wait;
	end process testcase;

end architecture test;
