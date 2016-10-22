library ieee;
use ieee.std_logic_1164.all;

library work;
use work.General_Components.all;
library std;
use std.textio.all;

entity Testbench_REGISTER_FILE is
end entity;
architecture Behave of Testbench_REGISTER_FILE is
  

signal A1,A2,A3 : std_logic_vector(2 downto 0);
signal DPC,D3: std_logic_vector(15 downto 0);
signal reg_write,PC_write: std_logic;
signal D1,D2,PC: std_logic_vector(15 downto 0); 
signal clk,reset: std_logic;
	
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
    File INFILE: text open read_mode is "TRACEFILE_REGISTER_FILE.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_REGISTER_FILE.txt";

    variable input_vector1: bit_vector ( 2 downto 0);	--a1
    variable input_vector2: bit_vector ( 2 downto 0);	--a2
    variable input_vector3: bit_vector	(2 downto 0);	--a3
    variable input_vector4: bit_vector (15 downto 0);	--dpc
    variable input_vector5: bit_vector	(15 downto 0);	--d3
    
    variable input_vector6: bit;	--reg_write
    variable input_vector7: bit;	--PC_write
   
    variable input_vector8: bit;	--clk
    variable input_vector9: bit;	--reset

    variable output_vector1: bit_vector	(15 downto 0);	--d1
    variable output_vector2: bit_vector (15 downto 0);	--d2
    variable output_vector3: bit_vector	(15 downto 0);	--pc
    
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
	  read (INPUT_LINE, input_vector7);
      read (INPUT_LINE, input_vector8);
      read (INPUT_LINE, input_vector9);

      read (INPUT_LINE, output_vector1);
	  read (INPUT_LINE, output_vector2);
	  read (INPUT_LINE, output_vector3);


	clk<= to_std_logic(input_vector8);
	reset<= to_std_logic(input_vector9);
	  
	reg_write<=to_std_logic(input_vector6);	
	PC_write<=to_std_logic(input_vector7);
	
    for i in 0 to 2 loop
      A1(i) <= to_std_logic(input_vector1(i));
    end loop;

	for i in 0 to 2 loop
      A2(i) <= to_std_logic(input_vector2(i));
    end loop;

	for i in 0 to 2 loop
      A3(i) <= to_std_logic(input_vector3(i));
    end loop;
	
	for i in 0 to 15 loop
      DPC(i) <= to_std_logic(input_vector4(i));
    end loop;

	for i in 0 to 15 loop
      D3(i) <= to_std_logic(input_vector5(i));
    end loop;
    
	
	
	    
    wait for 5 ns;

        
	for i in 0 to 15 loop
	  if (D1(i) /= to_std_logic(output_vector1(i)))  then
             write(OUTPUT_LINE,to_string("ERROR: in D1, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          end if;
	end loop;

	for i in 0 to 15 loop
	  if (D2(i) /= to_std_logic(output_vector2(i))) then
             write(OUTPUT_LINE,to_string("ERROR: in D2, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          end if;
	end loop;

	for i in 0 to 15 loop
	  if (PC(i) /= to_std_logic(output_vector3(i)))  then
             write(OUTPUT_LINE,to_string("ERROR: in PC, line "));
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

 dut:REGISTER_FILE
     port map(A1 => A1,A2 => A2,A3 => A3,
              DPC => DPC,D3 => D3,
			  reg_write => reg_write,PC_write => PC_write,
              D1 => D1,D2 => D2,PC => PC,
	          clk=>clk,reset=>reset);

end Behave;
