library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd is
    Port (
        BCD_in : in STD_LOGIC_VECTOR (3 downto 0);
        Segments : out STD_LOGIC_VECTOR (6 downto 0)
    );
end bcd;

architecture bcd_arq of bcd is
begin
    process(BCD_in)
    begin
        case BCD_in is
            when "0000" => Segments <= "0000001"; -- 0
            when "0001" => Segments <= "1001111"; -- 1
            when "0010" => Segments <= "0010010"; -- 2
            when "0011" => Segments <= "0000110"; -- 3
            when "0100" => Segments <= "1001100"; -- 4
            when "0101" => Segments <= "0100100"; -- 5
            when "0110" => Segments <= "0100000"; -- 6
            when "0111" => Segments <= "0001111"; -- 7
            when "1000" => Segments <= "0000000"; -- 8
            when "1001" => Segments <= "0000100"; -- 9
            when "1010" => Segments <= "0001000"; -- A
            when "1011" => Segments <= "1100000"; -- b
            when "1100" => Segments <= "0110001"; -- C
            when "1101" => Segments <= "1000010"; -- d
            when "1110" => Segments <= "0110000"; -- E
            when "1111" => Segments <= "0111000"; -- F
            when others => Segments <= "1111111"; 
        end case;
    end process;
end bcd_arq;
