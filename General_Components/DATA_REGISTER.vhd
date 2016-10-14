library ieee;
use ieee.std_logic_1164.all;

entity DATA_REGISTER is
	generic (data_width:integer);
	port (Din: in std_logic_vector(data_width-1 downto 0);
	      Dout: out std_logic_vector(data_width-1 downto 0);
	      clk,enable,reset: in std_logic);
end entity;



architecture Behave of DATA_REGISTER is
begin
    process(clk,reset,Din,enable)
    begin
    
       if(clk'event and (clk  = '0')) then

       	   if(reset = '0') then
       	   		Dout <= '0';
       	   		
           elsif(enable = '0') then           
           		Dout <= Din;               
           end if;  
                    
       end if;     
         
    end process;
end Behave;


