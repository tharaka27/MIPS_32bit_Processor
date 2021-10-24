--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity data_memory is
    generic(
        addr_width     : integer := 1024;  
        addr_bits      : integer := 10;
        data_width     : integer := 32;
        mem_data_width : integer := 8
    );

    Port ( 
        addr        : in    std_logic_vector( 31 downto 0 );
        writeData   : in    std_logic_vector( 31 downto 0 );
        data        : out   std_logic_vector( 31 downto 0 );
        writeEnable : in    std_logic;
        --memRead     : in    std_logic;
        clk         : in    std_logic
    );
    
end data_memory;

architecture Behavioral of data_memory is
    type rom_type is array(0 to addr_width -1) of std_logic_vector( 7 downto 0);
    signal dataMemory : rom_type;
    signal temp       : std_logic_vector(data_width -1 downto 0);
    
     
begin

writing_process: process(clk) is
variable tmp      : integer;
begin
   
   
   if (clk'event and clk = '1') then
             tmp := to_integer(unsigned(addr));
             report "The value of 'a' is " & integer'image(tmp);
             if( (tmp >= 0) and (tmp < addr_width)) then
                  if (writeEnable = '1') then
                             dataMemory(to_integer(signed(addr)))    <= writeData(31 downto 24);
                             dataMemory(to_integer(signed(addr) +1)) <= writeData(23 downto 16);
                             dataMemory(to_integer(signed(addr) +2) ) <= writeData(15 downto  8);
                             dataMemory(to_integer(signed(addr) +3) ) <= writeData( 7 downto  0);
                          end if;
                          data <= dataMemory(to_integer(signed(addr))) 
                                   & dataMemory(to_integer(signed(addr) +1))
                                    & dataMemory(to_integer(signed(addr) +2) )
                                     & dataMemory(to_integer(signed(addr) +3) );
             end if;
             
        end if;
    
    --data <= dataMemory(to_integer(unsigned(addr)));
end process;

end Behavioral;
