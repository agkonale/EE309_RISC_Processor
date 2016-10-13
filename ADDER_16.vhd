library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ALU_Components.all;

entity ADDER_16 is
   port (A, B: in std_logic_vector(15 downto 0); Cin: in std_logic; RESULT: out std_logic_vector(15 downto 0); Cout: out std_logic)
end entity;

architecture Struct of ADDER_16 is
signal GND :std_logic ;
signal Carry :std_logic_vector(14 downto 0);

begin

GND <= '0';
FA1: FULL_ADDER port map (A(0),B(0),Cin,RESULT(0),Carry(0));
FA2: FULL_ADDER port map (A(1),B(1),Carry(0),RESULT(1),Carry(1));
FA3: FULL_ADDER port map (A(2),B(2),Carry(1),RESULT(2),Carry(2));
FA4: FULL_ADDER port map (A(3),B(3),Carry(2),RESULT(3),Carry(3));
FA5: FULL_ADDER port map (A(4),B(4),Carry(3),RESULT(4),Carry(4));
FA6: FULL_ADDER port map (A(5),B(5),Carry(4),RESULT(5),Carry(5));
FA7: FULL_ADDER port map (A(6),B(6),Carry(5),RESULT(6),Carry(6));
FA8: FULL_ADDER port map (A(7),B(7),Carry(6),RESULT(7),Carry(7));
FA9: FULL_ADDER port map (A(8),B(8),Carry(7),RESULT(8),Carry(8));
FA10: FULL_ADDER port map (A(9),B(9),Carry(8),RESULT(9),Carry(9));
FA11: FULL_ADDER port map (A(10),B(10),Carry(9),RESULT(10),Carry(10));
FA12: FULL_ADDER port map (A(11),B(11),Carry(10),RESULT(11),Carry(11));
FA13: FULL_ADDER port map (A(12),B(12),Carry(11),RESULT(12),Carry(12));
FA14: FULL_ADDER port map (A(13),B(13),Carry(12),RESULT(13),Carry(13));
FA15: FULL_ADDER port map (A(14),B(14),Carry(13),RESULT(14),Carry(14));
FA16: FULL_ADDER port map (A(15),B(15),Carry(14),RESULT(15),Cout));
							

end Struct;
