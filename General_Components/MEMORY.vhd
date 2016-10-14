library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.General_Components.all;

entity MEMORY is
	port (Address :in std_logic_vector(4 downto 0);
		  Din: in std_logic_vector(15 downto 0);
	      Dout: out std_logic_vector(15 downto 0);
	      clk,mem_write,mem_read,reset :in std_logic);
	      
end entity;

architecture Behave of MEMORY is

begin
	process(clk,reset,mem_write,mem_read,Address,Din)
		variable MEM_16X32 : MEM;
		variable Addr_INT :integer;	

		begin	
			
			if(clk'event and (clk  = '0')) then
				if(reset='0') then
		   			MEM_16X32 :=("1111111111111111","1111111111110000","1111111111111111","1111111111110000",
								"1111111111111111","1111111111110000","1111111111111111","1111111111110000",
								"1111111111111111","1111111111110000","1111111111111111","1111111111110000",
								"1111111111111111","1111111111110000","1111111111111111","1111111111110000",
								"1111111111111111","1111111111110000","1111111111111111","1111111111110000",
								"1111111111111111","1111111111110000","1111111111111111","1111111111110000",
								"1111111111111111","1111111111110000","1111111111111111","1111111111110000",
								"1111111111111111","1111111111110000","1111111111111111","1111111111110000");
					  
				elsif(mem_write = '0') then   
					Addr_INT := to_integer(unsigned(Address));   
					MEM_16X32 (Addr_INT) :=  Din ;

				elsif(mem_read = '0') then
					Addr_INT := to_integer(unsigned(Address));              
					Dout <= MEM_16X32(Addr_INT);       
				end if;
			end if;		
	end process;
end Behave;
