library ieee;
use ieee.std_logic_1164.all;

library work;
use work.General_Components.all;
use work.ALU_Components.all;

library std;
use std.textio.all;

entity Testbench_ALU is

end entity;





architecture Behave of Testbench_ALU is
  

signal OP_Sel : std_logic_vector(1 downto 0);
signal X0,X1,Y: std_logic_vector(15 downto 0); 
signal C_FLAG,Z_FLAG,clk,reset,C_enable,Z_enable: std_logic;


	
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
    File INFILE: text open read_mode is "TRACEFILE_ALU.txt";
    FILE OUTFILE: text  open write_mode is "OUTPUTS_ALU.txt";



    variable input_vector1: bit_vector ( 1 downto 0);	--op_sel
    variable input_vector2: bit;						--c_enable
    variable input_vector3: bit;						--z_enable
    variable input_vector4: bit;						--clk
    variable input_vector5: bit;						--reset
    variable input_vector6: bit_vector  (15 downto 0);	--x0
    variable input_vector7: bit_vector	(15 downto 0);	--x1
    variable output_vector1: bit_vector	(15 downto 0);	--y  
    variable output_vector2: bit;						--c_flag
    variable output_vector3: bit;						--z_flag
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
      read (INPUT_LINE, output_vector1);
	  read (INPUT_LINE, output_vector2);
	  read (INPUT_LINE, output_vector3);
	
        for i in 0 to 1 loop
      OP_Sel(i) <= to_std_logic(input_vector1(i));
      
    end loop;

	for i in 0 to 15 loop
      X0(i) <= to_std_logic(input_vector6(i));
    end loop;

	for i in 0 to 15 loop
      X1(i) <= to_std_logic(input_vector7(i));
    end loop;


	clk<= to_std_logic(input_vector4);
	reset<= to_std_logic(input_vector5);
	C_enable<=to_std_logic(input_vector2);
	Z_enable<=to_std_logic(input_vector3);
        
	for i in 0 to 15 loop
      Y(i) <= to_std_logic(output_vector1(i));
    end loop;
  
          wait for 5 ns;

         
	for i in 0 to 15 loop
	  if (Y(i) /= to_std_logic(output_vector1(i)))  then
             write(OUTPUT_LINE,to_string("ERROR: in Y, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          end if;
	end loop;

	  if (C_FLAG /= to_std_logic(output_vector2)) then
             write(OUTPUT_LINE,to_string("ERROR: in CARRY, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          end if;

	if (Z_FLAG /= to_std_logic(output_vector3))  then
             write(OUTPUT_LINE,to_string("ERROR: in ZERO, line "));
             write(OUTPUT_LINE, LINE_COUNT);
             writeline(OUTFILE, OUTPUT_LINE);
             err_flag := true;
          end if;
          --------------------------------------
    end loop;

    assert (err_flag) report "SUCCESS, all tests passed." severity note;
    assert (not err_flag) report "FAILURE, some tests failed." severity error;
    wait;
  end process;

 dut:ALU
     port map(OP_Sel=>OP_Sel,X0 => X0,X1 => X1,Y => Y,
              Z_enable => Z_enable,C_enable => C_enable,
			Z_FLAG => Z_FLAG,C_FLAG => C_FLAG,
	       clk=>clk,reset=>reset);

end Behave;
