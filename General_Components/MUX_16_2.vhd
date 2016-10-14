library ieee;
use ieee.std_logic_1164.all;

entity MUX_16_2 is
 	port(X0,X1: in std_logic_vector(15 downto 0); Sel: in std_logic;  Y: out std_logic_vector(15 downto 0));
end entity MUX_16_2;

architecture Struct of MUX_16_2 is
begin
Y  		<= 	  X0   when Sel='0'  else  
		      X1   when Sel='1'  else
		      "----------------";  
		      
end architecture Struct;





