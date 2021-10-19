--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg_bit is
  Port ( 
        bitOut  :   out std_logic;
        bitData :   in  std_logic;
        writeEn :   in  std_logic;
        reset   :   in  std_logic;
        clk     :   in  std_logic
  );
end reg_bit;

architecture Behavioral of reg_bit is
    
begin
    process(clk)
        begin
            if(clk'event and clk='1') then
                if(writeEn='1') then
                    bitOut <= bitData;
                elsif(reset = '1') then
                    bitOut <= '0';
                end if;
            end if;
    end process;
end Behavioral;
