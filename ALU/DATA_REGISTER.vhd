--Generic Register with synchronous reset,active low enable

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DATA_REGISTER is
	generic (data_width:integer);
	port (Din: in std_logic_vector(data_width-1 downto 0);
	      Dout: out std_logic_vector(data_width-1 downto 0);
	      clk,enable,reset: in std_logic);
end entity;


architecture Behave of DATA_REGISTER is
begin
	
	process(clk,reset,Din,enable)
	variable GND :std_logic_vector(data_width-1 downto 0):=std_logic_vector(to_unsigned(0,data_width));
    begin

       if(clk'event and (clk  = '0')) then

       	   if(reset = '0') then
       	   		Dout <= GND;
       	   		
           elsif(enable = '0') then           
           		Dout <= Din;               
           end if;  
                    
       end if;     
         
    end process;
end Behave;


