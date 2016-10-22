library ieee;
use ieee.std_logic_1164.all;

library work;
use work.General_Components.all;

entity TOP_LEVEL is
	 port (clk, reset: in std_logic); 
end entity;


architecture Struct of TOP_LEVEL is

signal reg_write, PC_write, ir_write: std_logic;
signal mem_write, mem_read: std_logic;
signal t1_write, t2_write, t3_write, t4_write, t5_write: std_logic;	 
signal Set_Pos_Zero_init,PE_write,PE_reg_write: std_logic; 
signal alu_control: std_logic_vector (1 downto 0); 
signal MUX_1_Sel : std_logic_vector (1 downto 0); 
signal MUX_2_Sel : std_logic_vector (1 downto 0); 
signal MUX_3_Sel : std_logic_vector (1 downto 0); 
signal MUX_4_Sel : std_logic_vector (2 downto 0); 
signal MUX_5_Sel : std_logic_vector (1 downto 0); 
signal MUX_6_Sel : std_logic_vector (1 downto 0); 
signal MUX_7_Sel : std_logic_vector (2 downto 0); 
signal c_write ,z_write:std_logic;
signal carry_flag, zero_flag :std_logic; 
signal ir:std_logic_vector(15 downto 0);

begin

DP : datapath 
		port map(
		 clk, reset, 
   
   		 reg_write, PC_write, ir_write,
   		 mem_write, mem_read,
   		 
   		 t1_write, t2_write, t3_write, t4_write, t5_write,
   		  		 
   		 Set_Pos_Zero_init,PE_write,PE_reg_write,
   		 
   		 alu_control,

   		 MUX_1_Sel ,
   		 MUX_2_Sel ,
   		 MUX_3_Sel ,
   		 MUX_4_Sel , 
   		 MUX_5_Sel , 
   		 MUX_6_Sel ,
   		 MUX_7_Sel , 

   		 c_write ,z_write,
   		 
   		 carry_flag, zero_flag ,
   		 
   		 ir);

   		 
CP : Controller 
		 port map(
		 clk, reset, 
   
   		 reg_write, PC_write, ir_write,
   		 mem_write, mem_read,
   		 
   		 t1_write, t2_write, t3_write, t4_write, t5_write,
   		  		 
   		 Set_Pos_Zero_init,PE_write,PE_reg_write,
   		 
   		 alu_control,

   		 MUX_1_Sel ,
   		 MUX_2_Sel ,
   		 MUX_3_Sel ,
   		 MUX_4_Sel , 
   		 MUX_5_Sel , 
   		 MUX_6_Sel ,
   		 MUX_7_Sel , 

   		 c_write ,z_write,
   		 
   		 carry_flag, zero_flag ,
   		 
   		 ir);

end Struct;

