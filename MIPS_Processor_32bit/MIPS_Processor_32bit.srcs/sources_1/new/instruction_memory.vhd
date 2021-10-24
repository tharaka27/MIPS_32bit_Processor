--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity instruction_memory is
  
  Port ( addr : in std_logic_vector( 31 downto 0 );
         data : out std_logic_vector( 31 downto 0 ) 
  );
end instruction_memory;

architecture Behavioral of instruction_memory is

   type rom_type is array(0 to 14) of std_logic_vector(31 downto 0);
   
   
   -- xori $s0, $zero, 0x0003
        -- $0 = 3
   -- xori $s1, $zero, 0x0004
        -- $0 = 3  and  $1 = 4
   -- j next1
   
   -- sub $s2, $s1, $s0
        -- $0 = 3  and  $1 = 4  $2 = 1
   -- bne
        -- success go to next2
        
   -- xori $0
        -- $0 = 1  and  $1 = 4  $2 = 1   
   -- xori $1
        -- $0 = 1  and  $1 = 1  $2 = 1
   -- sub 
        -- $0 = 1  and  $1 = 1  $2 = 0
   -- bne
        -- branch not taken
   -- add
        -- $0 = 1  and  $1 = 1  $2 = 0 $3 = 2
   -- sw
        -- 16 <- 2
   -- lw 
        -- $0 = 1  and  $1 = 1  $2 = 0 $3 = 2   $4 = 2
   -- slt
        -- $0 = 1  and  $1 = 1  $2 = 0 $3 = 2   $4 = 2  $5 = 1
   -- lw
        -- $0 = 1  and  $1 = 1  $2 = 0 $3 = 2   $4 = 2  $5 = 1
   -- xori
        -- $0 = 1  and  $1 = 1  $2 = 0 $3 = 1   $4 = 2  $5 = 1
    -- xori
        -- $0 = 1  and  $1 = 1  $2 = 0 $3 = 1   $4 = 2  $5 = 0
     -- jump to 0
   
   
   
   
   signal instructionROM : rom_type := (
        "00111000000100000000000000000011", -- 940572675
        "00111000000100010000000000000100", -- 940638212
        "00001000000000000000000000000101", -- 134217733
        "00111000000100000000000000000001", -- 940572673
        "00111000000100010000000000000001", -- 940638209
        "00000010001100001001000000100010", -- 36737058
        "00010110000100011111111111111100",  -- 370278396
        "00000010000100011001100000100000", -- 34707488
        "10101110010100110000000000010000", -- 2924675088
        "10001110010101000000000000010000", --  2387869712
        "00000010000101001010100000101010", -- 34908202
        "10001110010100110000000000010000", -- 2387804176
        "00111010010100110000000000000001", -- 978518017
        "00111010101101010000000000000001", -- 984940545
        "00000010101000000000000000001000" -- 44040200
--        "00000000000000000000000000000000", -- all zero padding instruction
--        "00000000000000000000000000000000",
--        "00000000000000000000000000000000",
--        "00000000000000000000000000000000"
   );

begin

    --data <= instructionROM(to_integer(unsigned(addr)/4));

reading_process: process(addr) is
variable tmp      : integer;
begin
      tmp := to_integer(unsigned(addr)/4);
      if( (tmp >= 0) and (tmp < 15)) then
               report "Requested address is " & integer'image(tmp);
              data <= instructionROM(tmp);
      end if;
    
end process;

end Behavioral;
