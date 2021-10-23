--
-- Written by Tharaka Ratnayake
--


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_data_memory is
    generic(
             addr_bits      : integer := 10;
             data_width     : integer := 32
        
            );
end tb_data_memory;

architecture Behavioral of tb_data_memory is
    component data_memory is
        Port ( 
            addr        : in    std_logic_vector( 31 downto 0 );
            writeData   : in    std_logic_vector( 31 downto 0 );
            data        : out   std_logic_vector( 31 downto 0 );
            writeEnable : in    std_logic;
            --memRead     : in    std_logic;
            clk         : in    std_logic
        );
        
    end component data_memory;
    
     
    signal addr        :     std_logic_vector( 31 downto 0 );
    signal writeData   :     std_logic_vector( 31 downto 0 );
    signal data        :    std_logic_vector( 31 downto 0 );
    signal  writeEnable : std_logic;
    --signal  memRead     : std_logic;
    signal  clk         : std_logic := '1';


begin
   
 uut: data_memory
    port map(
             addr => addr ,
             writeData => writeData,
             data => data ,
             writeEnable => writeEnable,
             clk => clk
    );

clk <= not clk after 5ns; 
    
stim_proc: process
    begin    
    -- Write some data
    addr <= "00000000000000000000000000000001";
    writeData <= "00000000000000000000000000000001";
    writeEnable <= '1';
    wait for 10ns;
    
    -- Read previously written data
    addr <= "00000000000000000000000000000001";
    writeEnable <= '0';
    wait for 10ns;
    
    -- Write some data
    addr <= "00000000000000000000000000000001";
    writeData <= "10000000000000000000000000000001";
    writeEnable <= '1';
    wait for 10ns;
    
    addr <= "11111111111111111111111111111111";
    writeEnable <= '0';
    wait for 10ns;

    -- Read previously written data
    addr <= "00000000000000000000000000000001";
    writeEnable <= '0';
    wait for 10ns;
    
    -- Write some data
    addr <= "00000000000000000000000000000001";
    writeData <= "11000000000000000000000000000001";
    writeEnable <= '1';
    wait for 10ns;
    
    -- Read previously written data
    addr <= "00000000000000000000000000000001";
    writeEnable <= '0';
    wait for 10ns;
    
    
   
    wait;
end process;  

end Behavioral;
