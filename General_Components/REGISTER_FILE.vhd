library ieee;
use ieee.std_logic_1164.all;

library work;
use work.General_Components.all;


entity REGISTER_FILE is
	port (A1,A2,A3 :in std_logic_vector(2 downto 0);	DPC,D3: in std_logic_vector(15 downto 0); 
		 reg_write,PC_write: in std_logic;	D1,D2,PC: out std_logic_vector(15 downto 0); clk,reset: in std_logic);
end entity;



architecture Behave of REGISTER_FILE is

signal DMX_OUT,enable :std_logic_vector(7 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7 :std_logic_vector(15 downto 0);
signal Sig_R7 :std_logic_vector(15 downto 0);

begin

	enable(0)<= DMX_OUT(0) and reg_write;
	enable(1)<= DMX_OUT(1) and reg_write;
	enable(2)<= DMX_OUT(2) and reg_write;
	enable(3)<= DMX_OUT(3) and reg_write;
	enable(4)<= DMX_OUT(4) and reg_write;
	enable(5)<= DMX_OUT(5) and reg_write;
	enable(6)<= DMX_OUT(6) and reg_write;
	enable(7)<= (DMX_OUT(7) and reg_write) or PC_write;

	REG_0 :DATA_REGISTER 
	generic map(16)
	port map(D3,R0,clk,enable(0),reset);
	
	REG_1 :DATA_REGISTER 
	generic map(16)
	port map(D3,R1,clk, enable(1),reset);
	
	REG_2 :DATA_REGISTER
	generic map(16)
	port map(D3,R2,clk, enable(2),reset);
	
	REG_3 :DATA_REGISTER 
	generic map(16)
	port map(D3,R3,clk, enable(3),reset);
	
	REG_4 :DATA_REGISTER 
	generic map(16)
	port map(D3,R4,clk,enable(4),reset);
	
	REG_5 :DATA_REGISTER 
	generic map(16)
	port map(D3,R5,clk, enable(5),reset);
	
	REG_6 :DATA_REGISTER 
	generic map(16)
	port map(D3,R6,clk,enable(6),reset);
	
	REG_7 :DATA_REGISTER 
	generic map(16)
	port map(Sig_R7,R7,clk,enable(7),reset) ;


    PC <= R7;

	DMX : DEMUX port map(A3,DMX_OUT) ;

	MUX_0 :MUX_16_8 port map(R0,R1,R2,R3,R4,R5,R6,R7,A1,D1);
							
	MUX_1 :MUX_16_8 port map(R0,R1,R2,R3,R4,R5,R6,R7,A2,D2);

	MUX_2 :MUX_16_2 port map(D3,DPC,PC_write,Sig_R7);
 			
			
end Behave;

