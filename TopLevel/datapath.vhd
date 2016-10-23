library ieee;
use ieee.std_logic_1164.all;

library work;
use work.ALU_Components.all;

library work;
use work.General_Components.all;

entity datapath is
   port (	 clk:				in std_logic;
			 reset: 			in std_logic; 
			 carry_flag: 		out std_logic; 
	   		 zero_flag : 		out std_logic;    		 
	   		 ir_out: 		    out std_logic_vector(15 downto 0);
	   		 cpu_output:		out std_logic_vector(15 downto 0);	
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
   		 
end entity;


architecture Struct of datapath is

signal	ir_out_temp: std_logic_vector(15 downto 0):= (others => '0');

signal	data_out, data_in, DPC, D3, reg_file_D1, reg_file_D2, reg_file_D3, 
		PC, T1_in, T1_out, T2_in, T2_out, T3_in, T3_out, T4_in, T4_out, T5_in, T5_out,
		SE9_out, 	SE_9_out, SE6_out : std_logic_vector(15 downto 0) := (others => '0'); 
	
signal	mem_address : std_logic_vector(6 downto 0):="0000000";									   --for 128 Short Word Memory

signal  PE_reg_in,PE_reg_out,Set_Pos_Zero_out: std_logic_vector( 7 downto 0);
signal  PE_in,PE_out : std_logic_vector(2 downto 0);

signal	A1, A2, A3 : std_logic_vector (2 downto 0):= "000";

signal	ALU_in_0 ,ALU_in_1, ALU_out: std_logic_vector(15 downto 0);

begin

	ir_out 		<= ir_out_temp;
	cpu_output	<= T3_out;
	Program_Counter <= PC;
----------------------------------------------------------------- MEMORY-----------------------------------------------------------------------

	mem : MEMORY port map (Address => mem_address, Din => data_in, Dout => data_out, clk => clk, mem_write => mem_write, mem_read => mem_read, reset => reset); 
	
	mem_address	<=	PC(6 downto 0) when MUX_1_Sel = "11" else							--for 32 Short Word Memory
			   		T3_out(6 downto 0) when MUX_1_Sel ="10" else
			   		"0000000";
			   
	data_in 	<= T1_out;

	
---------------------------------------------------------------REGISTER FILE----------------------------------------------------------------

	reg_file : REGISTER_FILE port map ( A1 => A1, A2 => A2, A3 => A3, DPC => DPC, D3 => reg_file_D3, reg_write => reg_write ,PC_write => PC_write, D1 => 		 				reg_file_D1, D2 => reg_file_D2, PC => PC, clk => clk, reset => reset );

	A1 <= ir_out_temp(11 downto 9) when MUX_2_Sel ="10" else
		  PE_out when MUX_2_Sel ="01" else
		  "000";

	A2 <= ir_out_temp(8 downto 6) ;
		  

	A3 <= ir_out_temp(5 downto 3) when MUX_3_Sel ="11" else
		  PE_out when MUX_3_Sel = "10" else
		  ir_out_temp(8 downto 6) when MUX_3_Sel = "01" else
		  "000";
		  

	reg_file_D3 <= T3_out when MUX_4_Sel ="111" else
		  		   SE9_out when MUX_4_Sel ="110" else
		  		   T5_out when MUX_4_Sel ="101" else
		  		   T4_out when MUX_4_Sel ="100" else
		  		   "0000000000000000";

	DPC <= T3_out when MUX_5_Sel ="11" else
		   T1_out when MUX_5_Sel ="10" else
		   T5_out when MUX_5_Sel ="01" else
		   "0000000000000000";

---------------------------------------------------------------TEMP-REGISTERS (1-5)-----------------------------------------------------------

	temporary_register_1 : DATA_REGISTER generic map (data_width => 16)
										 	port map (Din => T1_in, Dout => T1_out, clk => clk, enable => T1_write, reset => reset);
	temporary_register_2 : DATA_REGISTER generic map (data_width => 16)
											port map (Din => T2_in, Dout => T2_out, clk => clk, enable => T2_write, reset => reset);
	temporary_register_3 : DATA_REGISTER generic map (data_width => 16)
											port map (Din => T3_in, Dout => T3_out, clk => clk, enable => T3_write, reset => reset);
	temporary_register_4 : DATA_REGISTER generic map (data_width => 16)
											port map (Din => T4_in, Dout => T4_out, clk => clk, enable => T4_write, reset => reset);
	temporary_register_5 : DATA_REGISTER generic map (data_width => 16)
											port map (Din => T5_in, Dout => T5_out, clk => clk, enable => T5_write, reset => reset);

	T1_in <= reg_file_D1;
	T2_in <= reg_file_D2;
	T3_in <= ALU_out;
	T4_in <= data_out;
	T5_in <= ALU_out;
											
---------------------------------------------------------------------IR----------------------------------------------------------------------

	instruction_register : DATA_REGISTER generic map (data_width => 16)
											port map (Din => data_out, Dout => ir_out_temp, clk => clk, enable => ir_write, reset => reset);
												
---------------------------------------------------------------SIGN EXTENDERS------------------------------------------------------------------

	sign_extender_pad_on_right9 : SE9  port map (X => ir_out_temp(8 downto 0), Y => SE9_out );
	sign_extender_pad_on_left9  : SE_9 port map (X => ir_out_temp(8 downto 0), Y => SE_9_out);										
	sign_extender_pad_on_left6  : SE6  port map (X => ir_out_temp(5 downto 0), y => SE6_out );

----------------------------------------------------------------PRIORITY ENCODER---------------------------------------------------------------	

	PRE :PRIORITY_ENCODER port map (X => PE_reg_out , Y => PE_in);  
 
    SPZ :SET_POS_ZERO port map (X => ir_out_temp(7 downto 0), POS => PE_in, init => Set_Pos_Zero_init, Y => Set_Pos_Zero_out ); 
  
    PE_reg :DATA_REGISTER generic map (data_width => 8)
							port map (Din => Set_Pos_Zero_out, Dout => PE_reg_out, clk => clk, enable => PE_reg_write, reset => reset);
							
	PE :DATA_REGISTER generic map (data_width => 3)
						port map (Din => PE_in, Dout => PE_out, clk => clk, enable => PE_write, reset => reset);

--------------------------------------------------------------------ALU-----------------------------------------------------------------------
	ALU1 :ALU port map (OP_Sel => alu_control, X0 => ALU_in_0 , X1 => ALU_in_1 , Y => ALU_out,
				  C_enable => c_write, Z_enable => z_write,ALU_enable => alu_enable, clk => clk,reset => reset ,C_FLAG => carry_flag, Z_FLAG =>zero_flag);


	ALU_in_0 <=  PC when MUX_6_Sel ="111" else
				 T1_out when MUX_6_Sel ="110" else
				 T3_out when MUX_6_Sel ="101" else
				 T4_out when MUX_6_Sel ="100" else
				 "0000000000000000"; 
				 

	ALU_in_1 <=  T2_out when MUX_7_Sel ="111" else
				 SE_9_out when MUX_7_Sel ="110" else
				 SE6_out when MUX_7_Sel ="101" else
				 "0000000000000001" when MUX_7_Sel ="100" else
				 "0000000000000000";
				 
end Struct;
