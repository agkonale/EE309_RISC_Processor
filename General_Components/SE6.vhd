library ieee;  
use ieee.std_logic_1164.all;  
 
entity SE6 is  
	port ( X : in std_logic_vector (5 downto 0); Y :out std_logic_vector (15 downto 0));  
end SE6;  


architecture Struct of SE6 is  
begin  
     Y(5 downto 0) <=  X;
     Y(15 downto 6) <=	"1111111111" when X(5) = '1' else
     					"0000000000" when X(5) = '0' else
     					"----------";
     
end Struct; 
