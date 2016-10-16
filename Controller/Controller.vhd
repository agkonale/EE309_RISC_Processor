library ieee;
use ieee.std_logic_1164.all;




type Controller_State is (	S_init,	S_reg_read,	S_alu_op,	S_reg_write,	S_right_pad,	S_reg_write,			--Abstract type for State representation
							S_mem_read,	S_reg_write_2,	S_reg_write_from_T4,	S_reg_write_from_PE,
							S_reg_read_1,	S_alu_op_immediate_6,	S_mem_write,	S_T3_to_PC,
							S_alu_pad_6,	S_alu_pad_9,	S_write_PC,	S_reg_read_write,
							S_PC_loop,	S_T3_inc,	S_reg_read_from_PE,	S_mem_write_from_T3, S_update_PC );




entity Controller is 
  port (... in std_logic;							
  		IR: in std_logic_vector(15 downto 0);
        clk: in std_logic;
		reset: in std_logic
		mem_read,mem_write,T1_write,C_enable,Z_enable... out std_logic); --Control signals to Datapath
end entity Controller;



architecture Behave of Controller is
  signal State: Controller_State;
  
begin

--State Control Process
	process(reset,clk,IR,State)	
		variable N_State :Controller_State;
	   
		begin
		   -- default values.
		   N_State := S_init;
		   
		   case State is
			when  S_init => 
				case IR(15 downto 12) is
					when "   " =>
						N_State :=

					when "   " =>
						N_State :=



						
				end case;

					

			when  S_reg_read => 
				case IR(15 downto 12) is
					when "   " =>
						if(Flag = ) then		--C/Z 
							N_State := ;
						else 
						
						end if;

					when "   " =>
						if(Flag = ) then
							N_State := ;
						else 
						
						end if;
						

				end case;

				

			
			   
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


