----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/14/2021 07:53:41 PM
-- Design Name: 
-- Module Name: MUX_busB_ALU_TB - Behavioral
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

entity MUX_busB_ALU_TB is
--  Port ( );
end MUX_busB_ALU_TB;

architecture Behavioral of MUX_busB_ALU_TB is
    -- inputs
    signal num1 : std_logic_vector (31 downto 0);
    signal num2 : std_logic_vector (31 downto 0);
    signal sel : std_logic;
    
    -- output
    signal result : std_logic_vector (31 downto 0);
    
    component MUX_busB_ALU
        port(
            A : in std_logic_vector (31 downto 0);
            B : in std_logic_vector (31 downto 0);
            Sel : in std_logic;
            Output : out std_logic_vector (31 downto 0)
        );
     end component;
begin

    MUX_BUSb:MUX_busB_ALU port map (
        A => num1,
        B => num2,
        Sel => sel,
        Output => result
    );
    
    TB : process 
    begin 
      
     num1 <= "00000000000000000000000000000001";
     num2 <= "00000000000000000000000000000010"; 
     sel <= '1';
     
     wait for 5ns;
     
     num1 <= "00000000000000000000000000000101";
     num2 <= "00000000000000000000000000000011"; 
     sel <= '0';
     
     wait for 5ns;
     wait;
     
     end process;

end Behavioral;
