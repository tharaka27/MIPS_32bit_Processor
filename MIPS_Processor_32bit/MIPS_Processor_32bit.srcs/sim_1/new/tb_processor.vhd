--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_processor is
--  Port ( );
end tb_processor;

architecture Behavioral of tb_processor is

    signal clk  : std_logic := '1';
    signal reset: std_logic;
    

begin
    clk <= not clk after 5ns;
    reset <= '1';

end Behavioral;
