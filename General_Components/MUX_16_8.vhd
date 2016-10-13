entity MUX_16_8 is
 	port(X0,X1,X2,X3,X4,X5,X6,X7: in std_logic_vector(15 downto 0); Sel: in std_logic_vector(2 downto 0);  Y: out std_logic_vector(15 downto 0));
end entity MUX_16_8;

architecture Struct of MUX_16_8 is
begin
Y  		<= 	  X0   when Sel="000"  else  
		      X1   when Sel="001"  else
		      X2   when Sel="010"  else
		      X3   when Sel="011"  else
		      X4   when Sel="100"  else
		      X5   when Sel="101"  else
		      X6   when Sel="110"  else
		      X7   when Sel="111"  else 
		      "----------------";  
		      
end architecture Struct;





