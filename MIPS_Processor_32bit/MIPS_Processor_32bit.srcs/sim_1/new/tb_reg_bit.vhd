--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_reg_bit is
--  Port ( );
end tb_reg_bit;

architecture Behavioral of tb_reg_bit is



component reg_bit is
  Port ( 
        bitOut  :   out std_logic;
        bitData :   in  std_logic;
        writeEn :   in  std_logic;
        reset   :   in  std_logic;
        clk     :   in  std_logic
  );
end component reg_bit;

    signal bitOut  :   std_logic;
    signal bitData :   std_logic;
    signal writeEn :   std_logic;
    signal reset   :   std_logic;
    signal  clk    :   std_logic := '1';
    
begin

UUT: reg_bit port map(
    bitOut  =>  bitOut,
    bitData =>  bitData,
    writeEn =>  writeEn,
    reset   =>  reset,
    clk     =>  clk
    );
    
clk <= not clk after 5ns; 

stim_proc: process
    begin   
     
    writeEn <= '1';
    bitData <= '1';
    reset   <= '0';
    
    wait for 10ns;
    
    writeEn <= '0';
    bitData <= '0';
    reset   <= '1';
    wait for 10ns;
    
    writeEn <= '1';
    bitData <= '0';
    reset   <= '0';
        
    wait for 10ns;
    
    writeEn <= '0';
    bitData <= '1';
    reset   <= '1';
        
    wait for 10ns;   
   
    wait;
end process;  

end Behavioral;
