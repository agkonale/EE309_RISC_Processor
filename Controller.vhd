library ieee;
use ieee.std_logic_1164.all;


type Controller_State is (S0,S1,S2,S2,S4);

entity Controller is 
  port (... in std_logic;
        clk: in std_logic;
		reset: in std_logic
		mem_read,mem_write,T1_write... out std_logic);
end entity Controller;


architecture Behave of Controller is
  signal State, N_State: Controller_State;
  
begin
	process(mem_read,mem_write,T1_write...,reset,clk,Controller_State)	
	   
		begin
		   -- default values.
		   N_State <= S0;
		   
		   case State is
			 when  S0 => 
			   if() then
				 N_State <= ;
			   end if;

			  when  S1 => 
			   if() then
				 N_State <= ;
			   end if;
			   
		   end case; 

		   		   
		   if(clk'event and clk = '1') then
			 if(reset='1') then
			   State <= S0;
			   
			 else
			   State <= N_State;
			 end if;
		   end if;
		     
	end process;
	
end Behave;


