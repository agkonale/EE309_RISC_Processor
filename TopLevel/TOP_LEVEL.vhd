library ieee;
use ieee.std_logic_1164.all;

library work;
use work.General_Components.all;

entity TOP_LEVEL is
	 port (clk, reset: in 	std_logic;
	 	   cpu_output: out 	std_logic_vector(15 downto 0);
	 	   ir 		 : out 	std_logic_vector(15 downto 0);
	 	   Program_Counter:	out std_logic_vector(15 downto 0);
	 	   STATE_ID:   out std_logic_vector(4 downto 0)); 
end entity;


architecture Struct of TOP_LEVEL is

signal carry_flag: 		std_logic; 
signal zero_flag : 		std_logic;    		 
signal ir_out: 		    std_logic_vector(15 downto 0);

signal reg_write: 		std_logic;
signal PC_write: 	    std_logic;
signal ir_write: 		std_logic;
signal mem_write:	    std_logic;
signal mem_read:	    std_logic;
 
signal t1_write: 		std_logic;
signal t2_write: 		std_logic;
signal t3_write: 		std_logic; 
signal t4_write: 	    std_logic; 
signal t5_write: 		std_logic;
  		 
signal Set_Pos_Zero_init:std_logic;
signal PE_write: 		 std_logic; 
signal PE_reg_write: 	 std_logic; 
 
signal MUX_1_Sel:		std_logic_vector (1 downto 0); 
signal MUX_2_Sel:		std_logic_vector (1 downto 0); 
signal MUX_3_Sel:		std_logic_vector (1 downto 0); 
signal MUX_4_Sel:		std_logic_vector (2 downto 0); 
signal MUX_5_Sel:		std_logic_vector (1 downto 0); 
signal MUX_6_Sel:		std_logic_vector (2 downto 0); 
signal MUX_7_Sel:		std_logic_vector (2 downto 0); 

signal alu_control: 	std_logic_vector (1 downto 0); 
signal alu_enable: 		std_logic;
signal c_write: 		std_logic;
signal z_write: 		std_logic;


begin

ir <= ir_out;

CP: Controller 
	port map(
	   	    	 clk,
				 reset,			
				 carry_flag,	
		   		 zero_flag, 		   		 
		   		 ir_out,	    		

		   		 STATE_ID,
		   		 reg_write,	
		   		 PC_write,			
		   		 ir_write, 			
		   		 mem_write,			
		   		 mem_read,		
		   		 
		   		 t1_write, 			
		   		 t2_write, 			
		   		 t3_write, 			
		   		 t4_write, 			
		   		 t5_write, 			
		   		  		 
		   		 Set_Pos_Zero_init,
		   		 PE_write,
		   		 PE_reg_write,	 
		   		 
		   		 MUX_1_Sel,	 
		   		 MUX_2_Sel,			 
		   		 MUX_3_Sel,			 
		   		 MUX_4_Sel,			 
		   		 MUX_5_Sel,			
		   		 MUX_6_Sel,			 
		   		 MUX_7_Sel,			 

				 alu_control, 		 
		   		 alu_enable,		
		   		 c_write,		
		   		 z_write 			
	   	);

DP: datapath 
port map(
	   	    	 clk,
				 reset,			
				 carry_flag,	
		   		 zero_flag, 		   		 
		   		 ir_out,	    
		   		 cpu_output,
		   		 Program_Counter,		
		   
		   		 reg_write,	
		   		 PC_write,			
		   		 ir_write, 			
		   		 mem_write,			
		   		 mem_read,		
		   		 
		   		 t1_write, 			
		   		 t2_write, 			
		   		 t3_write, 			
		   		 t4_write, 			
		   		 t5_write, 			
		   		  		 
		   		 Set_Pos_Zero_init,
		   		 PE_write,
		   		 PE_reg_write,	 
		   		 
		   		 MUX_1_Sel,	 
		   		 MUX_2_Sel,			 
		   		 MUX_3_Sel,			 
		   		 MUX_4_Sel,			 
		   		 MUX_5_Sel,			
		   		 MUX_6_Sel,			 
		   		 MUX_7_Sel,			 

				 alu_control, 		 
		   		 alu_enable,		
		   		 c_write,		
		   		 z_write 			
	   	);


end Struct;

