library ieee;
use ieee.std_logic_1164.all;

package General_Components is

type MEM_16 is array (integer range <>) of std_logic_vector(15 downto 0);

type Controller_State is 	(								--Abstract type for State representation
								S_init,	
								S_init_wait_1,
								S_init_wait_2,
								S_init_branch,			
								S_reg_read,	
								S_alu_op,			
								S_reg_write,	
								S_right_pad_reg_write,			
								S_mem_read,
								S_mem_read_2,		
								S_reg_write_2,	
								S_reg_write_from_T4,
								S_reg_write_from_PE,
								S_reg_read_1,		
								S_alu_op_imm_6,	
								S_mem_write,		
								S_T3_to_PC,
								S_alu_pad_6,		
								S_alu_pad_9,	
								S_write_PC,			
								S_reg_read_write,
								S_PC_loop,			
								S_T3_inc,	
								S_reg_read_from_PE, 
								S_update_PC,
								S_halt
							);

function Symbol_To_BV(X: Controller_State) return std_logic_vector;

  
component PRIORITY_ENCODER is  
	port(
			X :	in std_logic_vector (7 downto 0); 

		  	Y :	out std_logic_vector (2 downto 0)
		);    
end component; 
  
component SET_POS_ZERO is  
	port(
			X:		in std_logic_vector (7 downto 0); 
			POS:	in std_logic_vector (2 downto 0); 
			init:	in std_logic; 
			  
			Y:		out std_logic_vector (7 downto 0)
		);  
end component;

component SE6 is  
	port(
			X:	in std_logic_vector (5 downto 0); 
	
		  	Y:	out std_logic_vector (15 downto 0)
		 );  
end component;

component SE9 is  
	port(	
			X:	in std_logic_vector (8 downto 0); 
	
		  	Y:	out std_logic_vector (15 downto 0)
		 );   
end component;

component SE_9 is  
	port(
			X : in std_logic_vector (8 downto 0); 
			
		  	Y :out std_logic_vector (15 downto 0)
		);   
end component;   

component DATA_REGISTER is
	generic (data_width:integer);
	port(
			clk:	in std_logic;
			reset: 	in std_logic;
			enable: in std_logic;			
			Din: 	in std_logic_vector(data_width-1 downto 0);
			
	      	Dout: 	out std_logic_vector(data_width-1 downto 0)
	      	
	     );
end component;

component REGISTER_FILE is
	port(
			clk: 		in std_logic;
			reset: 		in std_logic;
			A1:			in std_logic_vector(2 downto 0);
			A2:			in std_logic_vector(2 downto 0);
			A3:			in std_logic_vector(2 downto 0); 
			DPC: 		in std_logic_vector(15 downto 0); 
			D3: 		in std_logic_vector(15 downto 0); 
			reg_write: 	in std_logic; 
			PC_write: 	in std_logic;
			 
			D1: 		out std_logic_vector(15 downto 0); 
			D2: 		out std_logic_vector(15 downto 0); 
			PC: 		out std_logic_vector(15 downto 0)
		);	
end component;

component MEMORY is
	port(
			clk:		in std_logic;
			reset:		in std_logic;
			mem_write:	in std_logic;
			mem_read:	in std_logic;			
			Address:	in std_logic_vector(6 downto 0);
			Din: 		in std_logic_vector(15 downto 0);
			
			Dout: 		out std_logic_vector(15 downto 0)
	     );   
end component;




component datapath is
   port(
   	    	 clk:				in std_logic;
			 reset: 			in std_logic; 
			 carry_flag: 		out std_logic; 
	   		 zero_flag : 		out std_logic;    		 
	   		 ir_out: 		    out std_logic_vector(15 downto 0);
	   		 cpu_output:		out std_logic_vector(15 downto 0);	--
	   		 Program_Counter:	out std_logic_vector(15 downto 0);
	   		 
	   		 reg_write: 		in std_logic;
	   		 PC_write: 			in std_logic;
	   		 ir_write: 			in std_logic;
	   		 mem_write:			in std_logic;
	   		 mem_read:			in std_logic;
	   		 
	   		 t1_write: 			in std_logic;
	   		 t2_write: 			in std_logic;
	   		 t3_write: 			in std_logic; 
	   		 t4_write: 			in std_logic; 
	   		 t5_write: 			in std_logic;
	   		  		 
	   		 Set_Pos_Zero_init: in std_logic;
	   		 PE_write: 			in std_logic; 
	   		 PE_reg_write: 		in std_logic; 
	   		 
	   		 MUX_1_Sel:			in std_logic_vector (1 downto 0); 
	   		 MUX_2_Sel:			in std_logic_vector (1 downto 0); 
	   		 MUX_3_Sel:			in std_logic_vector (1 downto 0); 
	   		 MUX_4_Sel:			in std_logic_vector (2 downto 0); 
	   		 MUX_5_Sel:			in std_logic_vector (1 downto 0); 
	   		 MUX_6_Sel:			in std_logic_vector (2 downto 0); 
	   		 MUX_7_Sel:			in std_logic_vector (2 downto 0); 

			 alu_control: 		in std_logic_vector (1 downto 0); 
	   		 alu_enable: 		in std_logic;
	   		 c_write: 			in std_logic;
	   		 z_write: 			in std_logic
	   		 );
   		 
end component;



component Controller is 
  port (
			 clk:				in std_logic;
			 reset: 			in std_logic; 
			 carry_flag: 		in std_logic; 
	   		 zero_flag : 		in std_logic;    		 
	   		 ir_out: 			in std_logic_vector(15 downto 0);

	   		 STATE_ID:   		out std_logic_vector(4 downto 0);
	   		 reg_write: 		out std_logic;
	   		 PC_write: 			out std_logic;
	   		 ir_write: 			out std_logic;
	   		 mem_write:			out std_logic;
	   		 mem_read:			out std_logic;
	   		 
	   		 t1_write: 			out std_logic;
	   		 t2_write: 			out std_logic;
	   		 t3_write: 			out std_logic; 
	   		 t4_write: 			out std_logic; 
	   		 t5_write: 			out std_logic;
	   		  		 
	   		 Set_Pos_Zero_init: out std_logic;
	   		 PE_write: 			out std_logic; 
	   		 PE_reg_write: 		out std_logic; 
	   		 
	   		 MUX_1_Sel:			out std_logic_vector (1 downto 0); 
	   		 MUX_2_Sel:			out std_logic_vector (1 downto 0); 
	   		 MUX_3_Sel:			out std_logic_vector (1 downto 0); 
	   		 MUX_4_Sel:			out std_logic_vector (2 downto 0); 
	   		 MUX_5_Sel:			out std_logic_vector (1 downto 0); 
	   		 MUX_6_Sel:			out std_logic_vector (2 downto 0); 
	   		 MUX_7_Sel:			out std_logic_vector (2 downto 0); 

			 alu_control: 		out std_logic_vector (1 downto 0); 
	   		 alu_enable: 		out std_logic;
	   		 c_write: 			out std_logic;
	   		 z_write: 			out std_logic
   		 );
   		  
end component;

component TOP_LEVEL is
	 port (clk, reset: in 	std_logic;
	 	   cpu_output: out 	std_logic_vector(15 downto 0);
	 	   ir 		 : out 	std_logic_vector(15 downto 0);
	 	   Program_Counter:	out std_logic_vector(15 downto 0);
	 	   STATE_ID:   out std_logic_vector(4 downto 0)); 
end component;


end General_Components;

package body General_Components is
function Symbol_To_BV(X: Controller_State) return std_logic_vector is
     variable ret_var: std_logic_vector(4 downto 0);
  begin
     
    if (X = S_init) then
		ret_var := "00000";   
	elsif (X = S_init_wait_1) then
		ret_var := "00001";
	elsif (X = S_init_wait_2) then
		ret_var := "00010";
	elsif (X = S_init_branch) then
		ret_var := "00011";
	elsif (X = S_reg_read) then
		ret_var := "00100";
	elsif (X = S_alu_op) then
		ret_var := "00101";
	elsif (X = S_reg_write) then
		ret_var := "00110";
	elsif (X = S_right_pad_reg_write) then
		ret_var := "00111";
	elsif (X = S_mem_read) then
		ret_var := "01000";
	elsif (X = S_mem_read) then
		ret_var := "01001";
	elsif (X = S_reg_write_2) then
		ret_var := "01010";
	elsif (X = S_reg_write_from_T4) then
		ret_var := "01011";
	elsif (X = S_reg_write_from_PE) then
		ret_var := "01100";
	elsif (X = S_reg_read_1) then
		ret_var := "01101";
	elsif (X = S_alu_op_imm_6) then
		ret_var := "01110";
	elsif (X = S_mem_write) then
		ret_var := "01111";
	elsif (X = S_T3_to_PC) then
		ret_var := "10000";
	elsif (X = S_alu_pad_6) then
		ret_var := "10001";
	elsif (X = S_alu_pad_9) then
		ret_var := "10010";
	elsif (X = S_write_PC) then
		ret_var := "10011";
	elsif (X = S_reg_read_write) then
		ret_var := "10100";
	elsif (X = S_PC_loop) then
		ret_var := "10101";
	elsif (X = S_T3_inc) then
		ret_var := "10110";
	elsif (X = S_reg_read_from_PE) then
		ret_var := "10111";
	elsif (X = S_update_PC) then
		ret_var := "11000";
	
     else
        ret_var := "11111";          --S_halt
     end if;
     return(ret_var);
end Symbol_To_BV;
end package body;

