--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_instruction_memory is
    generic(
        addr_bits  : integer := 32;
        data_width : integer := 32
    );
end tb_instruction_memory;

architecture Behavioral of tb_instruction_memory is
    
    component instruction_memory is
     Port ( addr : in std_logic_vector( addr_bits -1 downto 0 ); 
            data : out std_logic_vector( data_width -1 downto 0 ) 
        );
    end component instruction_memory;

    signal addr : std_logic_vector( addr_bits -1 downto 0 ); 
    signal data : std_logic_vector( data_width -1 downto 0 );
       
begin   
 uut: instruction_memory
    port map(
             addr => addr ,
             data => data 
    );
       
stim_proc: process
begin
    addr <= "00000000000000000000000000000001";
    wait for 10ns;
    addr <= "00000000000000000000000000000010";
    wait for 10ns;
    addr <= "00000000000000000000000000000011";
    wait for 10ns;
    addr <= "00000000000000000000000000000100";
    wait for 10ns;
    addr <= "00000000000000000000000000000101";
    wait for 10ns;
    addr <= "00000000000000000000000000000110";
    wait for 10ns;
    addr <= "00000000000000000000000000001000";
    wait for 10ns;
    addr <= "00000000000000000000000000001001";
    wait for 10ns;
    addr <= "00000000000000000000000000001010";
    wait for 10ns;
    addr <= "00000000000000000000000000001011";
    wait for 10ns;
    addr <= "00000000000000000000000000001100";
    wait for 10ns;
    addr <= "00000000000000000000000000001101";
    wait for 10ns;
    addr <= "00000000000000000000000000001110";
    wait for 10ns;
    addr <= "00000000000000000000000000001111";
    wait for 10ns;
    addr <= "00000000000000000000000000010000";
    wait for 10ns;
    addr <= "00000000000000000000000000010001";
    wait;
end process;

end Behavioral;
