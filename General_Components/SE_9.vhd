library ieee;  
use ieee.std_logic_1164.all;  
 
entity SE_9 is  
	port ( X : in std_logic_vector (8 downto 0); Y :out std_logic_vector (15 downto 0));  
end SE_9;  


architecture Struct of SE_9 is  
begin  
     Y(8 downto 0) <=  X;
     Y(15 downto 9) <=	"0000000" ;
     
end Struct; 
