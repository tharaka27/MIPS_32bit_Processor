----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2021 09:36:22 PM
-- Design Name: 
-- Module Name: adder32bit_TB - Behavioral
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

entity adder32bit_TB is
--  Port ();
end adder32bit_TB;

architecture Behavioral of adder32bit_TB is
    -- inputs
    signal num1 : std_logic_vector (31 downto 0);
    signal num2 : std_logic_vector (31 downto 0);
    -- outputs
    signal sum : std_logic_vector (31 downto 0);
    signal carry_out : std_logic;
    
   component adder_32bit
   port(
       a : in std_logic_vector (31 downto 0);
       b : in std_logic_vector (31 downto 0);
       s : out std_logic_vector (31 downto 0);
       c_out : out std_logic
   );
    end component;

begin

    Adder:adder_32bit port map (
        a => num1,
        b => num2,
        s => sum,
        c_out => carry_out
    );
    
   TB : process 
   begin 
     
    num1 <= "00000000000000000000000000000001";
    num2 <= "00000000000000000000000000000010"; 
    
    wait for 5ns;
    num1 <= "00000000000000000000000000000010";
    num2 <= "00000000000000000000000000000101"; 
    
    wait for 5ns;
    num1 <= "00000000000000000000000000000110";
    num2 <= "00000000000000000000000000000101"; 
    
    wait;
    
    end process;

end Behavioral;
