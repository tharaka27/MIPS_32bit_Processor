----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/15/2021 01:10:55 PM
-- Design Name: 
-- Module Name: Sign_extend - Behavioral
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

entity Sign_extend is
  Port ( 
    A : in std_logic_vector (15 downto 0);
    Output : out std_logic_vector (31 downto 0)
  );
end Sign_extend;

architecture Behavioral of Sign_extend is

begin

    Output(31) <= a(15);
    Output(30) <= a(15);
    Output(29) <= a(15);
    Output(28) <= a(15);
    Output(27) <= a(15);
    Output(26) <= a(15);
    Output(25) <= a(15);
    Output(24) <= a(15);
    Output(23) <= a(15);
    Output(22) <= a(15);
    Output(21) <= a(15);
    Output(20) <= a(15);
    Output(19) <= a(15);
    Output(18) <= a(15);
    Output(17) <= a(15);
    Output(16) <= a(15);
    Output (15 downto 0) <= A;
    

end Behavioral;
