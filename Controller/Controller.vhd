library ieee;
use ieee.std_logic_1164.all;
--library work;
--use work.components.all;


type Controller_State is (	S_init,	S_reg_read,	S_alu_op,	S_reg_write,	S_right_pad,	S_reg_write,			--Abstract type for State representation
							S_mem_read,	S_reg_write_2,	S_reg_write_from_T4,	S_reg_write_from_PE,
							S_reg_read_1,	S_alu_op_immediate_6,	S_mem_write,	S_T3_to_PC,
							S_alu_pad_6,	S_alu_pad_9,	S_write_PC,	S_reg_read_write,
							S_PC_loop,	S_T3_inc,	S_reg_read_from_PE,	S_mem_write_from_T3, S_update_PC );




entity Controller is 
  port (carry_flag, zero_flag: in std_logic;							
  		ir_out: in std_logic_vector(15 downto 0);
        clk: in std_logic;
		reset: in std_logic
		reg_write, PC_write, t1_write, t2_write, t3_write, t4_write, t5_write, mem_write, mem_read, ir_write, clk, reset: out std_logic); --Control signals to Datapath
end entity Controller;



architecture Behave of Controller is
  signal State: Controller_State;
  
begin

--State Control Process
process(reset, clk, ir_out, State)	
		
variable next_State :Controller_State;
	   
begin
		   -- default values.
next_State := S_init;
		   
case State is
		   
	when  S_init => 
				
		case ir_out(15 downto 12) is
			when "0011" =>		--LHI
				next_State := S_right_pad_reg_write;
			when "1000" =>		--JAL
				next_State := S_alu_pad_9;
			when "0110" or "0111" =>			--LM or SM
				next_State := S_reg_read_write;
			when "1001" =>		--JLR
				next_State := S_reg_write_2; 
			when others =>		-- Other cases
				next_state := S_reg_read;
						
		end case;
					

	when  S_reg_read => 
			
		case ir_out(15 downto 12) is
					
			when "0000" or "0010" => -- ADD or NAND
						
				if(ir_out(1 downto 0) = "00" ) then		--ADD or NDU
					next_State:= S_alu_op;
						
				elsif(ir_out(1 downto 0) = "10" ) then 	--ADC or NDC
					if(carry_flag="1") then
						next_State:= S_alu_op;
					else
						next_State:=S_update_PC;
					end if;
							
				elsif(ir_out(1 downto 0) = "01" ) then	--ADZ or NDZ
					if(zero_flag="1") then
						next_State:= S_alu_op;
					else
						next_State:=S_update_PC;
					end if;
				else
						
				end if;
					

				when "0001" or "0100" or "0101" =>	-- ADI or LW or SW
					next_State := S_alu_op_imm6;
				when "1100" => 			-- BEQ
					next_State := S_alu_op;
				when "1001" =>			--JLR
					next_State := S_write_PC;
						
		end case; 

	when S_alu_op =>
		case ir_out(15 downto 12) is		
			when "0000" or "0010" => -- ADD or NAND
				next_State := S_reg_write;
			when "1100" =>		-- BEQ
				next_State := S_alu_pad_6;
		end case;
	
	when S_reg_write =>
		case ir_out(15 downto 12) is
			if( ir_out(11 downto 9) = "111")  then 
				next_State := S_init;
			else
				next_State := S_update_PC;
			end if;
		end case;
	
	when S_update_PC =>
		next_State := S_init;
	
	when S_alu_op_imm6 =>
		case ir_out(15 downto 12) is
			 when "0001" => --ADI
			 	next_State := S_reg_write;
			 when "0100" => --LW
			 	next_State := S_mem_read;
			 when "0101" => -- SW
			 	next_State := S_reg_read1;
		end case;
	
	when S_right_pad_reg_write =>
			if( ir_out(11 downto 9) = "111")  then 
				next_State := S_init;
			else
				next_State := S_update_PC;
			end if;
	
	when S_mem_read =>
		case ir_out(15 downto 12) is
			when "0100" => -- LW
				next_State := S_reg_write_from_T4;
			when "0110" => --LM
				if(zero_flag="1" and ir_out(7)="1") then
					next_State := S_init;
				elsif (zero_flag="1" and ir_out(7)="0") then
					next_State := S_update_PC;
				else
					next_State := S_reg_write_from_PE;
		end case;
	
	when S_reg_write_from_T4 => --LW
			if( ir_out(11 downto 9) = "111")  then 
				next_State := S_init;
			else
				next_State := S_update_PC;
			end if;
	
	when S_reg_read_1 => -- SW
		next_State := S_mem_write;
	
	when S_mem_write => 
		case ir_out(15 downto 12) is
			when "0101" => --SW
				next_State :=S_update_PC;
			when "0111"	=> --SM
				next_State := S_T3_inc;
		end case;
	
	when S_alu_pad_6 =>		-- BEQ
		if ( zero_flag ="1") then 
			next_State := S_T3_to_PC;
		else
			next_State := S_update_PC;
		end if;
		
	when S_T3_to_PC =>
		case ir_out(15 downto 12) is
			when "1100" =>  -- BEQ
				next_State := S_init;
			when "1000" =>	--JAL
				next_State := S_reg_write_2;
		end case;
	
	when S_reg_write_2 =>		
		case ir_out(15 downto 12) is
			when "1000" => -- JAL
				next_State := S_init;
			when "1001" => --JLR 
				next_State := S_reg_read;
		end case;
	
	when S_write_PC => -- JLR
		next_State := S_init;
	
	when S_PC_loop => 
		case ir_out(15 downto 12) is
			when "0110" => -- LM
				next_State := S_mem_read;
			when "0111" => --SM
				next_State := S_reg_read_from_PE;
		end case;
	
	when S_reg_write_from_PE => -- LM
		next_State := S_T3_inc;
	
	when S_reg_read_from_PE =>	--SM
		if ( zero_flag ="1") then 
			next_State := S_update_PC;
		else
			next_State := S_mem_write;
		end if;
		
	when S_T3_inc =>	--SM
		next_State := S_PC_loop;
	
	when S_alu_pad_9 =>	-- JAL 
		next_State := S_T3_to_PC;
	
	when S_reg_read_write =>  --LM or SM
		next_State := S_PC_loop;
				
end case;
		   		   
		   if(clk'event and clk = '0') then
			 if(reset='0') then
			   State <= S_init;
			   
			 else
			   State <= N_State;
			 end if;
		   end if;
		     
	end process;










--Output Logic Process
	process(reset,clk,IR,State)
		begin			   		   
			   if(clk'event and clk = '0') then
				 if(reset='0') then
				 --Default outputs
				   
				 else
					 case State is
						 when  S_init => 

						 
						   						   
						 when  S_reg_read =>
						 
						 

						 when  S_alu_op =>





						 
						   				   
				   	 end case; 
				   
				 end if;
				 
			   end if;	     
	end process;
	
	
end Behave;


