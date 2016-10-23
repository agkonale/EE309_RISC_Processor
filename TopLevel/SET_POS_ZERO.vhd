library ieee;  
use ieee.std_logic_1164.all;  
 
entity SET_POS_ZERO is  
	port(
			X:		in std_logic_vector (7 downto 0); 
			POS:	in std_logic_vector (2 downto 0); 
			init:	in std_logic; 
			  
			Y:		out std_logic_vector (7 downto 0)
		);  
end SET_POS_ZERO;  

architecture Struct of SET_POS_ZERO is  
begin  

     Y  <=	X when init = '1' else
     	  	X and "11111110" when POS = "000" else  
          	X and "11111100" when POS = "001" else  
          	X and "11111000" when POS = "010" else  
          	X and "11110000" when POS = "011" else  
          	X and "11100000" when POS = "100" else  
          	X and "11000000" when POS = "101" else  
          	X and "10000000" when POS = "110" else  
          	X and "00000000" when POS = "111" else  
          	"--------";  
          	
end Struct; 
