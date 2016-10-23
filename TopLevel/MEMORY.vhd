library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.General_Components.all;

entity MEMORY is
	port(
			clk:		in std_logic;
			reset:		in std_logic;
			mem_write:	in std_logic;
			mem_read:	in std_logic;			
			Address:	in std_logic_vector(6 downto 0);
			Din: 		in std_logic_vector(15 downto 0);
			
			Dout: 		out std_logic_vector(15 downto 0)
	     );      
end entity;

architecture Behave of MEMORY is
begin
process(clk)
	variable MEM_16X128 : MEM_16(0 to 127);
	variable Addr_INT :integer range 0 to 127;	
	begin				
		if(clk'event and (clk  = '1')) then
			if(reset='1') then				
	   			MEM_16X128(0 to 8)	:= 
	   				(
	   				"0011001000000000",
					"0001001001000001",
					"0011010000000000",
					"0001010010000010",
					"0011011000000000",
					"0001011011000011",
					"0000001010100000",
					"0010011100101000",
					"1111111111111111"
					);

	   				   			
				Dout			<= "1111111111111111";				  
			elsif(mem_write = '1') then   
				Addr_INT 				:= to_integer(unsigned(Address));   
				MEM_16X128 (Addr_INT)	:=  Din ;
			elsif(mem_read = '1') then
				Addr_INT 	:= to_integer(unsigned(Address));              
				Dout 		<= MEM_16X128(Addr_INT);    					   	
			end if;	
		end if;		
end process;
end Behave;
