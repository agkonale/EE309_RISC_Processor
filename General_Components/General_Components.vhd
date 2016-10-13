library ieee;
use ieee.std_logic_1164.all;

package General_Components is

component PRIORITY_ENCODER is  
	port ( X : in std_logic_vector (7 downto 0); Y :out std_logic_vector (2 downto 0));  
end component; 
  
component SET_POS_ZERO is  
	port ( X : in std_logic_vector (7 downto 0); POS:in std_logic_vector (2 downto 0); Y :out std_logic_vector (2 downto 0));  
end component;  

component MUX_16_8 is
 	port(X0,X1,X2,X3,X4,X5,X6,X7: in std_logic_vector(15 downto 0); Sel: in std_logic_vector(2 downto 0);  Y: out std_logic_vector(15 downto 0));
end component MUX_16_8;

component DEMUX is
 	port(Sel: in std_logic_vector(2 downto 0);  Y: out std_logic_vector(7 downto 0));
end component;

component DATA_REGISTER is
	generic (data_width:integer);
	port (Din: in std_logic_vector(data_width-1 downto 0);
	      Dout: out std_logic_vector(data_width-1 downto 0);
	      clk, enable: in std_logic);
end component;

end General_Components;


