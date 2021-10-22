----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2021 09:24:32 PM
-- Design Name: 
-- Module Name: ALU32bit_TB - Behavioral
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

entity ALU32bit_TB is
--  Port ( );
end ALU32bit_TB;

architecture Behavioral of ALU32bit_TB is
    
    -- inputs
    signal num1 : std_logic_vector (31 downto 0);
    signal num2 : std_logic_vector (31 downto 0);
    signal alu_c : std_logic_vector (1 downto 0);
    -- inout
    signal ovf : std_logic;
    -- outputs
    signal result : std_logic_vector (31 downto 0);
    signal carry_out : std_logic;
    signal neg : std_logic;
    signal z : std_logic;

   component ALU_32bit
   port(
       A : in std_logic_vector(31 downto 0);
       B : in std_logic_vector(31 downto 0);
       ALU_C : in std_logic_vector(1 downto 0);
       c_out : out std_logic;
       overflow : inout std_logic;
       negative : out std_logic;
       zero : out std_logic;
       output : inout std_logic_vector(31 downto 0)
   );
    end component;
    
begin

    ALU32:ALU_32bit port map (
        A => num1,
        B => num2,
        ALU_C => alu_c,
        c_out => carry_out,
        overflow => ovf,
        negative => neg,
        zero => z,
        output => result
    );
    
       TB : process 
    begin 
      
     num1 <= "00000000000000000000000000000001";
     num2 <= "00000000000000000000000000000010"; 
     alu_c <= "00";
     
     wait for 5ns;
     
     num1 <= "00000000000000000000000000000011";
     num2 <= "00000000000000000000000000000101"; 
     alu_c <= "10";
     
     wait for 5ns;
     
     num1 <= "00000000000000000000000000001011";
     num2 <= "00000000000000000000000000000101"; 
     alu_c <= "10";
     
     wait for 5ns;
     
     num1 <= "00000000000000000000000000000110";
     num2 <= "00000000000000000000000000000101"; 
     alu_c <= "01";
     
     wait for 5ns;
     
     num1 <= "00000000000000000000000000000101";
     num2 <= "00000000000000000000000000000011"; 
     alu_c <= "11";
     
     wait for 5ns;
     
     wait;
     
     end process;


end Behavioral;
