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
		
	end process DCD; 

end architecture behave;





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




entity dataregister is
	generic (data_width:integer);
	port (Din: in bit_vector(data_width-1 downto 0);
	      Dout: out bit_vector(data_width-1 downto 0);
	      clk, enable: in bit);
end entity;
architecture Behave of dataregister is
begin
    process(clk)
    begin
       if(clk'event and (clk  = '1')) then
           if(enable = '1') then
               Dout <= Din;
           end if;
       end if;
    end process;
end Behave;



entity Register_File is
	port (A1,A2,A3 :in std_logic_vector(2 downto 0);D3: in std_logic_vector(7 downto 0); reg_write: in std_logic;D1,D2: out std_logic_vector(7 downto 0));
end entity;

architecture Behave of Register_File is
component dataregister is
	
end component;

component MUX_8_1 is
	port(X0,X1,X2,X3,X4,X5,X6,X7: in std_logic_vector(15 downto 0); Sel: in std_logic_vector(2 downto 0);  Y: out std_logic_vector(15 downto 0));
end component;

component DECODER_3_8 is
	port(Sel: in std_logic_vector(2 downto 0);  Y: out std_logic_vector(8 downto 0));
end component;

signal reg_enable :std_logic_vector(7 downto 0);
signal R :std_logic_vector(15 downto 0)(7 downto 0);


begin
REG_0 :dataregister port map(R(15 downto 0)(0));
REG_1 :dataregister port map();
REG_2 :dataregister port map();
REG_3 :dataregister port map();
REG_4 :dataregister port map();
REG_5 :dataregister port map();
REG_6 :dataregister port map();
REG_7 :dataregister port map();


Decoder :DECODER_3_8 port map(A3,reg_enable) ;
MUX_0 :MUX_8_1 port map(R(15 downto 0)(0),R(15 downto 0)(1),R(15 downto 0)(2),R(15 downto 0)(3),R(15 downto 0)(4),R(15 downto 0)(5),
						R(15 downto 0)(6),R(15 downto 0)(7),A1,D1);

MUX_1 :MUX_8_1 port map(R(15 downto 0)(0),R(15 downto 0)(1),R(15 downto 0)(2),R(15 downto 0)(3),R(15 downto 0)(4),R(15 downto 0)(5),
						R(15 downto 0)(6),R(15 downto 0)(7),A2,D2);		

				





	
	
end Behave;

