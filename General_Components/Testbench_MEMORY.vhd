library ieee;
use ieee.std_logic_1164.all;
library std;
use std.textio.all;
library work;
use work.General_Components.all;

entity Testbench_MEMORY is
end entity;

architecture Behave of Testbench_MEMORY is
signal Din,Dout: std_logic_vector(15 downto 0);
signal Address : std_logic_vector(4 downto 0);
signal clk,mem_write,mem_read,reset : std_logic;
	
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


begin
  process 
    variable err_flag : boolean := false;
    File INFILE: text open read_mode is "TRACEFILE_MEMORY.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_MEMORY.txt";


    variable input_vector1: bit_vector ( 15 downto 0);
    variable input_vector2: bit_vector ( 4 downto 0);
    variable input_vector3: bit;	--clk
    variable input_vector4: bit;	--mem write
    variable input_vector5: bit;	--mem read
    variable input_vector6: bit;	--reset
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
	  		read (INPUT_LINE, input_vector3);
		  	read (INPUT_LINE, input_vector4);
		  	read (INPUT_LINE, input_vector5);
		  	read (INPUT_LINE, input_vector6);
		  	read (INPUT_LINE, output_vector);

		    for i in 0 to 15 loop
		  		Din(i) <= to_std_logic(input_vector1(i));
			end loop;

			for i in 0 to 4 loop
				Address(i) <= to_std_logic(input_vector2(i));
			end loop;

			clk<= to_std_logic(input_vector3);
			mem_write<= to_std_logic(input_vector4);
			mem_read<= to_std_logic(input_vector5);
			reset<= to_std_logic(input_vector6);  
		      
		    wait for 5 ns;

		     
			for i in 0 to 15 loop
				if (Dout(i) /= to_std_logic(output_vector(i))) then
					write(OUTPUT_LINE,to_string("ERROR: in s0, line "));
					write(OUTPUT_LINE, LINE_COUNT);
					writeline(OUTFILE, OUTPUT_LINE);
					err_flag := true;
				end if;
			end loop;
		      --------------------------------------
		end loop;

		assert (err_flag) report "SUCCESS, all tests passed." severity note;
		assert (not err_flag) report "FAILURE, some tests failed." severity error;
		wait;
  	end process;

	dut:MEMORY
	 port map(Din => Din,
		      Dout => Dout,
		      Address => Address,
		   	  clk=>clk,mem_write=>mem_write,
		   	  mem_read=>mem_read,reset=>reset);
end Behave;


