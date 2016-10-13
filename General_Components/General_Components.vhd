library ieee;
use ieee.std_logic_1164.all;

package General_Components is

component PRIORITY_ENCODER is  
	port ( X : in std_logic_vector (7 downto 0); Y :out std_logic_vector (2 downto 0));  
end component; 
  
component SET_POS_ZERO is  
	port ( X : in std_logic_vector (7 downto 0); POS:in std_logic_vector (2 downto 0); Y :out std_logic_vector (2 downto 0));  
end component;  


	
end General_Components;


