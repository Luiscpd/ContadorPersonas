----------------------------------------------------------------------------------
-- Company: Universidad De San Carlos De Guatemala
-- Engineer: Luis Paniagua 
-- 
-- Create Date:    00:40:17 10/05/2021 
-- Design Name: 
-- Module Name:    ContadorPersona - Behavioral 
-- Project Name: 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SevenSF is
    Port ( Salida : out  STD_LOGIC_VECTOR (7 downto 0);
			  sel: out Std_logic_vector (2 downto 0);
			  up : in STD_LOGIC;
			  down : in STD_LOGIC;
			  clk : in  STD_LOGIC);
end SevenSF;

architecture Behavioral of SevenSF is

signal numeros, u, d,c : integer range 0 to 10;


begin

process(clk) --lista sensitiva
--variables

variable tiempo: integer range 0 to 11999999;
variable bandera: integer range 0 to 3;
variable contador: integer range 0 to 12000;

begin
	if(rising_edge(clk)) then
		if up='0' then
		if(tiempo = 11999999) then
			tiempo := 0;
			u <= u +1;
			if (u = 9) then
			 u<=0;
			 d<=d+1;
			 end if;
				if (d=1) then
					d<=1;
					c<=0;
					if (u = 5) then
					u<=5;
					end if;
				end if;
		else
			tiempo:= tiempo +1;
		end if;		
		end if;
		
		
		if down='0' then
		if(tiempo = 11999999) then
			tiempo := 0;
			u <= u -1;
			if (u = 0) then
				u<=9;
			if (u = 9) then
				u<=0;
		 d<=d-1;
			 end if;
				if (d=1) then
					d<=1;
					c<=0;
					if (u = 5) then
						u<=5;
						u <= u -1;					
						
					end if;
				end if;
				if (u = 0) then
				d<=0;
				end if;
			end if; 
				if (d = 0) then
					u <= u-1;
						if (u = 0) then 
							u<=0;
						end if;
				end if;		
		else
			tiempo:= tiempo +1;
		end if;		
		end if;

		
	if contador = 12000 then
		contador :=0;
		bandera := bandera +1;
			if bandera = 1 then
				numeros <= u;
				sel <= "011";
			elsif bandera = 2 then
				numeros <= d;
				sel <= "101";
			elsif bandera = 3 then
				numeros <= c;
				sel <= "110";
				bandera :=0;
			end if;
		else
			contador:= contador +1;
		end if;
		
		case numeros is 
			-------------------------hgfedcba
				 when 0 => salida <= "11000000";
				 when 1 => salida <= "11111001";
				 when 2 => salida <= "10100100";
				 when 3 => salida <= "10110000";
				 when 4 => salida <= "10011001";
				 when 5 => salida <= "10010010";
				 when 6 => salida <= "10000010";
				 when 7 => salida <= "11111000";
				 when 8 => salida <= "10000000";
				 when 9 => salida <= "10011000";
				 when others => salida <= "00000000";
		end case;
		
	
	end if;
 
end process;


end Behavioral;
