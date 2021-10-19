--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity mux32to1 is
  Port (
    input   : in   std_logic_vector(31 downto 0);
    output  : out  std_logic;
    sel     : in   std_logic_vector(4 downto 0)
   );
end mux32to1;

architecture Behavioral of mux32to1 is

begin

    output <= input(to_integer(unsigned(sel)));
    
end Behavioral;
