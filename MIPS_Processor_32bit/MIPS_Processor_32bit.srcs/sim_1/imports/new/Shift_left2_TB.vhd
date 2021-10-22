----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2021 01:58:45 PM
-- Design Name: 
-- Module Name: Shift_left2_TB - Behavioral
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

entity Shift_left2_TB is
--  Port ( );
end Shift_left2_TB;

architecture Behavioral of Shift_left2_TB is

    -- Input
    signal num : std_logic_vector (31 downto 0);
    
    -- Output
    signal shift_num : std_logic_vector (31 downto 0);
    
    component Shift_Left2
        port(
            A : in std_logic_vector (31 downto 0);
            Output : out std_logic_vector (31 downto 0)
        );
     end component;
     
begin
    
    SHIFT_L:Shift_Left2 port map (
        A => num,
        Output => shift_num
    );
    
    TB : process 
    begin 
      
     num <= "00000000000000000000000000000001";
     
     wait for 5ns;
     
     num <= "00000000000000000000000000000101";
     
     wait for 5ns;
     
     num <= "11000000000000000000000000000000";
     
     wait for 5ns;
     
     num <= "10000000000000000000000000000000";
     
     wait for 5ns;
     
     num <= "11100000000000000000000000000000";
     
     wait for 5ns;
     
     wait;
     
     end process;

end Behavioral;
