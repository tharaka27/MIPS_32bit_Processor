--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_register_32bit is
--  Port ( );
end tb_register_32bit;

architecture Behavioral of tb_register_32bit is


component register_32bit is
  Port (
    regOut  :   inout std_logic_vector(31 downto 0);
    regData :   in  std_logic_vector(31 downto 0);
    writeEn :   in  std_logic;
    reset   :   in  std_logic;
    clk     :   in  std_logic
   );
end component register_32bit;

    signal regOut  :  std_logic_vector(31 downto 0);
    signal regData :  std_logic_vector(31 downto 0);
    signal writeEn :  std_logic;
    signal reset   :  std_logic;
    signal clk     :  std_logic := '1';


begin

clk <= not clk after 5ns; 

UUT : register_32bit port map(
    regOut  =>  regOut,
    regData =>  regData,
    writeEn =>  writeEn,
    reset   =>  reset,
    clk     =>  clk
);


stim_proc: process
    begin   
     
    writeEn <= '1';
    regData <= "00000000000000010000000000000000";
    reset   <= '0';
    
    wait for 10ns;
    
    writeEn <= '0';
    regData <= "10000000000000000000000000000000";
    reset   <= '1';
    wait for 10ns;
    
    writeEn <= '1';
    regData <= "00000000100000000000000000000000";
    reset   <= '0';
        
    wait for 10ns;
    
    writeEn <= '0';
    regData <= "00000000000000000000000010000000";
    reset   <= '1';
        
    wait for 10ns;   
   
    wait;
end process;  

end Behavioral;
