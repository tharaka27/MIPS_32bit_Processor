----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/14/2021 09:05:46 PM
-- Design Name: 
-- Module Name: ALU_control_Unit - Behavioral
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

entity ALU_control_Unit is
  Port ( 
    AluOP : in std_logic_vector (1 downto 0);
    Func : in std_logic_vector (5 downto 0);
    ALU_c : out std_logic_vector (1 downto 0) register := "00"
  );
end ALU_control_Unit;

architecture Behavioral of ALU_control_Unit is

    signal ALU_Control_in : std_logic_vector (7 downto 0);
    
begin

    ALU_Control_in(7) <= AluOP (1);
    ALU_Control_in(6) <= AluOP (0);
    ALU_Control_in(5) <= Func (5);
    ALU_Control_in(4) <= Func (4);
    ALU_Control_in(3) <= Func (3);
    ALU_Control_in(2) <= Func (2);
    ALU_Control_in(1) <= Func (1);
    ALU_Control_in(0) <= Func (0);
    
    process(ALU_Control_in)
    begin
    
            if ALU_Control_in(7 downto 6) = "11" then
                ALU_c <= "01";
            elsif ALU_Control_in(7 downto 6) = "00" then
                ALU_c <= "00";
            elsif ALU_Control_in(7 downto 6) = "01" then
                ALU_c <= "10";
            elsif ALU_Control_in = "10100000" then
                ALU_c <= "00";
            elsif ALU_Control_in = "10100010" then
                ALU_c <= "10";
            elsif ALU_Control_in = "10101010" then
                ALU_c <= "11";
            else
                ALU_c <= "00";
            end if;
     
    end process;

end Behavioral;
