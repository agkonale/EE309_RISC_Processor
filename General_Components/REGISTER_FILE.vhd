library ieee;
use ieee.std_logic_1164.all;

library work;
use work.General_Components.all;


entity Register_File is
	port (A1,A2,A3 :in std_logic_vector(2 downto 0);D3: in std_logic_vector(15 downto 0); reg_write: in std_logic;D1,D2: out std_logic_vector(15 downto 0);
		  clk: in std_logic);
end entity;



architecture Behave of Register_File is

signal reg_write_enable :std_logic_vector(7 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7 :std_logic_vector(15 downto 0);

begin
	REG_0 :DATA_REGISTER 
	generic map(16)
	port map(D3,R0,clk, reg_write_enable(0));
	
	REG_1 :DATA_REGISTER 
	generic map(16)
	port map(D3,R1,clk, reg_write_enable(1));
	
	REG_2 :DATA_REGISTER
	generic map(16)
	port map(D3,R2,clk, reg_write_enable(2));
	
	REG_3 :DATA_REGISTER 
	generic map(16)
	port map(D3,R3,clk, reg_write_enable(3));
	
	REG_4 :DATA_REGISTER 
	generic map(16)
	port map(D3,R4,clk, reg_write_enable(4));
	
	REG_5 :DATA_REGISTER 
	generic map(16)
	port map(D3,R5,clk, reg_write_enable(5));
	
	REG_6 :DATA_REGISTER 
	generic map(16)
	port map(D3,R6,clk, reg_write_enable(6));
	
	REG_7 :DATA_REGISTER 
	generic map(16)
	port map(D3,R7,clk, reg_write_enable(7));


	DMX : DEMUX port map(A3,reg_write_enable) ;

	MUX_0 :MUX_16_8 port map(R0,R1,R2,R3,R4,R5,
							R6,R7,A1,D1);
							
	MUX_1 :MUX_16_8 port map(R0,R1,R2,R3,R4,R5,
							R6,R7,A2,D2);		

				
end Behave;

