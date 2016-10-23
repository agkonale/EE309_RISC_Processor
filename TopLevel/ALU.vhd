library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ALU_Components.all;
use work.General_Components.all;

entity ALU is
	port(
			 clk:		in std_logic;
			 reset:		in std_logic;
			 ALU_enable:in std_logic;
			 OP_Sel:	in std_logic_vector(1 downto 0);			 
			 X0:		in std_logic_vector(15 downto 0);
			 X1:		in std_logic_vector(15 downto 0);			 			 
			 C_enable:  in std_logic;
			 Z_enable:	in std_logic;
			 
			 Y:			out std_logic_vector(15 downto 0);			  
			 C_FLAG:	out std_logic;
			 Z_FLAG:	out std_logic
		 );
end entity;


architecture Struct of ALU is

	signal ADD_RESULT,RESULT:std_logic_vector(15 downto 0);
	signal GND :std_logic :='0';
	signal C_enable_R :std_logic;
	
	signal C_Sig,Z_Sig,C_Out,Z_Out: std_logic_vector(0 downto 0);
	signal COMPARATOR_RESULT: std_logic_vector(0 downto 0);
	
	begin

		ADD1: 	ADDER_16 port map(X0,X1,GND,ADD_RESULT,C_Sig(0));
		CMP1: 	COMPARATOR port map(X0,X1,COMPARATOR_RESULT(0));

		RESULT		<=	ADD_RESULT when OP_Sel = "00"  else
				  		(X0 NAND X1) when OP_Sel = "01" else
				  		"1111111111111111"; 

		Z_Sig		<=	COMPARATOR_RESULT when OP_Sel = "10" else
				 		"1" when RESULT = "0000000000000000" else
				 		"0";

		C_enable_R 	<=	(C_enable and (not OP_Sel(0))) and (not OP_Sel(1));


		Z: DATA_REGISTER 
		generic map(1)
		port map(Din=>Z_Sig ,Dout=>Z_Out ,clk=>clk ,enable=>Z_enable ,reset=>reset);
				  
		C: DATA_REGISTER 
		generic map(1)
		port map(Din=>C_Sig ,Dout=>C_Out ,clk=>clk ,enable=>C_enable_R ,reset=>reset);


		Y 		<= RESULT;

		C_FLAG 	<= C_Out(0);

		Z_FLAG 	<= Z_Out(0);
			  
end Struct;
