


entity MUX_8_1 is

 port(X0,X1,X2,X3,X4,X5,X6,X7: in std_logic_vector(15 downto 0); Sel: in std_logic_vector(2 downto 0);  Y: out std_logic_vector(15 downto 0));
end entity MUX8_1;

architecture behave of MUX_8_1 is
begin
MX :process(Sel,X0,X1) is

	begin
		if Sel="000" then
			Y<=X0;
		elsif Sel="001" then
			Y<=X1;
		if Sel="010" then
			Y<=X2;
		elsif Sel="011" then
			Y<=X3;
		
		if Sel="100" then
			Y<=X4;
		elsif Sel="101" then
			Y<=X5;
		
		if Sel="110" then
			Y<=X6;
		elsif Sel="111" then
			Y<=X7;
		end if;
	end process MX; 

end architecture behave;





