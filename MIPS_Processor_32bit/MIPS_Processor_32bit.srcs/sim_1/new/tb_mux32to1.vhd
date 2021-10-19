--
-- Written by Tharaka Ratnayake
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux32to1 is
  --Port ( );
end tb_mux32to1;

architecture Behavioral of tb_mux32to1 is

    component mux32to1 is
      Port (
        input   : in   std_logic_vector(31 downto 0);
        output  : out  std_logic;
        sel     : in   std_logic_vector(4 downto 0)
       );
    end component mux32to1;
    
    signal input   : std_logic_vector(31 downto 0);
    signal output  : std_logic;
    signal sel     : std_logic_vector(4 downto 0);

begin

UUT : mux32to1 port map(
        input   =>  input,
        output  =>  output,
        sel     =>  sel
);


process
begin

    input <= "10000000000000000000000000000000";
    sel   <= "11111";
    wait for 10ns;        
    
    input <= "10000000000000000000010001000001";
    sel   <= "00000";
    wait for 10ns;   
    
    input <= "10000000000000000000010001000001";
    sel   <= "11110";
    wait for 10ns;      
    wait;
    
end process;
end Behavioral;
