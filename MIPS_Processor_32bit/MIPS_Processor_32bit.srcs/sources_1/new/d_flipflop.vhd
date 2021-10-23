

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

begin
    process(clk, Din, reset)
    begin
        if(clk'event and clk='1') then
            if(reset = '1') then
                Q <= '0';
            end if;
            Q <= Din;
        end if;
    end process;
end Behavioral;
