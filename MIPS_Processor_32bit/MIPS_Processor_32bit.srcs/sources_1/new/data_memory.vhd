--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity data_memory is
    generic(
        addr_width     : integer := 1024;  
        addr_bits      : integer := 10;
        data_width     : integer := 32;
        mem_data_width : integer := 8
    );

    Port ( 
        addr        : in    std_logic_vector( addr_bits - 1 downto 0 );
        writeData   : in    std_logic_vector( data_width -1 downto 0 );
        data        : out   std_logic_vector( data_width -1 downto 0 );
        writeEnable : in    std_logic;
--        memRead     : in    std_logic;
        clk         : in    std_logic
    );
    
end data_memory;

architecture Behavioral of data_memory is
    type rom_type is array(0 to addr_width -1) of std_logic_vector(data_width-1 downto 0);
    signal dataMemory : rom_type;
    signal temp       : std_logic_vector(data_width -1 downto 0);
     
begin

writing_process: process(clk) is
begin
   if (clk'event and clk = '1') then
         if (writeEnable = '1') then
            dataMemory(to_integer(unsigned(addr))) <= writeData;
         end if;
         data <= dataMemory(to_integer(unsigned(addr)));
    end if;
    --data <= dataMemory(to_integer(unsigned(addr)));
end process;

end Behavioral;
