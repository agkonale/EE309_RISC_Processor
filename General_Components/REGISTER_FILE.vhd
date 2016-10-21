library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.General_Components.all;

entity REGISTER_FILE is
	port (A1,A2,A3 :in std_logic_vector(2 downto 0); 
		  DPC,D3: in std_logic_vector(15 downto 0); 
		  reg_write,PC_write: in std_logic; 
		  D1,D2,PC: out std_logic_vector(15 downto 0); 
		  clk,reset: in std_logic);	 
end entity;

architecture Behave of REGISTER_FILE is
signal REG_16X8 :MEM_16(0 to 7);
begin

write: process(clk)
variable A3_INT :integer range 0 to 7;	
begin	
if(clk'event and (clk  = '1')) then	
	if(reset='1') then				
		REG_16X8(0)	<= "0000000000000000";
		REG_16X8(1)	<= "0000000000000000";
		REG_16X8(2)	<= "0000000000000000";
		REG_16X8(3)	<= "0000000000000000";
		REG_16X8(4)	<= "0000000000000000";
		REG_16X8(5)	<= "0000000000000000";
		REG_16X8(6)	<= "0000000000000000";
		REG_16X8(7)	<= "0000000000000000";
	elsif(reg_write = '1') then 
		A3_INT 				    := to_integer(unsigned(A3));   
		REG_16X8 (A3_INT)		<=  D3 ;
	elsif(PC_write = '1') then 		
		REG_16X8 (7)			<=  DPC;
	end if;
end if;		
end process;

read: process(clk)
variable A1_INT,A2_INT :integer range 0 to 7;
begin
if(clk'event and (clk  = '1')) then	
	if(reset='1') then
		D1		<= "0000000000000000";
		D2		<= "0000000000000000"; 
		PC 		<= "0000000000000000";
	else		
		A1_INT	:= to_integer(unsigned(A1)); 
		A2_INT	:= to_integer(unsigned(A2));  
		D1		<= REG_16X8(A1_INT); 
		D2		<= REG_16X8(A2_INT); 
		PC 		<= REG_16X8(7);
	end if;
end if;
end process;
		
end Behave;

