library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ALU_Components.all;
use work.General_Components.all;

entity ALU is
	port (OP_Sel :in std_logic_vector(1 downto 0);X0,X1 : in std_logic_vector(15 downto 0);Y :out std_logic_vector(15 downto 0);
	C_enable,Z_enable,clk,reset:in std_logic;C_FLAG,Z_FLAG :out std_logic);
end entity;

architecture Struct of ALU is
signal ADD_RESULT,NAND_RESULT,RESULT:std_logic_vector(15 downto 0);

signal GND :std_logic :='0';
signal C_Sig,Z_Sig,C_Out,Z_Out: std_logic_vector(0 downto 0);
signal COMPARATOR_RESULT: std_logic_vector(0 downto 0);
begin

N1 : NAND_16 port map(X0,X1,NAND_RESULT);
ADD1: ADDER_16 port map(X0,X1,GND,ADD_RESULT,C_Sig(0));
CMP1: COMPARATOR port map(X0,X1,COMPARATOR_RESULT(0));

RESULT <= ADD_RESULT when OP_Sel = "00" else
		  NAND_RESULT when OP_Sel = "01"; 

Z_Sig <= COMPARATOR_RESULT when OP_Sel = "10" else
		 "0" when RESULT = "0000000000000000" else
		 "1" ;

Y <= RESULT;
C_FLAG <= C_Out(0);
Z_FLAG <= Z_Out(0);

Z: DATA_REGISTER 
generic map(1)
port map(Z_Sig,Z_Out,clk,Z_enable,reset);
	      
C: DATA_REGISTER 
generic map(1)
port map(C_Sig,C_Out,clk,C_enable,reset);
	      
end Struct;
