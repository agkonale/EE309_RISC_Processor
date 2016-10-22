library ieee;
use ieee.std_logic_1164.all;

package General_Components is

type MEM_16 is array (integer range <>) of std_logic_vector(15 downto 0);


type Controller_State is (	S_init,	S_reg_read,	S_alu_op,	S_reg_write,	S_right_pad_reg_write,			--Abstract type for State representation
							S_mem_read,	S_reg_write_2,	S_reg_write_from_T4,	S_reg_write_from_PE,
							S_reg_read_1,	S_alu_op_imm_6,	S_mem_write,	S_T3_to_PC,
							S_alu_pad_6,	S_alu_pad_9,	S_write_PC,	S_reg_read_write,
							S_PC_loop,	S_T3_inc,	S_reg_read_from_PE, S_update_PC );

component PRIORITY_ENCODER is  
	port (X : in std_logic_vector (7 downto 0); 
		  Y :out std_logic_vector (2 downto 0));  
end component; 
  
component SET_POS_ZERO is  
	port (X : in std_logic_vector (7 downto 0); 
		  POS:in std_logic_vector (2 downto 0); 
		  init :in std_logic; 
		  Y :out std_logic_vector (7 downto 0));
end component;

component SE6 is  
	port (X : in std_logic_vector (5 downto 0); 
		  Y :out std_logic_vector (15 downto 0));  
end component;

component SE9 is  
	port (X : in std_logic_vector (8 downto 0); 
		  Y :out std_logic_vector (15 downto 0));  
end component;

component SE_9 is  
	port (X : in std_logic_vector (8 downto 0); 
		  Y :out std_logic_vector (15 downto 0));  
end component;   

component DATA_REGISTER is
	generic (data_width:integer);
	port (Din: in std_logic_vector(data_width-1 downto 0);
	      Dout: out std_logic_vector(data_width-1 downto 0);
	      clk, enable, reset: in std_logic);
end component;

component REGISTER_FILE is
	port (A1,A2,A3 :in std_logic_vector(2 downto 0);	
		  DPC,D3: in std_logic_vector(15 downto 0); 
		  reg_write,PC_write: in std_logic;	
		  D1,D2,PC: out std_logic_vector(15 downto 0); 
		  clk,reset: in std_logic);
end component;

component MEMORY is
	port (Address :in std_logic_vector(4 downto 0);
		  Din: in std_logic_vector(15 downto 0);
	      Dout: out std_logic_vector(15 downto 0);
	      clk,mem_write,mem_read,reset :in std_logic);
end component;




component datapath is
   port (clk, reset: in std_logic; 
   
   		 reg_write, PC_write, ir_write: in std_logic;
   		 mem_write, mem_read:in std_logic;
   		 
   		 t1_write, t2_write, t3_write, t4_write, t5_write: in std_logic;
   		  		 
   		 Set_Pos_Zero_init,PE_write,PE_reg_write: in std_logic; 
   		 
   		 alu_control: in std_logic_vector (1 downto 0); 

   		 MUX_1_Sel :in std_logic_vector (1 downto 0); 
   		 MUX_2_Sel :in std_logic_vector (1 downto 0); 
   		 MUX_3_Sel :in std_logic_vector (1 downto 0); 
   		 MUX_4_Sel :in std_logic_vector (2 downto 0); 
   		 MUX_5_Sel :in std_logic_vector (1 downto 0); 
   		 MUX_6_Sel :in std_logic_vector (1 downto 0); 
   		 MUX_7_Sel :in std_logic_vector (2 downto 0); 

   		 c_write ,z_write: in std_logic;
   		 
   		 carry_flag, zero_flag : out std_logic; 
   		 
   		 ir_out: out std_logic_vector(15 downto 0));
   		 
end component;



component Controller is 
  port (
		 clk, reset: in std_logic; 
   
   		 reg_write, PC_write, ir_write: out std_logic;
   		 mem_write, mem_read:out std_logic;
   		 
   		 t1_write, t2_write, t3_write, t4_write, t5_write: out std_logic;
   		  		 
   		 Set_Pos_Zero_init,PE_write,PE_reg_write: out std_logic; 
   		 
   		 alu_control: out std_logic_vector (1 downto 0); 

   		 MUX_1_Sel :out std_logic_vector (1 downto 0); 
   		 MUX_2_Sel :out std_logic_vector (1 downto 0); 
   		 MUX_3_Sel :out std_logic_vector (1 downto 0); 
   		 MUX_4_Sel :out std_logic_vector (2 downto 0); 
   		 MUX_5_Sel :out std_logic_vector (1 downto 0); 
   		 MUX_6_Sel :out std_logic_vector (1 downto 0); 
   		 MUX_7_Sel :out std_logic_vector (2 downto 0); 

   		 c_write ,z_write: out std_logic;
   		 
   		 carry_flag, zero_flag : in std_logic; 
   		 
   		 ir: in std_logic_vector(15 downto 0));
   		  
end component;


end General_Components;
