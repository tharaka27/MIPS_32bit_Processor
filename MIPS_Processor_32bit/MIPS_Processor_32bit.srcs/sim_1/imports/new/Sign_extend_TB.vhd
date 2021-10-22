----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2021 01:32:54 PM
-- Design Name: 
-- Module Name: Sign_extend_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sign_extend_TB is
--  Port ( );
end Sign_extend_TB;

architecture Behavioral of Sign_extend_TB is
    -- Input
    signal num : std_logic_vector (15 downto 0);
    
    -- Output
    signal extended_num : std_logic_vector (31 downto 0);
    
    component Sign_extend
        port(
            A : in std_logic_vector (15 downto 0);
            Output : out std_logic_vector (31 downto 0)
        );
     end component;
    
begin
    SIGN_EXT:Sign_extend port map (
        A => num,
        Output => extended_num
    );
    
    TB : process 
    begin 
      
     num <= "0000000000001010";
     
     wait for 5ns;
     
     num <= "1000000000001111";
     
     wait for 5ns;
     wait;
     
     end process;

end Behavioral;
