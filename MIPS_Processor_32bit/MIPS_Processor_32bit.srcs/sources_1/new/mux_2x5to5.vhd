----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2021 10:49:41 AM
-- Design Name: 
-- Module Name: mux_2x5to5 - Behavioral
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

entity mux_2x5to5 is
  Port ( 
    Addr_0 : in std_logic_vector (4 downto 0);
    Addr_1 : in std_logic_vector (4 downto 0);
    Sel : in std_logic;
    Addr_out : out std_logic_vector (4 downto 0)
  );
end mux_2x5to5;

architecture Behavioral of mux_2x5to5 is

    component mux_2to1
        port(
        inA : in std_logic;
        inB : in std_logic;
        sel : in std_logic;
        output : out std_logic
    );
    end component; 
    
begin

    G_1: for i in 0 to 4 generate
    MUX_CELL:mux_2to1 port map (
        inA => Addr_0(i),
        inB => Addr_1(i),
        sel => Sel,
        output => Addr_out(i)
    );
    end generate;

end Behavioral;