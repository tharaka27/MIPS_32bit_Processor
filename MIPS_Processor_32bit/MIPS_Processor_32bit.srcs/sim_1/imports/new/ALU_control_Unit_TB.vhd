----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/14/2021 09:40:20 PM
-- Design Name: 
-- Module Name: ALU_control_Unit_TB - Behavioral
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

entity ALU_control_Unit_TB is
--  Port ( );
end ALU_control_Unit_TB;

architecture Behavioral of ALU_control_Unit_TB is
    -- input
    signal op : std_logic_vector (1  downto 0);
    signal func : std_logic_vector (5 downto 0);
    
    -- output
    signal result : std_logic_vector(1 downto 0);
    
    component ALU_control_Unit
        port(
            AluOP : in std_logic_vector (1 downto 0);
            Func : in std_logic_vector (5 downto 0);
            ALU_c : out std_logic_vector (1 downto 0) register := "00"
        );
     end component;

begin

    ALU_cntrl:ALU_control_Unit port map (
        AluOP => op,
        Func => func,
        ALU_c => result
    );
    
    TB : process 
    begin 
      
     op <= "11";
     func <= "111111"; 
     
     wait for 5ns;

     op <= "11";
     func <= "111001"; 
     
     wait for 5ns;

     op <= "11";
     func <= "010011"; 
     
     wait for 5ns;
     
     op <= "00";
     func <= "111111"; 
     
     wait for 5ns;
     
     op <= "00";
     func <= "000000"; 
     
     wait for 5ns;

     op <= "00";
     func <= "101010"; 
     
     wait for 5ns;
     
     op <= "01";
     func <= "111011"; 
     
     wait for 5ns;
     
     op <= "01";
     func <= "000011"; 
     
     wait for 5ns;
     
     op <= "01";
     func <= "010101"; 
     
     wait for 5ns;
     
     op <= "10";
     func <= "100000"; 
     
     wait for 5ns;
     
     op <= "10";
     func <= "100010"; 
     
     wait for 5ns;
     
     op <= "10";
     func <= "101010"; 
     
     wait for 5ns;
     
     op <= "10";
     func <= "111111"; 
     
     wait for 5ns;
     
     op <= "10";
     func <= "000000"; 
     
     wait for 5ns;
     
     wait;
     
     end process;

end Behavioral;
