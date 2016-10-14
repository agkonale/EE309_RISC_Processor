library ieee;
use ieee.std_logic_1164.all;

library work;
use work.General_Components.all;


entity testbench_mem is
end entity testbench_mem;


architecture test of testbench_mem is

signal Address : std_logic_vector(4 downto 0);
signal	Din: std_logic_vector(15 downto 0);
signal  Dout: std_logic_vector(15 downto 0);
signal	clk,mem_write,mem_read,reset : std_logic:='1';

begin 
	M1 : MEMORY port map (Address,Din,Dout,clk,mem_write,mem_read,reset);
	clk<= not clk after 10 ns;	
	testcase :process is
	begin	
		reset <= '0';
		wait for 20 ns;
		reset <= '1';
		mem_read <= '0';
		Address<="00000";
		wait for 20 ns;
		mem_read <= '1';
		wait for 20 ns;
		mem_write <= '0';
		Address<="00000";
		Din <= "0000000000001111";
		wait for 20 ns;
		mem_write <= '1';
		wait for 20 ns;
		mem_read <= '0';
		Address<="00000";
		wait for 20 ns;
		mem_read <= '1';
		
			
		wait;
	end process testcase;


end architecture test;
