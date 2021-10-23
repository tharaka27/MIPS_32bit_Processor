--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_bit is
  Port ( 
        bitOut  :   inout std_logic;
        bitData :   in  std_logic;
        writeEn :   in  std_logic;
        reset   :   in  std_logic;
        clk     :   in  std_logic
  );
end reg_bit;

architecture Behavioral of reg_bit is
    signal f1 : std_logic;
    signal f2 : std_logic;
    signal d  : std_logic;
    
    component d_flipflop is
      Port ( 
            clk : in std_logic;
            Din : in std_logic;
            Q   : out std_logic;
            reset : in std_logic
       );
    end component d_flipflop;
    
    
 begin
    f1 <= bitOut and not(writeEn);
    f2 <= bitData and writeEn;
    d <= f1 or f2;
    
    d_flip_flop: d_flipflop port map(
           clk => clk,
           Din => d,
           Q   => bitOut,
           reset => reset
    );
--begin
--    process(clk)
--        begin
--            if(clk'event and clk='1') then
--                if(writeEn='1') then
--                    bitOut <= bitData;
--                elsif(reset = '1') then
--                    bitOut <= '0';
--                end if;
--            end if;
--    end process;

end Behavioral;
