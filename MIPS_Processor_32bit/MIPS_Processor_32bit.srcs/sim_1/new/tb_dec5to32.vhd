--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_dec5to32 is
--  Port ( );
end tb_dec5to32;

architecture Behavioral of tb_dec5to32 is

    component dec5to32 is
      Port (
            addr    :   in  std_logic_vector(4 downto 0);
            output  :   out std_logic_vector(31 downto 0)
      );
    end component dec5to32;
    
    signal addr     : std_logic_vector(4 downto 0);
    signal output   : std_logic_vector(31 downto 0);
    
begin

UUT : dec5to32 port map(
        addr    => addr,
        output  => output
);


stim_proc: process
    begin   
     
    addr <= "00000";
    wait for 10ns;   

    addr <= "00010";
    wait for 10ns;   
    
    addr <= "00100";
    wait for 10ns;   
    
    addr <= "00101";
    wait for 10ns;   
    
    addr <= "01010";
    wait for 10ns;   
    
    addr <= "10000";
    wait for 10ns;   
    
    addr <= "00001";
    wait for 10ns;   
    
    addr <= "10100";
    wait for 10ns;   
   
    wait;
end process;  

end Behavioral;
