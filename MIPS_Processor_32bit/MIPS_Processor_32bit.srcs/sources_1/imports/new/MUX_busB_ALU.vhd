----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/14/2021 07:33:19 PM
-- Design Name: 
-- Module Name: MUX_busB_ALU - Behavioral
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

entity MUX_busB_ALU is
  Port ( 
        A : in std_logic_vector (31 downto 0);
        B : in std_logic_vector (31 downto 0);
        Sel : in std_logic;
        Output : out std_logic_vector (31 downto 0)
      );
end MUX_busB_ALU;

architecture Behavioral of MUX_busB_ALU is
    component mux_2to1
    port(
        a : in std_logic;
        b : in std_logic;
        sel : in std_logic;
        output : out std_logic
    );
end component;
begin
    G_1: for i in 0 to 31 generate
    MUXi:mux_2to1 port map (
        a => A(i),
        b => B(i),
        sel => Sel,
        output => Output(i)
    );
end generate;

end Behavioral;
