library ieee;  
use ieee.std_logic_1164.all;  
 
entity PRIORITY_ENCODER is  
	port(
			X :	in std_logic_vector (7 downto 0); 

		  	Y :	out std_logic_vector (2 downto 0)
		);  
end PRIORITY_ENCODER;  

architecture Struct of PRIORITY_ENCODER is  
begin  
     Y  <="000" when X(0) = '1' else  
          "001" when X(1) = '1' else  
          "010" when X(2) = '1' else  
          "011" when X(3) = '1' else  
          "100" when X(4) = '1' else  
          "101" when X(5) = '1' else  
          "110" when X(6) = '1' else  
          "111" when X(7) = '1' else  
          "---";  
end Struct; 
