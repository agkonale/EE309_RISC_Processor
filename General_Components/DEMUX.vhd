library ieee;
use ieee.std_logic_1164.all;

entity DEMUX is
 	port(Sel: in std_logic_vector(2 downto 0);  Y: out std_logic_vector(7 downto 0));
end entity DEMUX;

architecture behave of DEMUX is
begin

Y  <=	  "00000001" when Sel = "000" else  
          "00000010" when Sel = "001" else  
          "00000100" when Sel = "010" else  
          "00001000" when Sel = "011" else  
          "00010000" when Sel = "100" else  
          "00100000" when Sel = "101" else  
          "01000000" when Sel = "110" else  
          "10000000" when Sel = "111" else  
          "--------";  

end architecture behave;





