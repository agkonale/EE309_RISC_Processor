library ieee;
use ieee.std_logic_1164.all;
library work;
use work.ALU_Components.all;

entity ADDER_16 is
   port (A, B: in std_logic_vector(15 downto 0); Cin: in std_logic; RESULT: out std_logic_vector(15 downto 0); Cout: out std_logic)
end entity;

architecture Struct of ADDER_16 is
begin

FA1: FULL_ADDER port map (A, B, Cin: in std_logic; S,Cout: out std_logic));
FA2: FULL_ADDER port map ();
FA3: FULL_ADDER port map ();
FA4: FULL_ADDER port map ();
FA5: FULL_ADDER port map ();
FA6: FULL_ADDER port map ();
FA7: FULL_ADDER port map ();
FA8: FULL_ADDER port map ();
FA9: FULL_ADDER port map ();
FA10: FULL_ADDER port map ();
FA11: FULL_ADDER port map ();
FA12: FULL_ADDER port map ();
FA13: FULL_ADDER port map ();
FA14: FULL_ADDER port map ();
FA15: FULL_ADDER port map ();
FA16: FULL_ADDER port map ();
							

end Struct;
