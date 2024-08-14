library ieee;
use ieee.std_logic_1164.all;
--use work.Gates.all;

entity  logarithmic_shifter is 
port ( L: in std_logic ;  -- 0=slr......1=sll
       amt:in std_logic_vector(2 downto 0);
       a : in std_logic_vector(15 downto 0);
		 S : out std_logic_vector(15 downto 0)
     );
end entity logarithmic_shifter;

architecture struct of logarithmic_shifter is 
component mux is 
port (in0,in1 ,sel: in std_logic ;
      Y : out std_logic
     );
end component;

signal z,S1,S2, S3: std_logic_vector(15 downto 0);
begin
 
rev1 : for i in 0 to 15 generate
b2: mux port map(in0 => a(i), in1 => a(15-i), sel => L, Y => z(i));
end generate rev1;

n4_bit: for i in 0 to 15 generate  
		 lsb:if (i < 12) generate
		 bnm: mux port map (in0 => z(i), in1 => z(i+4) , sel=> amt(2) , Y => S1(i) );
		 end generate lsb;
		 msb: if i > 11  generate
		 bnm: mux port map (in0 => z(i), in1 => '0' , sel=> amt(2)  , Y => S1(i));
		 end generate msb;
		
		
		lsb2: if i < 14 generate 
		bas: mux port map (in0 => S1(i), in1 => S1(i+2) , sel=> amt(1)  , Y => S2(i));
		end generate lsb2;
		msb2: if i > 13 generate 
		bas: mux port map (in0 => S1(i), in1 => '0' , sel=> amt(1) , Y => S2(i));
		end generate msb2;
		
		
		lsb3: if i < 15 generate 
		bkl: mux port map (in0 => S2(i), in1 => S2(i+1) , sel=> amt(0) , Y => S3(i));
		end generate lsb3;
		msb3: if i > 14 generate 
		bkl: mux port map (in0 => S2(i), in1 => '0' , sel=> amt(0)  , Y => S3(i));
		end generate msb3;
		
end generate n4_bit ;
		
rev2 : for i in 0 to 15 generate
	b9: mux port map(in0 => s3(i), in1 => s3(15-i), sel => L, Y => S(i));
	end generate rev2;

		
end architecture ;





library ieee;
use ieee.std_logic_1164.all;
--use work.Gates.all;

entity mux is 
port (in0,in1 ,sel: in std_logic ;
      Y: out std_logic
     );
end entity mux;

architecture behaviour of mux is 
signal sel_bar,x1,x2 : std_logic;
begin
--not1 : INVERTER port map ( sel,sel_bar);
--and1 : AND_2 port map (in0,sel_bar , x1);
--and2 : AND_2 port map (in1,sel, x2);
--or1 : OR_2 port map ( x1, x2, Y);

process (sel,in1,in0)
begin
if(sel='1') then 
Y <= in1;
else 
Y <= in0;
end if;

end process;
end architecture ;