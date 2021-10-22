----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2021 02:45:20 PM
-- Design Name: 
-- Module Name: JR_control_unit_TB - Behavioral
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

entity JR_control_unit_TB is
--  Port ( );
end JR_control_unit_TB;

architecture Behavioral of JR_control_unit_TB is

    -- Input
    signal op : std_logic_vector (1 downto 0);
    signal func : std_logic_vector (5 downto 0);
    
    -- Output 
    signal jr : std_logic;
    
    component JR_control_unit
        port(
            AluOP : in std_logic_vector (1 downto 0);
            Func : in std_logic_vector (5 downto 0);
            JR_control : out std_logic register := '0'
        );
     end component;
begin

    JR_cntrl:JR_control_unit port map (
        AluOP => op,
        Func => func,
        JR_control => jr
    );
    
    TB : process 
    begin 
      
         op <= "10";
         func <= "001000"; 
         
         wait for 5ns;
         
         op <= "10";
         func <= "101011"; 
         
         wait for 5ns;
         
         op <= "10";
         func <= "000000"; 
         
         wait for 5ns;
         
         op <= "10";
         func <= "001000"; 
         
         wait for 5ns;
         
         wait;
     
    end process;

end Behavioral;
