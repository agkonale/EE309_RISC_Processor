library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components.all;


entity datapath is
   port (reg_write, PC_write, t1_write, t2_write, t3_write, t4_write, t5_write, mem_write, mem_read, se_dash_9, se_9, se_6, ir_write, clk, reset: in std_logic; 
   		 alu_control: in std_logic_vector (2 downto 0); 
   		 A1, A2, A3 : in std_logic_vector (2 downto 0);
   		 carry_flag, zero_flag : out std_logic; 
   		 ir_out : out std_logic_vector(15 downto 0)
   		);
end entity;


architecture Struct of datapath is

signal data_out, data_in, DPC, D3, reg_file_D1, reg_file_D2, reg_file_D3, PC, T1_in, T1_out, T2_in, T2_out, T3_in, T3_out, T4_in, T4_out, T5_in, T5_out : std_logic_vector(15 downto 0) := (others => '0'); 
signal address, 

begin

	memory : MEMORY port map (Address => address, Din => data_in, Dout => data_out, clk => clk, mem_write => mem_write, mem_read => mem_read, reset => reset); 
	register_file : REGISTER_FILE port map ( A1 => A1, A2 => A2, A3 => A3, DPC => DPC, D3 => reg_file_D3, reg_write => reg_write ,PC_write => PC_write, D1 => reg_file_D1, D2 => reg_file_D2, PC => PC, clk => clk, reset => reset );
	
	temporary_ register_1 : DATA_REGISTER generic map (data_width => 16)
											port map (Din => T1_in, Dout => T1_out, clk => clk, enable => T1_write, reset => reset);
	temporary_ register_2 : DATA_REGISTER generic map (data_width => 16)
											port map (Din => T2_in, Dout => T2_out, clk => clk, enable => T2_write, reset => reset);
	temporary_ register_3 : DATA_REGISTER generic map (data_width => 16)
											port map (Din => T3_in, Dout => T3_out, clk => clk, enable => T3_write, reset => reset);
	temporary_ register_4 : DATA_REGISTER generic map (data_width => 16)
											port map (Din => T4_in, Dout => T4_out, clk => clk, enable => T4_write, reset => reset);
	temporary_ register_5 : DATA_REGISTER generic map (data_width => 16)
											port map (Din => T5_in, Dout => T5_out, clk => clk, enable => T5_write, reset => reset);											


-- The transfers
	
		
	
end Struct;
