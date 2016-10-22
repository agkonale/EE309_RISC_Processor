library ieee;
use ieee.std_logic_1164.all;

package ALU_Components is
  
	component FULL_ADDER is
		port (A, B, Cin: in std_logic; S,Cout: out std_logic);
	end component;

	component ADDER_16 is
   		port (A, B: in std_logic_vector(15 downto 0); 
   			  Cin: in std_logic; 
   			  RESULT: out std_logic_vector(15 downto 0); 
   			  Cout: out std_logic);
	end component;

	component COMPARATOR is
   		port (X1,X0: in std_logic_vector(15 downto 0); Z: out std_logic);
	end component;

	component ALU is
		port (OP_Sel :in std_logic_vector(1 downto 0);
			  X0,X1 : in std_logic_vector(15 downto 0);
			  Y :out std_logic_vector(15 downto 0);
			  C_enable,Z_enable,clk,reset:in std_logic;
			  C_FLAG,Z_FLAG :out std_logic);
	end component;
	
end ALU_Components;


