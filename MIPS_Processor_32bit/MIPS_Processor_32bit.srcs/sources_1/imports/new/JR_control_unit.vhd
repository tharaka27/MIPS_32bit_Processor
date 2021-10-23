----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2021 02:26:29 PM
-- Design Name: 
-- Module Name: JR_control_unit - Behavioral
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

entity JR_control_unit is
  Port (
    AluOP : in std_logic_vector (1 downto 0);
    Func : in std_logic_vector (5 downto 0);
    JR_control : out std_logic
   );
   
end JR_control_unit;

architecture Behavioral of JR_control_unit is
    
    signal t : std_logic_vector (7 downto 0);

begin
    
    t(7) <= AluOP (1);
    t(6) <= AluOP (0);
    t(5) <= Func(5);
    t(4) <= Func(4);
    t(3) <= Func(3);
    t(2) <= Func(2);
    t(1) <= Func(1);
    t(0) <= Func(0);
    
    process(t)
    begin
        case t is
            when "10001000" =>
                JR_control <= '1';
            when others =>
                JR_control <= '0';   
        end case;
    end process;

end Behavioral;
