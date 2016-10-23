library ieee;
use ieee.std_logic_1164.all;

library std;
use std.textio.all;

library work;
use work.General_Components.all;

entity Testbench_TOP_LEVEL is
end entity;

architecture Behave of Testbench_TOP_LEVEL is

function to_std_logic(x: bit) return std_logic is
	variable ret_val: std_logic;
  	begin     
      if (x = '1') then
        ret_val := '1';
      else 	
        ret_val := '0';
      end if;   
      return(ret_val);
end to_std_logic;

function to_string(x: string) return string is
	variable ret_val: string(1 to x'length);
    alias lx : string (1 to x'length) is x;
	begin  
      ret_val := lx;
      return(ret_val);
end to_string;

signal clk, reset: std_logic;
signal cpu_output: std_logic_vector(15 downto 0);
signal ir: 		   std_logic_vector(15 downto 0);
signal STATE_ID:   std_logic_vector(4 downto 0);
signal Program_Counter: std_logic_vector(15 downto 0);

begin
  process 
    variable err_flag : boolean := false;
    File INFILE: text open read_mode is "TRACEFILE_TOP_LEVEL.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_TOP_LEVEL.txt";
   
    variable input_vector1: bit;		--clk  
    variable input_vector2: bit;		--reset
    variable output_vector: bit_vector ( 15 downto 0);
    ----------------------------------------------------
    variable INPUT_LINE: Line;
    variable OUTPUT_LINE: Line;
    variable LINE_COUNT: integer := 0;
	begin
		while not endfile(INFILE) loop 
			LINE_COUNT := LINE_COUNT + 1;	
	  		readLine (INFILE, INPUT_LINE);
		    read (INPUT_LINE, input_vector1);
	  		read (INPUT_LINE, input_vector2);
		  	

			clk<= to_std_logic(input_vector1);
			reset<= to_std_logic(input_vector2);  
		      
		    wait for 5 ns;

		    
		      --------------------------------------
		end loop;

		
		wait;
  	end process;

	dut:TOP_LEVEL
	port map(	clk, reset,
	 	   		cpu_output,
	 	   		ir,
	 	   		Program_Counter,
	 	   		STATE_ID); 
	 	   		
end Behave;
