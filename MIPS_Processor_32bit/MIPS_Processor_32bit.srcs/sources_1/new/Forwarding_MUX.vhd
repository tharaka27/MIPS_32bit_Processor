----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2021 03:31:23 PM
-- Design Name: 
-- Module Name: Forwarding_MUX - Behavioral
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

entity Forwarding_MUX is
  Port ( 
    A : in std_logic_vector (31 downto 0);
    B : in std_logic_vector (31 downto 0);
    C : in std_logic_vector (31 downto 0);
    Sel : in std_logic_vector (1 downto 0);
    Data_Out : out std_logic_vector (31 downto 0)
  );
end Forwarding_MUX;

architecture Behavioral of Forwarding_MUX is
    
    signal DataOut_1 : std_logic_vector (31 downto 0);
    signal DataOut_2 : std_logic_vector (31 downto 0);
    
    component MUX_busB_ALU
    port(
        A : in std_logic_vector (31 downto 0);
        B : in std_logic_vector (31 downto 0);
        Sel : in std_logic;
        Output : out std_logic_vector (31 downto 0)
    );
    end component;
    
begin
    
    MUX_A_B:MUX_busB_ALU port map (
        A => A,
        B => B,
        Sel => Sel(1),
        Output => DataOut_1
    );
    
    MUX_C_A:MUX_busB_ALU port map (
        A => C,
        B => A,
        Sel => Sel(1),
        Output => DataOut_2
    );
    
    MUX_ABC:MUX_busB_ALU port map (
        A => DataOut_1,
        B => DataOut_2,
        Sel => Sel(0),
        Output => Data_Out
    );

end Behavioral;