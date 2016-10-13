entity DFF is
	port (D,clk:in bit; Q:inout bit;QN:out bit:='1');
end entity DFF;

architecture behave of DFF is
begin
	FF :process(clk) is
	begin
		if clk='0' then
			Q<=D after 5 ns;
		end if;
	end process FF;
	QN<=not Q;
end architecture behave;





entity testbench_DFF is

end entity testbench_DFF;

architecture test of testbench_DFF is

component DFF is
	port (D,clk:in bit; Q:inout bit;QN:out bit:='1');
end component;
signal D,clk,Q,QN:bit;

begin 

	DFF_1: DFF port map(D,clk,Q,QN);
	clk<= not clk after 10 ns;
	
	testcase :process is
	begin
		D<='1';
		wait for 10 ns;

		D<='0';
		wait for 30 ns;

		D<='1';
		wait for 70 ns;

		D<='0';
		wait for 95 ns;

		wait;
		
	end process testcase;

end architecture test;
