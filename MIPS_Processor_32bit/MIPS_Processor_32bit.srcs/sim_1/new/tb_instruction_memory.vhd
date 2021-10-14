--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_instruction_memory is
    generic(
        addr_bits  : integer := 4;
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
    addr <= "0000";
    wait for 10ns;
    addr <= "0001";
    wait for 10ns;
    addr <= "0010";
    wait for 10ns;
    addr <= "0011";
    wait for 10ns;
    addr <= "0100";
    wait for 10ns;
    addr <= "0101";
    wait for 10ns;
    addr <= "0110";
    wait for 10ns;
    addr <= "0111";
    wait for 10ns;
    addr <= "1000";
    wait for 10ns;
    addr <= "1001";
    wait for 10ns;
    addr <= "1010";
    wait for 10ns;
    addr <= "1011";
    wait for 10ns;
    addr <= "1100";
    wait for 10ns;
    addr <= "1101";
    wait for 10ns;
    addr <= "1110";
    wait for 10ns;
    addr <= "1111";
    wait;
end process;

end Behavioral;
