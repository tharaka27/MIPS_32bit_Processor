----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2021 01:49:51 PM
-- Design Name: 
-- Module Name: Shift_Left2 - Behavioral
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

entity Shift_Left2 is
  Port ( 
    A: in std_logic_vector (31 downto 0);
    Output : out std_logic_vector (31 downto 0)
  );
end Shift_Left2;

architecture Behavioral of Shift_Left2 is

begin
    
    Output (31 downto 2) <= A (29 downto 0);
    Output (1 downto 0) <= "00";

end Behavioral;
