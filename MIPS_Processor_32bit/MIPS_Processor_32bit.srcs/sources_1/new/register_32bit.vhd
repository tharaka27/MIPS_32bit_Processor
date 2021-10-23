--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity register_32bit is
  Port (
    regOut  :   inout std_logic_vector(31 downto 0);
    regData :   in  std_logic_vector(31 downto 0);
    writeEn :   in  std_logic;
    reset   :   in  std_logic;
    clk     :   in  std_logic
   );
end register_32bit;

architecture Behavioral of register_32bit is
    
    component reg_bit is
      Port ( 
            bitOut  :   inout std_logic;
            bitData :   in  std_logic;
            writeEn :   in  std_logic;
            reset   :   in  std_logic;
            clk     :   in  std_logic
      );
    end component reg_bit;
    
begin
    
    
    R0: reg_bit port map(
        bitOut  => regOut(0),
        bitData => regData(0),
        writeEn => writeEn,
        reset   => reset,
        clk     => clk
    );
    
    
    R32 : for i in 31 downto 1 generate
        Ri: reg_bit port map(
            bitOut  => regOut(i),
            bitData => regData(i),
            writeEn => writeEn,
            reset   => reset,
            clk     => clk
        );
    end generate;

end Behavioral;
