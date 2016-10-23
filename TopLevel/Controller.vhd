library ieee;
use ieee.std_logic_1164.all;

library work;
use work.General_Components.all;

entity Controller is 
  port (
<<<<<<< HEAD
			 clk:				in std_logic;
			 reset: 			in std_logic; 
			 carry_flag: 		in std_logic; 
	   		 zero_flag : 		in std_logic;    		 
	   		 ir_out: 			in std_logic_vector(15 downto 0);

	   		 STATE_ID:			out std_logic_vector(4 downto 0);
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
=======
		 clk, reset: in std_logic; 
   
   		 reg_write, PC_write, ir_write: out std_logic;
   		 mem_write, mem_read:out std_logic;
   		 
   		 t1_write, t2_write, t3_write, t4_write, t5_write: out std_logic;
   		  		 
   		 Set_Pos_Zero_init,PE_write,PE_reg_write: out std_logic; 
   		 
   		 alu_control: out std_logic_vector (1 downto 0); 
		 alu_enable: out std_logic;
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
>>>>>>> 34c43bcbc82c4e28583416c49a5187725a0088e1
end entity Controller;





architecture Behave of Controller is
signal State,Next_State: Controller_State;

begin
process(clk)			
begin

if(clk'event and clk = '1') then

STATE_ID <= Symbol_To_BV(State);

	if(reset='1') then
		 State <= S_init;
		 
		 reg_write <= '0';
		 PC_write <= '0';
		 ir_write <= '0';
		 mem_write <= '0';
		 mem_read <= '0';

		 t1_write <= '0';
		 t2_write <= '0';
		 t3_write <= '0';
		 t4_write <= '0';
		 t5_write <= '0';

		 PE_write <= '0';
		 PE_reg_write <= '0';

		 alu_control <= "11";

		 Set_Pos_Zero_init <= '0';

		 MUX_1_Sel <="00";
		 MUX_2_Sel <="00";
		 MUX_3_Sel <="00"; 
		 MUX_4_Sel <="000";
		 MUX_5_Sel <="00";
		 MUX_6_Sel <="000";
		 MUX_7_Sel <="000";

		 c_write <='0';
		 z_write <= '0';
	else
		 reg_write <= '0';
		 PC_write <= '0';
		 ir_write <= '0';
		 mem_write <= '0';
		 mem_read <= '0';

		 t1_write <= '0';
		 t2_write <= '0';
		 t3_write <= '0';
		 t4_write <= '0';
		 t5_write <= '0';

		 PE_write <= '0';
		 PE_reg_write <= '0';

		 alu_control <= "11";

		 Set_Pos_Zero_init <= '0';

		 MUX_1_Sel <="00";
		 MUX_2_Sel <="00";
		 MUX_3_Sel <="00"; 
		 MUX_4_Sel <="000";
		 MUX_5_Sel <="00";
		 MUX_6_Sel <="000";
		 MUX_7_Sel <="000";

		 c_write <='0';
		 z_write <= '0';
		 
	
		 case State is	
			   
			when  S_init => 										
				State <=  S_init_wait_1;	
				MUX_1_Sel 	<= "11";				
				mem_read 	<= '1';
				
<<<<<<< HEAD
				
			when S_init_wait_1 =>			
				State <=  S_init_wait_2;
				
				ir_write 	<= '1';
				
				t5_write 	<= '1';
				alu_enable 	<= '1';
				
				MUX_6_Sel 	<= "111";
				MUX_7_Sel 	<= "100";
				
				alu_control <= "00";
=======
		case ir(15 downto 12) is
			when "0011" =>		--LHI
				next_State := S_right_pad_reg_write;
			when "1000" =>		--JAL
				next_State := S_alu_pad_9;
			when "0110" =>			--LM
				next_State := S_reg_read_write;
			when "0111" =>			--SM
				next_State := S_reg_read_write;				
			when "1001" =>		--JLR
				next_State := S_reg_write_2; 
			when others =>		-- Other cases
				next_state := S_reg_read;
						
		end case;
					
>>>>>>> 34c43bcbc82c4e28583416c49a5187725a0088e1

			
			when S_init_wait_2 =>	
				State 		<=  S_init_branch;
				
					
<<<<<<< HEAD
			when S_init_branch =>			
				if (ir_out(15 downto 12) = "0011") then			--LHI
					State <= S_right_pad_reg_write;
				elsif (ir_out(15 downto 12) = "1000") then		--JAL
					State <= S_alu_pad_9;
				elsif (ir_out(15 downto 12) = "0110" or ir_out(15 downto 12) = "0111") then	--LM or SM
					State <= S_reg_read_write;
				elsif ir_out(15 downto 12) = "1001" then		--JLR
					State <= S_reg_write_2; 
				elsif (ir_out(15 downto 12) = "1111") then		--HALT
					State <= S_halt;
				else										-- Other cases
					State <= S_reg_read;	
				end if;
				
			when S_halt =>
				State <= S_halt;
			
			when  S_reg_read => 		
											
				if ir_out(15 downto 12) ="0000" or ir_out(15 downto 12) = "0010"  then -- ADD or NAND						
					if(ir_out(1 downto 0) = "00" ) then		--ADD or NDU
						State <= S_alu_op;					
					elsif(ir_out(1 downto 0) = "10" ) then 	--ADC or NDC
						if(carry_flag = '1') then
							State <= S_alu_op;
						else
							State <=S_update_PC;
						end if;						
					elsif(ir_out(1 downto 0) = "01" ) then	--ADZ or NDZ
						if(zero_flag= '1') then
							State <= S_alu_op;
						else
							State <=S_update_PC;
						end if;
=======
			when "0000" => -- ADD 
						
				if(ir(1 downto 0) = "00" ) then		--ADD or NDU
					next_State:= S_alu_op;
						
				elsif(ir(1 downto 0) = "10" ) then 	--ADC or NDC
					if(carry_flag = '1') then
						next_State:= S_alu_op;
					else
						next_State:=S_update_PC;
					end if;
							
				elsif(ir(1 downto 0) = "01" ) then	--ADZ or NDZ
					if(zero_flag= '1') then
						next_State:= S_alu_op;
					else
						next_State:=S_update_PC;
					end if;
				else
						
				end if;
				
			when "0010" => -- NAND
						
				if(ir(1 downto 0) = "00" ) then		--ADD or NDU
					next_State:= S_alu_op;
						
				elsif(ir(1 downto 0) = "10" ) then 	--ADC or NDC
					if(carry_flag = '1') then
						next_State:= S_alu_op;
					else
						next_State:=S_update_PC;
					end if;
							
				elsif(ir(1 downto 0) = "01" ) then	--ADZ or NDZ
					if(zero_flag= '1') then
						next_State:= S_alu_op;
					else
						next_State:=S_update_PC;
>>>>>>> 34c43bcbc82c4e28583416c49a5187725a0088e1
					end if;
								
				elsif (ir_out(15 downto 12) = "0001" or ir_out(15 downto 12) ="0100" or ir_out(15 downto 12) ="0101") then	-- ADI or LW or SW
					State <= S_alu_op_imm_6;
					
				elsif ir_out(15 downto 12) =  "1100" then 			-- BEQ
					State <= S_alu_op;
					
				elsif ir_out(15 downto 12) = "1001" then			--JLR
					State <= S_write_PC;
			
				end if;
				
				t1_write <= '1';
				t2_write <= '1';						 						 
				MUX_2_Sel <="10";


			when S_alu_op =>			
				if ir_out(15 downto 12) = "0000" or ir_out(15 downto 12) = "0010" then  -- ADD or NAND
					State <= S_reg_write;
				elsif ir_out(15 downto 12) = "1100" then	-- BEQ
					State <= S_alu_pad_6;
				else									-- Other cases
					State <= S_init;
				end if;


				t3_write <= '1';
				alu_enable <= '1';
				c_write <= '1';
				z_write <= '1';

				if (ir_out(15 downto 13) = "000") then	-- ADD/ADI
					alu_control<="00";
				elsif (ir_out(15 downto 12) = "0010") then	--NAND
					alu_control<="01";
				elsif (ir_out(15 downto 12) = "1100") then  -- BEQ
					alu_control<="10";
				end if;

				MUX_6_Sel <="110";
				MUX_7_Sel <="111";
		

		
			when S_reg_write =>	
				if( ir_out(11 downto 9) = "111")  then 
					State <= S_init;
				else
					State <= S_update_PC;
				end if;

<<<<<<< HEAD
				reg_write 	<='1';	
				
				if( ir_out(15 downto 13) = "0001")  then  --ADI
				MUX_3_Sel 	<="01"; 
				MUX_4_Sel 	<="111";
				
				else 							 			 
				MUX_3_Sel 	<="11"; 
				MUX_4_Sel 	<="111";
				end if;
=======
			when "0001" =>	--ADI
				next_State := S_alu_op_imm_6;
			when "0100" =>	--LW
				next_State := S_alu_op_imm_6;
			when "0101" =>	--SW
				next_State := S_alu_op_imm_6;
			when "1100" => 			-- BEQ
				next_State := S_alu_op;
			when "1001" =>			--JLR
				next_State := S_write_PC;
				
			when others =>		-- Other cases
				next_state := S_init;
						
		end case; 

	when S_alu_op =>
		case ir(15 downto 12) is		
			when "0000" =>	--AND
				next_State := S_reg_write;
			when "0010" => -- NAND
				next_State := S_reg_write;
			when "1100" =>		-- BEQ
				next_State := S_alu_pad_6;

			when others =>		-- Other cases
				next_state := S_init;
		end case;
	
	when S_reg_write =>	
		if( ir(11 downto 9) = "111")  then 
			next_State := S_init;
		else
			next_State := S_update_PC;
		end if;
>>>>>>> 34c43bcbc82c4e28583416c49a5187725a0088e1
		

	
			when S_update_PC =>
				State <= S_init;

				PC_write <= '1';				 
		 		MUX_5_Sel <="01";
		 		

	
			when S_alu_op_imm_6 =>		
				 if ir_out(15 downto 12) = "0001" then 		--ADI
				 	State <= S_reg_write;
				 elsif ir_out(15 downto 12) = "0100" then 	--LW
				 	State <= S_mem_read;
				 elsif ir_out(15 downto 12) = "0101" then	-- SW
				 	State <= S_reg_read_1;
				end if;

				t3_write <= '1'; 	
			 	alu_enable <= '1';
			 	alu_control <= "00";
				c_write <= '1';
			 	z_write <= '1';	 				 	 
				MUX_6_Sel <="110";
				MUX_7_Sel <="101";


			
			when S_right_pad_reg_write =>
				if( ir_out(11 downto 9) = "111")  then 
					State <= S_init;
				else
					State <= S_update_PC;
				end if;

				reg_write <='1';				   			
				MUX_3_Sel <="11"; 
		 		MUX_4_Sel <="110";


	
			when S_mem_read =>		
				State <= S_mem_read_2;			 	
			 	mem_read <= '1';				 	
				MUX_1_Sel <="10";


		    when S_mem_read_2 =>
		    	if ir_out(15 downto 12) = "0100" then	-- LW
					State <= S_reg_write_from_T4;
				elsif ir_out(15 downto 12) =  "0110" then --LM
					if(zero_flag= '1' and ir_out(7)= '1') then
						State <= S_init;
					elsif (zero_flag= '1' and ir_out(7)= '0') then
						State <= S_update_PC;
					else
						State <= S_reg_write_from_PE;
					end if;
				end if;
				t4_write <= '1';	
		    	
	
			when S_reg_write_from_T4 => --LW
				if( ir_out(11 downto 9) = "111")  then 
					State <= S_init;
				else
					State <= S_update_PC;
				end if;

				reg_write <='1';				   	 			   					 
				MUX_3_Sel <="11"; 
				MUX_4_Sel <="100";
				
				z_write <= '1';
				alu_enable <= '1';
				alu_control <= "10";
				MUX_6_Sel <="100";
				

	
			when S_reg_read_1 => -- SW
				State <= S_mem_write;
			
				t1_write <= '1';				   	 					 
				MUX_2_Sel <="10";


	
			when S_mem_write => 
				if ir_out(15 downto 12) = "0101" then 		--SW
					State <=S_update_PC;
				elsif ir_out(15 downto 12) = "0111" then 	--SM
					State <= S_T3_inc;
				else										-- Other cases
					State <= S_init;
				end if;

				MUX_1_Sel <="10";
				mem_write <= '1';
				

	
			when S_alu_pad_6 =>		-- BEQ
				if (zero_flag = '1') then 
					State <= S_T3_to_PC;
				else
					State <= S_update_PC;
				end if;

				c_write <= '1';
				z_write <= '1';
				t3_write <= '1';				 						
				MUX_6_Sel <="111";
				MUX_7_Sel <="101";
				alu_enable <= '1';
				alu_control <= "00";

		
		
		
			when S_T3_to_PC =>			
				if ir_out(15 downto 12) = "1100" then  -- BEQ
					State <= S_init;
				elsif ir_out(15 downto 12) =  "1000" then	--JAL
					State <= S_reg_write_2;

				end if;

				PC_write <= '1';	   	 						 
				MUX_5_Sel <="11";

	
			when S_reg_write_2 =>					
				if ir_out(15 downto 12) = "1000" then -- JAL
					State <= S_init;
				elsif ir_out(15 downto 12) = "1001" then --JLR 
					State <= S_reg_read;
				end if;

				reg_write <='1';				 	
				MUX_3_Sel <="11"; 
				MUX_4_Sel <="101";


	
			when S_write_PC => -- JLR
				State <= S_init;

				PC_write <= '1';			   	 
				MUX_5_Sel <="10";

		
		
	
			when S_PC_loop => 	
				if ir_out(15 downto 12) = "0110" then 		-- LM
					State <= S_mem_read;
				elsif ir_out(15 downto 12) = "0111" then 	--SM
					State <= S_reg_read_from_PE;
				end if;
		
				PE_write <= '1';				 	

	
			when S_reg_write_from_PE => -- LM
				State <= S_T3_inc;
				
				reg_write <='1';				 						 
				MUX_3_Sel <="10"; 
				MUX_4_Sel <="100";
		
		
	
			when S_reg_read_from_PE =>	--SM
				if (zero_flag = '1') then 
					State <= S_update_PC;
				else
					State <= S_mem_write;
				end if;

				t1_write <= '1';
			 	MUX_2_Sel <="01";

	
			when S_T3_inc =>	--SM
				State <= S_PC_loop;
				
				t3_write <= '1';				 	
			 	alu_enable <= '1';
			 	alu_control <= "00";			
				MUX_6_Sel <="101";
				MUX_7_Sel <="100";
				
		

<<<<<<< HEAD
	
			when S_alu_pad_9 =>	-- JAL 
				State <= S_T3_to_PC;
				
				t3_write <= '1';				 	
			 	alu_enable <= '1';	
			 	alu_control <= "00";			
				MUX_6_Sel <="111";
				MUX_7_Sel <="110";
		
=======
--Output Logic Process
	process(reset,clk,IR,State)
		begin			   		   
			   if(clk'event and clk = '1') then
				 if(reset='1') then
				 --Default outputs
			 	     reg_write <= '0';
			 	     PC_write <= '0';
			 	     ir_write <= '0';
	 			     mem_write <= '0';
	 			     mem_read <= '0';
	 
	 			     t1_write <= '0';
	 			     t2_write <= '0';
	 			     t3_write <= '0';
	 			     t4_write <= '0';
	 			     t5_write <= '0';
	  		 
   	 			     PE_write <= '0';
	 			     PE_reg_write <= '0';
	 
					 alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";

					 c_write <='0';
					 z_write <= '0';

						 	
				 else
					 case State is
					 
						 when  S_init => 
						 	reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '1';
						 	mem_write <= '0';
						 	mem_read <= '1';
						 	ir_write <= '1';
						 	alu_enable <= '1';
						 	c_write <= '0';
						 	z_write <= '0';

					 alu_control <= "00";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="11";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="11";
					 MUX_7_Sel <="100";
						 	
						 when  S_reg_read =>
						 	reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '1';
						 	t2_write <= '1';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
						 	c_write <= '0';
						 	z_write <= '0';

					 alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="11";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
						 						 	  
						 when  S_alu_op =>
					 		reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '1';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '1';
							c_write <= '1';
						 	z_write <= '1';
						 	
						 	if (ir(15 downto 13) = "000") then	-- ADD/ADI
						 		alu_control<="00";
						 	elsif (ir(15 downto 12) = "0010") then	--NAND
						 		alu_control<="01";
						 	elsif (ir(15 downto 12) = "1100") then  -- BEQ
						 		alu_control<="10";
						 	else
						 		alu_control<="11";
							end if;
					
					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="10";
					 MUX_7_Sel <="111";
						 	  
						when S_reg_write =>
				 			reg_write <='1';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';

					alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="11"; 
					 MUX_4_Sel <="111";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
						 when S_right_pad_reg_write =>
				 			reg_write <='1';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
						   			
						   	alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="11"; 
					 MUX_4_Sel <="110";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";		
						   				   
						 when S_mem_read =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '1';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '1';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
						 	alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="10";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
						 	
						when S_reg_write_2 =>
				 			reg_write <='1';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
						 	
						 	alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="11"; 
					 MUX_4_Sel <="101";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
					 	when S_reg_write_from_T4 =>
				 			reg_write <='1';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
				   	 
				   	 alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="11"; 
					 MUX_4_Sel <="100";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
				   	 
				   	 	when S_reg_write_from_PE =>
				 			reg_write <='1';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
						 	
						 	alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="10"; 
					 MUX_4_Sel <="100";
					 MUX_5_Sel <="00"; 
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
						 	
						when S_reg_read_1 =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '1';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
				   	 
				   	 alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="10";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
				   	 
				   	 	when S_alu_op_imm_6 =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '1';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '1';
							c_write <= '1';
						 	z_write <= '1';
						 	
						 	alu_control <= "00";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00"; 
					 MUX_6_Sel <="10";
					 MUX_7_Sel <="101";
						 	
						when S_mem_write =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '1';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
				   	 alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00"; 
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
				   	 
				   	 
				   	 	when S_T3_to_PC =>
				 			reg_write <='0';
						 	PC_write <= '1';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
				   	 	
				   	 	alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="11";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
				   	 	
				   	 	when S_alu_pad_6 =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '1';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '1';
							c_write <= '0';
						 	z_write <= '0';
				   	 
				   	 alu_control <= "00";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="11";
					 MUX_7_Sel <="101";
				   	 
				   	 	when S_write_PC =>
				 			reg_write <='0';
						 	PC_write <= '1';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
				   	 
				   	 alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="10";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
				   	 
				   	 	when S_PC_loop =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
						 	PE_write <= '1';
						 	PE_reg_write <= '0';
 
 
 alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00"; 
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";
				   	 	
				   	 	when S_T3_inc =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '1';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '1';
							c_write <= '0';
						 	z_write <= '0';
						 	PE_write <= '0';
						 	PE_reg_write <= '0';
	
		alu_control <= "00";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00"; 
					 MUX_6_Sel <="01";
					 MUX_7_Sel <="100";
				   	 	
				   	 	when S_alu_pad_9 =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '1';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '1';
							c_write <= '0';
						 	z_write <= '0';
						 	PE_write <= '0';
						 	PE_reg_write <= '0';

alu_control <= "00";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="11";
					 MUX_7_Sel <="110";

				   	 	when S_reg_read_write =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '1';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
						 	PE_write <= '0';
						 	PE_reg_write <= '1';

alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="10";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";

				   	 	when S_reg_read_from_PE =>
				 			reg_write <='0';
						 	PC_write <= '0';
						 	t1_write <= '1';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
						 	PE_write <= '0';
						 	PE_reg_write <= '0';

alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="01";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="00"; 
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";

				   	 	when S_update_PC=>
				 			reg_write <='0';
						 	PC_write <= '1';
						 	t1_write <= '0';
						 	t2_write <= '0';
						 	t3_write <= '0';
						 	t4_write <= '0';
						 	t5_write <= '0';
						 	mem_write <= '0';
						 	mem_read <= '0';
						 	ir_write <= '0';
						 	alu_enable <= '0';
							c_write <= '0';
						 	z_write <= '0';
						 	PE_write <= '0';
						 	PE_reg_write <= '0';

alu_control <= "11";

					 Set_Pos_Zero_init <= '0';

					 MUX_1_Sel <="00";
					 MUX_2_Sel <="00";
					 MUX_3_Sel <="00"; 
					 MUX_4_Sel <="000";
					 MUX_5_Sel <="01";
					 MUX_6_Sel <="00";
					 MUX_7_Sel <="000";


				   	 end case; 
				   
				 end if;
				 
			   end if;	     
	end process;
>>>>>>> 34c43bcbc82c4e28583416c49a5187725a0088e1
	
			when S_reg_read_write =>  --LM or SM
				State <= S_PC_loop;

				Set_Pos_Zero_init <= '1';
				t3_write <= '1';				 	
			 	PE_reg_write <= '1';				 
				MUX_2_Sel <="10";
					
		end case;
	end if;   
end if;
			        
end process;

	
end Behave;


