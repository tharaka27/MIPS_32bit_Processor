

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity d_flipflop is
  Port ( 
        clk : in std_logic;
        Din : in std_logic;
        Q   : out std_logic;
        reset : in std_logic
   );
end d_flipflop;

architecture Behavioral of d_flipflop is
        signal temp : std_logic;

begin
    process(clk, Din, reset)
    begin
        if(rising_edge(clk)) then
            if(reset = '1') then
                Q <= '0';
            else
                Q <= Din;
            end if;
        end if;
        --Q <= temp;
    end process;
end Behavioral;
