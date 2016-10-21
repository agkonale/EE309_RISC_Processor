library ieee;
use ieee.std_logic_1164.all;

package General_Components is

type MEM_16 is array (integer range <>) of std_logic_vector(15 downto 0);

component PRIORITY_ENCODER is  
	port (X : in std_logic_vector (7 downto 0); 
		  Y :out std_logic_vector (2 downto 0));  
end component; 
  
component SET_POS_ZERO is  
	port (X : in std_logic_vector (7 downto 0); 
		  POS:in std_logic_vector (2 downto 0); 
		  init :in std_logic; Y :out std_logic_vector (2 downto 0));  
end component;

component SE6 is  
	port (X : in std_logic_vector (5 downto 0); 
		  Y :out std_logic_vector (15 downto 0));  
end component;

component SE9 is  
	port (X : in std_logic_vector (8 downto 0); 
		  Y :out std_logic_vector (15 downto 0));  
end component;

component SE_9 is  
	port (X : in std_logic_vector (8 downto 0); 
		  Y :out std_logic_vector (15 downto 0));  
end component;   

component DATA_REGISTER is
	generic (data_width:integer);
	port (Din: in std_logic_vector(data_width-1 downto 0);
	      Dout: out std_logic_vector(data_width-1 downto 0);
	      clk, enable, reset: in std_logic);
end component;

component REGISTER_FILE is
	port (A1,A2,A3 :in std_logic_vector(2 downto 0);	
		  DPC,D3: in std_logic_vector(15 downto 0); 
		  reg_write,PC_write: in std_logic;	
		  D1,D2,PC: out std_logic_vector(15 downto 0); 
		  clk,reset: in std_logic);
end component;

component MEMORY is
	port (Address :in std_logic_vector(4 downto 0);
		  Din: in std_logic_vector(15 downto 0);
	      Dout: out std_logic_vector(15 downto 0);
	      clk,mem_write,mem_read,reset :in std_logic);
end component;

end General_Components;
