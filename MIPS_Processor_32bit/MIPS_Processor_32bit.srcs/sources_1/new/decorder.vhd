--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decorder is
  Port (
           writeRegister    :   in  std_logic_vector(4 downto 0);
           writeEnable      :   out std_logic_vector(31 downto 0);
           regWrite         :   in  std_logic
   );
end decorder;

architecture Behavioral of decorder is
    
        signal  OE  : std_logic_vector(31 downto 0);
        
        component dec5to32 is
          Port (
                addr    :   in  std_logic_vector(4 downto 0);
                output  :   out std_logic_vector(31 downto 0)
          );
        end component dec5to32;

begin

dec5to32_1: dec5to32 port map(
    addr    => writeRegister,
    output  => OE
);
 
    R32 : for i in 31 downto 0 generate
            writeEnable(i) <= OE(i) and  regWrite;
    end generate;
    
end Behavioral;
