entity DFF is
	port (D,clk:in bit; Q:inout bit;QN:out bit:='1');
end entity DFF;

architecture behave of DFF is
begin
	FF :process(clk) is
	begin
		if clk='0' then
			Q<=D ;
		end if;
	end process FF;
	QN<=not Q;
end architecture behave;






