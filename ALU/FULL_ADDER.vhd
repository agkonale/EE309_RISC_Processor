library ieee;
use ieee.std_logic_1164.all;


entity FULL_ADDER is
	port (A,B,Cin: in std_logic; S,Cout: out std_logic);
end entity;

architecture Struct of FULL_ADDER is
begin

	Cout <= (A and B) or (Cin and (A xor B));
	S <= A xor B xor Cin;
	
end Struct;
