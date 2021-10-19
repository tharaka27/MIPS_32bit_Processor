--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec5to32 is
  Port (
        addr    :   in  std_logic_vector(4 downto 0);
        output  :   out std_logic_vector(31 downto 0)
  );
end dec5to32;

architecture Behavioral of dec5to32 is

begin

process(addr)
begin
    --output <= "11111111111111111111111111111111";
    output <= "00000000000000000000000000000000";
    case addr is
        when "00000" => output(0) <= '1';  
        when "00001" => output(1) <= '1';
        when "00010" => output(2) <= '1';
        when "00011" => output(3) <= '1';
        when "00100" => output(4) <= '1';
        when "00101" => output(5) <= '1';
        when "00110" => output(6) <= '1';
        when "00111" => output(7) <= '1';
        when "01000" => output(8) <= '1';
        when "01001" => output(9) <= '1';
        when "01010" => output(10) <= '1';
        when "01011" => output(11) <= '1';
        when "01100" => output(12) <= '1';
        when "01101" => output(13) <= '1';
        when "01110" => output(14) <= '1';
        when "01111" => output(15) <= '1';
        when "10000" => output(16) <= '1';
        when "10001" => output(17) <= '1';
        when "10010" => output(18) <= '1';
        when "10011" => output(19) <= '1';
        when "10100" => output(20) <= '1';
        when "10101" => output(21) <= '1';
        when "10110" => output(22) <= '1';
        when "10111" => output(23) <= '1';
        when "11000" => output(24) <= '1';
        when "11001" => output(25) <= '1';
        when "11010" => output(26) <= '1';
        when "11011" => output(27) <= '1';
        when "11100" => output(28) <= '1';
        when "11101" => output(29) <= '1';
        when "11110" => output(30) <= '1';
        when "11111" => output(31) <= '1';
        when others  => output <= "00000000000000000000000000000000";
    end case;
end process;
end Behavioral;
