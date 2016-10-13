entity DECODER_3_8 is

 port(Sel: in std_logic_vector(2 downto 0);  Y: out std_logic_vector(8 downto 0));
end entity DECODER_3_8;





architecture behave of DECODER_3_8 is
begin
DCD :process(Sel) is

	begin
		if Sel="000" then
			Y<="00000001";
		elsif Sel="001" then
			Y<="00000010";
		elsif Sel="010" then
			Y<="00000100";
		elsif Sel="011" then
			Y<="00001000";
		elsif Sel="100" then
			Y<="00010000";
		elsif Sel="101" then
			Y<="00100000";
		elsif Sel="110" then
			Y<="01000000";
		elsif Sel="111" then
			Y<="10000000";		
		end if;
		
	end process MX; 

end architecture behave;





