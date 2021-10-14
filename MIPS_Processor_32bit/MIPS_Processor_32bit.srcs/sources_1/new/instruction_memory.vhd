--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity instruction_memory is
  
  generic(
   addr_width : integer := 16;  
   addr_bits  : integer := 4;
   data_width : integer := 32
  );
  
  Port ( addr : in std_logic_vector( addr_bits -1 downto 0 );
         data : out std_logic_vector( data_width -1 downto 0 ) 
  );
end instruction_memory;

architecture Behavioral of instruction_memory is

   type rom_type is array(0 to addr_width -1) of std_logic_vector(data_width-1 downto 0);
   
   signal instructionROM : rom_type := (
        "00111000000100000000000000000011", 
        "00111000000100010000000000000100",
        "00001000000000000000000000000101",
        "00111000000100000000000000000001",
        "00111000000100010000000000000001",
        "00000010001100001001000000100010",
        "00010110000100011111111111111100",
        "00000010000100011001100000100000",
        "10101110010100110000000000010000",
        "10001110010101000000000000010000",
        "00000010000101001010100000101010",
        "10001110010100110000000000010000",
        "00111010010100110000000000000001",
        "00111010101101010000000000000001",
        "00000010101000000000000000001000",
        "00000000000000000000000000000000" -- all zero padding instruction
   );

begin
    data <= instructionROM(to_integer(unsigned(addr)));

end Behavioral;
